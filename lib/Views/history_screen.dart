import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var controller = StreamController<QuerySnapshot>.broadcast();
  List list = [];
  int selectedText = 0;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<ListTileModel> items = [];
  TextEditingController _controllerSearch = TextEditingController();
  

  _getList() async {
    var historyList = await db
        .collection("surveys")
        .where("idUser",isEqualTo: _auth.currentUser?.uid)
        .orderBy('hourRequest', descending: true)
        .get();
    setState(() {
      list = historyList.docs;
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
            text: 'HISTORICO',
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
              child: StreamBuilder (
                  stream: controller.stream,
                  builder: (context, snapshot) {
                    return list.length!= 0 ?ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot item = list[index];
                          items.add(ListTileModel(
                              text:
                                  '${item['adress']},${item['number']},${item['district']} -${item['city']}/${item['estado']}',
                              data: '${item['hourRequest']}',
                              iconShow: false));
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
                          );
                        }):Container();
                  }),
            )
          ],
        ));
  }
}
