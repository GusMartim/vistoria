import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/list_tile_demand.dart';
import 'package:vistoria/Widgets/text_custom.dart';

import '../Models/list_tile_demand_model.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {

  List <ListTileDemandModel> items = [];
  List list= [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _controllerSearch = TextEditingController();

  _getList() async {
    var demandList = await db
        .collection("surveys")
        .where("status",isEqualTo: "demand")
        .where("userName",isEqualTo: _auth.currentUser?.displayName)
        .get();

    setState(() {
      list = demandList.docs;
      print(_auth.currentUser?.displayName);
      print(list.length);

    });
  }

  @override
  void initState() {
    super.initState();
    _getList();
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
            text: 'Demandas',
            size: 20.0,
            color: PaletteColors.white,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
              const EdgeInsets.only(right: 4,left: 22, top: 10,bottom: 14),
              child: InputRegister(
                  controller: _controllerSearch,
                  hint: "Pesquisar",
                  fonts: 14.0,
                  keyboardType: TextInputType.text,
                  width: width * 2.0,
                  sizeIcon: 25.0,
                  icons: (Icons.search_rounded),
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput),
            ),
            Container(
              height: height * 0.5,
              child:list.length!= 0 ?ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot item = list[index];
                          items.add(ListTileDemandModel(
                              text:
                              '${item['adress']},${item['number']},${item['district']} -${item['city']}/${item['estado']}',
                              id: '${item['idSurvey']}',
                              ));
                          return ListTileDemand(
                            text: items[index].text,
                            id: items[index].id,
                            onTap: ()=> Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (_) => Surveyscreen(
                                        text: 'Nova Vistoria',
                                        buttonText: 'Prosseguir',
                                        id: items[index].id),
                                )
                            ),


                          );
                        }):Container()

            )




            // Center(
            //   child: Column(
            //     children: [
            //       Container(
            //         height: height * 0.5,
            //         child: ListView.builder(
            //           // scrollDirection: Axis.vertical,
            //           // physics: NeverScrollableScrollPhysics(),
            //           // shrinkWrap: true,
            //           // padding: const EdgeInsets.symmetric(
            //           //     vertical: 2.0, horizontal: 10.0),
            //           itemCount: list.length,
            //           itemBuilder: (context, index) {
            //             DocumentSnapshot item = list[index];
            //             items.add(ListTileDemand(text: '${item['adress']},${item['number']},${item['district']} -${item['city']}/${item['estado']}', id: item['idSurvey']));
            //             print(items[index].text);
            //             print(items[index].id);
            //             return GestureDetector(
            //               onTap:() => Navigator.push(context,
            //                   MaterialPageRoute(
            //                     builder: (_) => Surveyscreen(
            //                         text: 'Nova Vistoria',
            //                         buttonText: 'Prosseguir',
            //                         id: items[index].id),
            //                   )
            //               ),
            //               child: TextCustom(
            //                 text: items[index].text,
            //                 size: 20.0,
            //                 color: PaletteColors.white,
            //                 fontWeight: FontWeight.bold,
            //                 textAlign: TextAlign.center,
            //               ),
            //
            //             );
            //
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ));
  }
}
