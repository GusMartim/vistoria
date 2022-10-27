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
  String states = '';
  String adress ='';
  String type ='';
  String city ='';
  List pdfs =[];
  List urls = [];


  _getDemand() async{
    DocumentSnapshot snapshot =
    await db
        .collection("surveys")
        .doc(widget.id)
        .get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
    adress = data?["adress"];
    district = data?["district"];
    number = data?["number"];
    states = data?["estado"];
    city = data?["city"];
    type = data?["typesurvey"];
    pdfs = data?["pdfs"];
    urls= data?["pdfUrl"];
    local = '$adress,$number,$district\n - $city/$states';

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
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextCustom(
                        text: "Local:",
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        size: 14.0,
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: width * 0.7,
                      child: TextCustom(
                        text: '''$adress,$number,$district - $city/$states''',
                        maxLines: 3,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                        size: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextCustom(
                      text: "Tipo:",
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      size: 14.0,
                    ),
                    TextCustom(
                      text: "$type",
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                      size: 12.0,
                    ),
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
                      color: Colors.black54,
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
                  height: height* 0.2,
                  child: ListView.builder(
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

                                  await launchUrl(Uri.parse(url));
                                }

                              },
                              child: Row(
                                children: [
                                  Container(

                                    child:Text(
                                      '${pdfs[index].toString()}',
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 12.0,
                                        color: PaletteColors.grey,
                                        decoration: TextDecoration.underline,

                                      ),
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
                    TextCustom(
                      text: "Ver Mapa",
                      color: PaletteColors.grey,
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
                            minHeight: 45,
                            minWidth: 45,
                            maxHeight: 45,
                            maxWidth: 45),
                        iconSize: 35.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
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
                      onPressed: () => Navigator.pushNamed(context, '/main'),
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
      ),
    );
  }
}
