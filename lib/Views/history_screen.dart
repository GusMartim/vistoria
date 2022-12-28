import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

import '../Models/search_model_adress.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var controller = StreamController<QuerySnapshot>.broadcast();
  List list = [];
  int selectedText = 0;
  FirebaseFirestore db = FirebaseFirestore.instance;
  List resultList = [];
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<ListTileModel> items = [];
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
    var historyList = await db
        .collection("surveys")
        .where("idUser",isEqualTo: _auth.currentUser?.uid)
        .where("status",isEqualTo: "survey")
        .orderBy('Nsurvey', descending: true)
        .get();
    setState(() {
      list = historyList.docs;
    });
    resultSearchList();
    return"complete";
  }
  _getListStream() async {
    final stream = db
        .collection("surveys")
        .where("idUser",isEqualTo: _auth.currentUser?.uid)
        .where("status",isEqualTo: "survey")
        .orderBy('hourRequest', descending: true).snapshots();
    stream.listen((history){
      controller.add(history);
    });
  }

  @override
  void initState() {
    super.initState();
    _getList();
    _getListStream();
    _controllerSearch.addListener(search);
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
            text: 'HISTORICO',
            size: 20.0,
            color: PaletteColors.white,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 4,left: 22, top: 10,bottom: 8),
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
              _controllerSearch.text.isEmpty?Container(
                height: height * 0.63,
                child: StreamBuilder (
                    stream: controller.stream,
                    builder: (context, snapshot) {
                      return list.length!= 0 ?Container(
                        height: height ,
                        child: ListView.builder(
                            
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot item = list[index];
                              items.add(ListTileModel(
                                  text:
                                      '${item['adress']??''},${item['number']??''},${item['district']??''} -${item['city']??''}/${item['estado']??''}',
                                  data: '${DateFormat('dd/MM/yyyy  HH:mm').format(item['hourRequest'].toDate().toLocal())??''}',
                                  iconShow: false, pdfUrl: '${item['savedPdf']??''}'));
                              return ListTileCustom(
                                text: items[index].text,
                                showIcons: items[index].iconShow,
                                onTap: () {
                                  setState(() {
                                    if (selectedText == 0) {
                                      selectedText = selectedText + 1;
                                      items[index].iconShow = true;
                                    } else {
                                      selectedText = selectedText - 1;
                                      items[index].iconShow = false;
                                    }
                                  });
                                },
                                data: items[index].data,
                                id: item['idSurvey'],
                                onTapPdf: () async {
                                  if (items[index].pdfUrl != '') {
                                    await launchUrl(Uri.parse(items[index].pdfUrl),mode:LaunchMode.externalNonBrowserApplication);
                                  }else{
                                    showSnackBar(context, 'Não há documento salvo',Colors.red);
                                  }
                                },
                              );
                            }),
                      ):Container();
                    }),
              ):Container(
                height: height * 0.63,
                child: resultList.length!= 0 ?ListView.builder(
                    
                    itemCount: resultList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot item = resultList[index];
                      items.add(ListTileModel(
                          text:
                          '${item['adress']},${item['number']},${item['district']} -${item['city']}/${item['estado']}',
                          data: '${DateFormat('dd/MM/yyyy  HH:mm').format(item['hourRequest'].toDate().toLocal())??''}',
                          iconShow: false, pdfUrl: '${item['savedPdf']??''}'));
                      return Column(
                        children: [
                          ListTileCustom(
                            text: '${item['adress']},${item['number']},${item['district']} -${item['city']}/${item['estado']}',
                            showIcons: items[index].iconShow,
                            onTap: () {
                              setState(() {
                                if (selectedText == 0) {
                                  selectedText = selectedText + 1;
                                  items[index].iconShow = true;
                                } else {
                                  selectedText = selectedText - 1;
                                  items[index].iconShow = false;
                                }
                              });
                            },
                            data: '${DateFormat('dd/MM/yyyy  HH:mm').format(item['hourRequest'].toDate().toLocal())??''}',
                            id: item['idSurvey'],
                            onTapPdf: () async {
                            if (items[index].pdfUrl != null) {
                              await launchUrl(Uri.parse(items[index].pdfUrl),mode:LaunchMode.externalApplication);
                            }
                          },
                          ),

                        ],
                      );
                    }):Container()
              ),


            ],
          ),
        ));
  }
}
