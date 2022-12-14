import 'package:url_launcher/url_launcher.dart';
import 'package:vistoria/Views/profissinals_screen.dart';

import '../Models/ErrorStringModel.dart';
import '../Utils/exports.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List list = [];
  _getList() async {
    var userDemandList = await db
        .collection("surveys")
        .where("status",isEqualTo: "demand")
        .where('userName',isEqualTo:FirebaseAuth.instance.currentUser!.displayName!)
        .where('notification',isEqualTo:'true')
        .get();
    setState(() {
      list = userDemandList.docs;
    });


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getList();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: PaletteColors.white,
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
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(2.5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                list.length!= 0?Container(
                  width: width * 1.2,
                  height: height * 0.08,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context,index){
                      DocumentSnapshot demandNotification = list[index];
                      String emissor = ErrorStringModel(demandNotification,'emissor');
                      String id = ErrorStringModel(demandNotification, 'idSurvey');
                      return  Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: (){
                            db.collection("surveys").doc(id).set({'notification': 'false'}, SetOptions(merge: true))
                            .then((value) => _getList().then((value) => Navigator.pushNamed(context, '/demanda',arguments: id)));
                          },
                          child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: PaletteColors.primaryColor),
                            child: TextCustom(
                              text: 'Você tem uma nova demanda criada por $emissor, clique aqui',
                              size: 12.0,
                              color: PaletteColors.white,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                      }),
                ):Container(),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 30,
                  ),
                  child: TextCustom(
                    text: FirebaseAuth.instance.currentUser != null?'Olá, ' +
                        FirebaseAuth.instance.currentUser!.displayName! +
                        '!':'Olá',
                    size: 14.0,
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
                      CustomCard(
                        text: "Nova Vistoria",
                        icon: Icons.list_rounded,
                        screen: Surveyscreen(
                            text: 'Nova Vistoria',
                            buttonText: 'Prosseguir',
                            id: ''),

                      )
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
                      CustomCard(
                          text: "Tutorial",
                          icon: Icons.branding_watermark_rounded,
                          screen: TutorialScreen(),
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
                        text: "Enviar Feedback",
                        icon: Icons.comment_rounded,
                        screen: FeedbackScreen(),
                      ),
                      CustomCard(
                          text: "Profissionais",
                          icon: Icons.contact_mail,
                          screen: ProfissionalScreen(),
                          ),
                    ],
                  ),
                ),
                Row(
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

                SizedBox(height: height * 0.01,)

              ]),
        ),
      ),
    );
  }
}
