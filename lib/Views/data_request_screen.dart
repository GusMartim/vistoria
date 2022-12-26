import 'package:url_launcher/url_launcher.dart';
import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class DataRequest extends StatefulWidget {
  final id;
  DataRequest({required this.id});

  @override
  State<DataRequest> createState() => _DataRequestState();
}

class _DataRequestState extends State<DataRequest> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String local = '';
  String district= '';
  String number = '';
  String emissor = '';
  String states = '';
  String adress ='';
  String type ='';
  String city ='';
  String contato ='';
  String telefone ='';
  List pdfs =[];
  List urls = [];
  double? lat= 0.0;
  double? lng = 0.0;
  TextEditingController _controllerObs = TextEditingController();

  void launchGoogleMaps() async {
    var url =
        'google.navigation:q=${lat.toString()},${lng.toString()}';
    var fallbackUrl =
        'https://www.google.com/maps/search/?api=1&query=${lat.toString()},${lng.toString()}';
    try {
      bool launched =
      await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }
  _getDemand() async{
    DocumentSnapshot snapshot =
    await db
        .collection("surveys")
        .doc(widget.id)
        .get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
    _controllerObs = TextEditingController(text: data?["obs"]??'');
    adress = data?["adress"]??'';
    district = data?["district"]??'';
    number = data?["number"]??'';
    states = data?["estado"]??'';
    telefone = data?["telefone"]??'';
    contato = data?["contato"]??'';
    city = data?["city"]??'';
    type = data?["typesurvey"]??'';
    emissor = data?["emissor"]??'';
    if(data?["pdfs"] == null){
      pdfs = [];
    }else{
      pdfs = data?["pdfs"];
    }if(data?["pdfUrl"] == null){
      urls = [];
    }else{
      urls = data?["pdfUrl"];
    }

    print("chegou1");
    if(data?["lat"] == ''){
      lat =0.0;
    }
    else{
      lat = double.parse(data?["lat"]);
    } if(data?["lng"] == ''){
      lng =0.0;
    }
    else{
      lng = double.parse(data?["lng"]);
    }
    local = '''$adress, $number, $district - $city/$states ''';

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
    _getDemand();

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: PaletteColors.white,
      appBar: AppBar(
        backgroundColor: PaletteColors.bgColor,
        iconTheme: IconThemeData(
          color: PaletteColors.white,
        ),
        elevation: 0,
        title: TextCustom(
          text: 'DEMANDA',
          size: 20.0,
          color: PaletteColors.white,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 4.0, horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextCustom(
                      text: '''Emissor:''',
                      color: PaletteColors.bgColor,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      size: 14.0,
                      maxLines: 4,
                    ),
                  ),
                  Container(
                    width: width * 0.55,
                    child: TextCustom(
                      text: emissor,
                      color: PaletteColors.bgColor,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                      size: 14.0,
                      maxLines: 4,
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   width: width * 0.7,
                  //   child: TextCustom(
                  //     text: '''$adress,$number,$district - $city/$states''',
                  //     maxLines: 3,
                  //     color: PaletteColors.bgColor,
                  //     fontWeight: FontWeight.normal,
                  //     textAlign: TextAlign.start,
                  //     size: 12.0,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextCustom(
                      text: '''Local:\n ''',
                      color: PaletteColors.bgColor,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      size: 14.0,
                      maxLines: 4,
                    ),
                  ),
                  Container(
                    width: width * 0.7,
                    child: TextCustom(
                      text: '''${''' $adress, $number, \n $district - $city/$states'''}''',
                      color: PaletteColors.bgColor,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                      size: 14.0,
                      maxLines: 4,
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   width: width * 0.7,
                  //   child: TextCustom(
                  //     text: '''$adress,$number,$district - $city/$states''',
                  //     maxLines: 3,
                  //     color: PaletteColors.bgColor,
                  //     fontWeight: FontWeight.normal,
                  //     textAlign: TextAlign.start,
                  //     size: 12.0,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextCustom(
                    text: "Tipo: ",
                    color: PaletteColors.bgColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    size: 14.0,
                  ),
                  TextCustom(
                    text: "$type",
                    color: PaletteColors.bgColor,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                    size: 14.0,
                  ),
                  // TextCustom(
                  //   text: "$type",
                  //   color: PaletteColors.bgColor,
                  //   fontWeight: FontWeight.normal,
                  //   textAlign: TextAlign.start,
                  //   size: 12.0,
                  // ),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextCustom(
                    text: "Anexos",
                    color: PaletteColors.bgColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    size: 14.0,
                  ),
                ],
              ),
              SizedBox(height: 10),
              pdfs.length == 0? Container()
                  :Container(
                width: width * 0.7,
                height:pdfs.length * height * 0.07,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: pdfs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: ()async{
                              print('${urls[index].toString()}');
                              if (urls.length != 0) {
                                String url = '${urls[index].toString()}';
                                print(Uri.parse(urls[index]));
                                await launchUrl(Uri.parse(urls[index]),mode: LaunchMode.externalApplication);
                              }
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: width * 0.65,
                                  child:Text(
                                    '${pdfs[index].toString()}',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 12.0,
                                      color: PaletteColors.bgColor,
                                      decoration: TextDecoration.underline,


                                    ),
                                    maxLines: 3,
                                  ),

                                  // TextCustom(
                                  //   text:
                                  //   '${pdfs[index].toString()}',
                                  //   size: 16.0,
                                  //   color:
                                  //   PaletteColors.primaryColor,
                                  //   textAlign:
                                  //   TextAlign.start,
                                  //   fontWeight:
                                  //   FontWeight.normal,
                                  // ),
                                ),
                                SizedBox(height: height* 0.04)
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 6),
              Divider(
                thickness: 1,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                        child: TextCustom(
                          text: "Obs:",
                          color: PaletteColors.bgColor,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                          size: 14.0,
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        width: width * 0.8,
                        child: TextCustom(
                          text: '''${_controllerObs.text}''',
                          color: PaletteColors.bgColor,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          size: 14.0,
                          maxLines: 10,
                        ),
                      ),


                    ],
                  )
                ],
              ),
              Divider(
                thickness: 1,
              ),
              Row(
                children: [
                  TextCustom(
                    text: "Contato:",
                    color: PaletteColors.bgColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    size: 14.0,
                  ),
                  TextCustom(
                    text: "$contato",
                    color: PaletteColors.bgColor,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                    size: 14.0,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),

              Row(
                children: [
                  TextCustom(
                    text: "Telefone:",
                    color: PaletteColors.bgColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    size: 14.0,
                  ),
                  TextCustom(
                    text: "$telefone",
                    color: PaletteColors.bgColor,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                    size: 14.0,
                  ),
                  SizedBox(width: 6),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.greyInput,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: PaletteColors.primaryColor,
                      ),
                      constraints: BoxConstraints(
                          minHeight: 35,
                          minWidth: 35,
                          maxHeight: 35,
                          maxWidth: 35),
                      iconSize: 25.0,
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        if(telefone!=''){
                          var splitted = telefone.replaceAll('-','').replaceAll('(','').replaceAll(')','').trim();
                          var url ="tel:+55$splitted";
                          await launchUrl(Uri.parse(url));
                        }else{
                          showSnackBar(context, 'Preencha o campo Telefone',Colors.red);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),

              Row(
                children: [
                  TextCustom(
                    text: "Ver Mapa",
                    color: PaletteColors.bgColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    size: 14.0,
                  ),
                  SizedBox(width: 6),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.greyInput,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.location_on,
                        color: PaletteColors.primaryColor,
                      ),
                      constraints: BoxConstraints(
                          minHeight: 35,
                          minWidth: 35,
                          maxHeight: 35,
                          maxWidth: 35),
                      iconSize: 25.0,
                      padding: EdgeInsets.zero,
                      onPressed: () => launchGoogleMaps(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonCustom(
                    widthCustom: 0.7,
                    heightCustom: 0.07,
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Surveyscreen(
                                text: 'Vistoriar Demanda',
                                buttonText: 'Continuar',
                                id: widget.id
                            )
                        )

                    ),
                    text: "Vistoriar",
                    size: 14.0,
                    colorButton: PaletteColors.primaryColor,
                    colorText: PaletteColors.white,
                    colorBorder: PaletteColors.primaryColor,
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
