import 'package:url_launcher/url_launcher.dart';
import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';

import '../Models/ErrorStringModel.dart';
import '../Models/search_model_state.dart';

class ProfissionalScreen extends StatefulWidget {

  ProfissionalScreen();

  @override
  State<ProfissionalScreen> createState() => _ProfissionalScreenState();
}

class _ProfissionalScreenState extends State<ProfissionalScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List allresults= [];
  List list = [];
  List resultList = [];
  List<String> states = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];
  String? selectedState = 'GO';


  search(){
    resultSearchList();
  }

  resultSearchList(){
    var showResults = [];

    if(selectedState != null){
      for(var items in list){
        var brands= SearchModelRegion.fromSnapshot(items).region;

        if(brands.contains(selectedState!)){
          showResults.add(items);

        }
      }
    }else{
      showResults = List.from(list);
    }

    setState(() {
      resultList = showResults;
      print(selectedState);

    });
  }
  _getList() async{
    var userSurveysList = await db
        .collection("users")
        .get();
    setState(() {
      list = userSurveysList.docs;
    });

    resultSearchList();
    return "complete";

  }

  @override
  void initState() {
    // TODO: implement initState
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
          text: 'PROFISSIONAIS',
          size: 20.0,
          color: PaletteColors.white,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: height * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  SizedBox(width: width * 0.04),
                  Container(
                    width: width * 0.35,
                    child: TextCustom(
                      text: 'Filtrar por região:',
                      size: 14.0,
                      color: PaletteColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: width * 0.21,
                    height: 22,
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: PaletteColors.greyInput),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: states
                            .map((states) => DropdownMenuItem<String>(
                            value: states,
                            child: TextCustom(
                              text: states,
                              color: PaletteColors.grey,
                            )))
                            .toList(),
                        value: selectedState,
                        onChanged: (states) =>
                            setState(() {
                              selectedState = states;
                              resultSearchList();
                            } ),
                      ),
                    ),
                  ),
                ],),
                Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: width * 0.04),
                    Container(
                      width: width * 0.65,
                      child: TextCustom(
                        text: 'Nome',
                        size: 14.0,
                        color: PaletteColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      width: width * 0.15,
                      child: TextCustom(
                        text: 'Região',
                        size: 14.0,
                        color: PaletteColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.02),
                resultList.length == 0? Container():Container(

                  width: width ,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: resultList.length,
                    itemBuilder: (BuildContext context, index){
                      DocumentSnapshot UserSurvey = resultList[index];
                      String name = ErrorStringModel(UserSurvey, 'name');
                      String phone = ErrorStringModel(UserSurvey, 'phone');
                      String states = ErrorStringModel(UserSurvey, 'region');
                      return Container(
                        child: ListTile(
                          title: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: width * 0.65,
                                    child: TextCustom(
                                      text: name,
                                      size: 14.0,
                                      color: PaletteColors.bgColor,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.08,
                                    child: TextCustom(
                                      text: states,
                                      size: 14.0,
                                      color: PaletteColors.bgColor,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.start,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: width * 0.65,
                                    child: TextCustom(
                                      text: phone,
                                      size: 14.0,
                                      color: PaletteColors.bgColor,
                                      fontWeight: FontWeight.normal,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),

                              ],)
                            ],
                          ),
                        )
                        // ListTileCustom(
                        //   text: name,
                        //   phone: phone,
                        //   profile: category,
                        //   showIcons: rows[index].iconShow,
                        //   hovercolor: Colors.white,
                        //   onTap:(){
                        //     setState(() {
                        //       if (selectedRow == 0) {
                        //         selectedRow = selectedRow + 1;
                        //         rows[index].iconShow = true;
                        //       } else {
                        //         selectedRow = selectedRow - 1;
                        //         rows[index].iconShow = false;
                        //       }
                        //     });
                        //   },
                        //   onTapEdit: () async{
                        //
                        //
                        //     id = idUser;
                        //
                        //     DocumentSnapshot snapshot=
                        //     await db.collection("users").doc(idUser).get();
                        //     Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
                        //     setState(() {
                        //       _controllerName = TextEditingController(text: data?["name"]);
                        //       _controllerEmail = TextEditingController(text: data?["email"]);
                        //       _controllerPhone = TextEditingController(text: data?["phone"]);
                        //       _controllerPassword = TextEditingController(text: data?["password"]);
                        //       _controllerConfirmPassword = TextEditingController(text: data?["confirmPassword"]);
                        //       selectedProfile = data?["category"];
                        //       checkBoxvalue = data?["status"] == true? true:false;
                        //       edit= true;
                        //       enable = false;
                        //     });
                        //
                        //   },
                        //   onTapDelete: () {
                        //     db.collection("users").doc(idUser).delete().then((value) => Navigator.pushReplacementNamed(context, '/register'));
                        //
                        //   },
                        //
                        // ),
                      );
                    },


                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
