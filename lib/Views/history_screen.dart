import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class HistoryScreen extends StatefulWidget {
  final String idSurvey;
  HistoryScreen({required this.idSurvey});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int selectedText = 0;
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<ListTileModel> items = [
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
    ListTileModel(
        text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
        data: '20/04/2022  16:00',
        iconShow: false),
  ];
  TextEditingController _controllerAdress = TextEditingController();
  TextEditingController _controllerNumber = TextEditingController();
  TextEditingController _controllerDistrict = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController _controllerState = TextEditingController();
  TextEditingController _controllerDate = TextEditingController();
  _getData()async{
    DocumentSnapshot snapshot =
    await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String,dynamic>? data = snapshot.data() as Map<String,dynamic>?;
    setState(() {
      _controllerAdress = data?["adress"];
      _controllerNumber = data?["number"];

      _controllerDistrict = data?["district"];
      _controllerCity = data?["city"];
      _controllerState = data?["state"];
      _controllerDate =data?["hourRequest"];

    });
    QuerySnapshot querySnapshot = await db.collection("surveys").get();
    var list = querySnapshot;
  }
  @override
  void initState() {
    super.initState();

    _getData();

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: InputRegister(
                      controller: _controllerAdress,
                      hint: "Pesquisar",
                      fonts: 14.0,
                      keyboardType: TextInputType.text,
                      width: width * 2.0,
                      sizeIcon: 25.0,
                      icons: (Icons.search_rounded),
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput),
                ),
                SingleChildScrollView(
                    child: Column(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 10.0),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTileCustom(
                            text: (items[index].text),
                            data: (items[index].data),
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
                            });
                      },
                    ),
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}
