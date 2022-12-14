import 'package:url_launcher/url_launcher.dart';
import 'package:vistoria/Views/profissinals_screen.dart';
import '../Models/ErrorStringModel.dart';
import '../Utils/exports.dart';
import '../Utils/sharedPref.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List list = [];
  final PrefService _prefService = PrefService();
  bool canSurvey = true;
  var controller = StreamController<QuerySnapshot>.broadcast();
  var vencimento;
  var dataPlano;
  var order;
  var plano;
  var typePlan;
  var name = '';
  var idUser = '';
  List <String> NSurvey = [];
  List nsurveys = [];
  var contador;
  var category;
  var youtube;
  var qtdSurveyIntermediario;
  var qtdSurveyCompleto;

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
  _getList() async {
    var userDemandList = await db
        .collection("surveys")
        .where("status",isEqualTo: "demand")
        .where('userName',isEqualTo:name)
        .where('notification',isEqualTo:'true')
        .get();
    setState(() {
      list = userDemandList != null ?userDemandList.docs:list;
    });
  }
  _getListStream() async {
    final stream = db
        .collection("surveys")
        .where("userName",isEqualTo: name)
        .where("status",isEqualTo: "demand")
        .where('notification',isEqualTo:'true')
        .orderBy('hourRequest', descending: true).snapshots();

    stream.listen((demandas){
      controller.add(demandas);
    });
  }
  getOrder() async {
    ("entrou offline 1");
    DocumentSnapshot snapshot =
    await db.collection('surveyNumber').doc('surveyNumber').get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      order = data?["surveyNumber"] ?? 0;
      _prefService.createCacheOrder(order.toString());
    });
  }
  _getInfo()async {
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      DocumentSnapshot link = await db.collection("link").doc("links").get();
      Map<String, dynamic>? linkData = link.data() as Map<String, dynamic>?;
      DocumentSnapshot snapshot = await db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid).get();
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      setState(() {
        contador = data?["contadorVistorias"] ?? 0;
        vencimento = data?['dataVencimento'];
        nsurveys = data?['nsurveys']??[];
        dataPlano = data?['dataPlano'];
        plano = data?['plano'] ?? "Vistoriador";
        typePlan = data?['planType'] ?? "Mensal";
        category = data?['category'] ?? "Vistoriador";
        qtdSurveyIntermediario = linkData?['Quantidade Vistoria Intermediario'];
        qtdSurveyCompleto = linkData?['Quantidade Vistoria Completo'];
        name = data?["name"];
        idUser = data?["idUser"];
        _prefService.createCacheContador(contador.toString());

        _prefService.createCacheTipo(plano);
        for(int i = 0;i < nsurveys.length; i++){
          NSurvey.add(nsurveys[i].toString());
        }
        _prefService.createCacheNSurvey(NSurvey);
        _prefService.createCacheNome(name);
        _prefService.createCacheIdUser(idUser);

      });

      DateTime dateTime = vencimento.toDate();
      DateTime planTime = dataPlano.toDate();
      if (category != "Administrador") {
          if (plano == "Proprietario" && contador > qtdSurveyCompleto) {
            setState(() {
              canSurvey = false;
              showSnackBar(context, 'Voc?? atingiu o limite de vistorias mensal', Colors.red);
            });
          }
          if (plano == "Vistoriador" && contador > qtdSurveyIntermediario) {
            setState(() {
              canSurvey = false;
            });
            showSnackBar(context, 'Voc?? atingiu o limite de vistorias mensal', Colors.red);
          }
        if (dateTime.difference(DateTime.now())
            .inDays < 0) {
          setState(() {
            canSurvey = false;
            plano = "Vistoriador";
          });
          showSnackBar(context, 'Seu plano expirou', Colors.red);
          Map<String, dynamic> mapVistorias = {
            'plano': plano
          };
          await db
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set(mapVistorias, SetOptions(merge: true));
        }
      }

      _getListStream();
      _getList();
    }else{
      if(plano == "Vistoriador"){
        setState(() {
          canSurvey = false;
        });
        showSnackBar(context, 'Seu plano n??o pode realizar vistorias offline', Colors.red);
      }
      _prefService.readCacheContador('Order').then((value) {
        print(value);

      });
      _prefService.readCacheNSurvey('NSurvey').then((value) {
        print(value);

      });
      _prefService.readCacheContador('contador').then((value) {
        print(value);

      });
      _prefService.readCacheNome('nome').then((value) {
        print(value);
        name = value;

      });
    }

  }

  _getLink()async{
    DocumentSnapshot snapshot = await db.collection("link").doc('links').get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      youtube = data?["Tutorial"];
      print(youtube);
    });
  }


  @override
  void initState() {
    super.initState();
    getOrder();
    _getInfo();
    _getLink();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: PaletteColors.white,
      bottomSheet:  Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: width * 0.04),
            Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.whatsapp_rounded,color: PaletteColors.primaryColor,size: 30),
                  onPressed: () async{
                    await launchUrl(Uri.parse('https://wa.me/5562996116494/'),mode: LaunchMode.externalApplication);
                  },
                )),
            GestureDetector(
              onTap: ()async {
                await launchUrl(Uri.parse('https://wa.me/5562996116494/'),mode: LaunchMode.externalApplication);
              },
              child: Container(
                height: height * 0.06,
                alignment: Alignment.bottomCenter,
                child: TextCustom(
                  text: 'Consultoria',
                  size: 12.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Spacer(),
            Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.logout,color: PaletteColors.primaryColor,size: 30),
                  onPressed: ()=>FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.pushReplacementNamed(context, '/login')),
                )),
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.15,
                width: width * 0.15,
                child: Image.asset("assets/image/logo_light.png"),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(2.5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
             Container(
                  width: width * 1.2,
                  height: height * 0.08,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: controller.stream,
                    builder: (context,snapshot){

                      QuerySnapshot? querySnapshot = snapshot.data;

                      if(querySnapshot == null){
                      return Container();
                      }else {
                        return Container(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.hasError ? 0 : querySnapshot
                                  ?.docs.length,
                              itemBuilder: (context, index) {
                                List <DocumentSnapshot> doc = querySnapshot!
                                    .docs.toList() ?? [];
                                DocumentSnapshot demandNotification = doc[index];
                                String emissor = ErrorStringModel(
                                    demandNotification, 'emissor');
                                String id = ErrorStringModel(
                                    demandNotification, 'idSurvey');
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      db.collection("surveys").doc(id).set(
                                          {'notification': 'false'},
                                          SetOptions(merge: true))
                                          .then((value) =>
                                          _getList().then((value) =>
                                              Navigator.pushNamed(
                                                  context, '/demanda',
                                                  arguments: id)));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              5),
                                          color: PaletteColors.primaryColor),
                                      child: TextCustom(
                                        text: 'Voc?? tem uma nova demanda criada por $emissor, clique aqui',
                                        size: 12.0,
                                        color: PaletteColors.white,
                                        fontWeight: FontWeight.bold,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 30,
                  ),
                  child: TextCustom(
                    text: 'Ol??, $name',
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCard(
                          text: "Demandas",
                          icon: Icons.add_location_rounded,
                          screen: RequestScreen()),
                      canSurvey == true?CustomCard(
                        text: "Nova Vistoria",
                        icon: Icons.list_rounded,
                        screen: Surveyscreen(
                            text: 'Nova Vistoria',
                            buttonText: 'Prosseguir',
                            id: ''),

                      ):Container(
                        margin: EdgeInsets.all(8.0) ,
                        height: height * 0.2,
                        width: width * 0.4,
                        child: GestureDetector(
                          onTap: (){
                            showSnackBar(context, 'seu plano chegou ao fim, re-contrate ou de um upgrade no nosso site', Colors.red);
                          },
                          child: Card(
                            elevation: 4,
                            color: PaletteColors.greyInput,
                            shadowColor: PaletteColors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.list_rounded, color: PaletteColors.lightGrey,
                                  size: 40.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextCustom(
                                      text:'Nova Vistoria',
                                      color: PaletteColors.grey,
                                      size: 12.0,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )
                              ],
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCard(
                          text: "Historico",
                          icon: Icons.window_outlined,
                          screen: HistoryScreen(),
                          ),
                  Container(
                    margin: EdgeInsets.all(8.0) ,
                    height: height * 0.15,
                    width: width * 0.35,
                    child: GestureDetector(
                      onTap: () async{

                        if(await canLaunchUrl(Uri.parse('$youtube'))){
                          await launchUrl(Uri.parse('$youtube'),mode: LaunchMode.externalApplication);
                        };
                      },
                      child: Card(
                        elevation: 4,
                        color: PaletteColors.greyInput,
                        shadowColor: PaletteColors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.screenshot_monitor, color: PaletteColors.lightGrey,
                              size: 40.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextCustom(
                                  text:'Tutorial',
                                  color: PaletteColors.grey,
                                  size: 12.0,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )
                          ],
                        ),

                      ),
                    ),
                  ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.all(8.0) ,
                          height: height * 0.15,
                          width: width * 0.35,
                          child: GestureDetector(
                            onTap: () async{
                              Uri uri = Uri(
                                scheme: 'mailto',
                                path: 'teia.laudo@gmail.com',
                                query: encodeQueryParameters(<String, String>{
                                  'subject': 'Feedback Teia Vistoria',
                                  'body' : 'Digite aqui sua mensagem para n??s'
                                }),
                              );
                              await launchUrl(uri,mode: LaunchMode.externalApplication);
                            },
                            child: Card(
                              elevation: 4,
                              color: PaletteColors.greyInput,
                              shadowColor: PaletteColors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(Icons.message, color: PaletteColors.lightGrey,
                                    size: 40.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextCustom(
                                        text:'Enviar Feedback',
                                        color: PaletteColors.grey,
                                        size: 12.0,
                                        fontWeight: FontWeight.bold,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  )
                                ],
                              ),

                            ),
                          )
                      ),


                      // CustomCard(
                      //   text: "Enviar Feedback",
                      //   icon: Icons.comment_rounded,
                      //   screen: FeedbackScreen(),
                      // ),
                      CustomCard(
                          text: "Profissionais",
                          icon: Icons.contact_mail,
                          screen: ProfissionalScreen(),
                          ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.01,)
              ]),
        ),
      ),
    );
  }
}
