import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/list_tile_demand.dart';
import 'package:vistoria/Widgets/text_custom.dart';

import '../Models/list_tile_demand_model.dart';
import '../Models/search_model_adress.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {

  List <ListTileDemandModel> items = [];
  List list= [];
  List resultList = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _controllerSearch = TextEditingController();

  search(){
    resultSearchList();
  }

  resultSearchList() {
    var showResults = [];

    if (_controllerSearch.text != '') {
      for (var words in list) {
        var brands = SearchModelAdress.fromSnapshot(words).adress.toLowerCase();

        if (brands.contains(_controllerSearch.text.toLowerCase())) {
          showResults.add(words);
        }
      }
    } else {
      showResults = List.from(list);
    }
    setState(() {
      resultList = showResults;
      print(_controllerSearch.text);
    });
  }
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
    resultSearchList();
    return"complete";
  }

  @override
  void initState() {
    super.initState();
    _getList();
    _controllerSearch.addListener(search);
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
        body: SingleChildScrollView(
          child: Column(
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
                height: height * 0.8,
                child:resultList.length!= 0 ?ListView.builder(
                          itemCount: resultList.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot item = resultList[index];
                            items.add(ListTileDemandModel(
                                text:
                                '${item['adress']},${item['number']},${item['district']} -${item['city']}/${item['estado']}',
                                id: '${item['idSurvey']}',
                                ));
                            return Column(
                              children: [
                                ListTileDemand(
                                  text:  '${item['adress']},${item['number']},${item['district']} -${item['city']}/${item['estado']}',
                                  id: '${item['idSurvey']}',
                                  onTap: ()=> Navigator.pushNamed(context, '/demanda', arguments: '${item['idSurvey']}'),
                                ),
                                Divider()
                              ],
                            );
                          }):Container()

              )




              // Center(
              //   child: Column(
              //     children: [
              //       Container(
              //         height: height * 0.8,
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
          ),
        ));
  }
}
