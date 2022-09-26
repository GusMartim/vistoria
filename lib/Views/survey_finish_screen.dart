import 'package:vistoria/Models/order_model.dart';
import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class SurveyFinishScreen extends StatefulWidget {
  final String idSurvey;

  SurveyFinishScreen({required this.idSurvey});

  @override
  State<SurveyFinishScreen> createState() => _SurveyFinishScreenState();
}

class _SurveyFinishScreenState extends State<SurveyFinishScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  int order = 0;
  int nsurvey = 0;
  List imageList = [];
  OrderModel _orderModel = OrderModel();

  getNSurvey()async{
    DocumentSnapshot snapshot = await db
        .collection('surveys')
        .doc(widget.idSurvey)
        .get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      nsurvey = data?["Nsurvey"] ?? 0;
  });
    getOrder();
        }
  getOrder()async{
    DocumentSnapshot snapshot = await db
        .collection('surveyNumber')
        .doc('surveyNumber')
        .get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      order = data?["surveyNumber"] ?? 0;

    });
    _NSurveyValidation();
  }

  _NSurveyValidation()async{
    if(nsurvey == 0) {
      _orderModel.order = order + 1;
      nsurvey= order;
      _orderModel.Nsurvey = nsurvey + 1;
      await db
          .collection('surveys')
          .doc(widget.idSurvey)
          .set({'Nsurvey': _orderModel.Nsurvey},SetOptions(merge: true));
      await db
          .collection('surveyNumber')
          .doc('surveyNumber')
          .set({'surveyNumber': _orderModel.order}, SetOptions(merge: true))
          .then((value) => Navigator.pushReplacementNamed(context, '/main'));

      }else{
      Navigator.pushReplacementNamed(context, '/main');

    }

  }

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _dataImages();


  }


  bool loading = false;
  _dataImages() async {
    DocumentSnapshot snapshot =
    await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      imageList = data?["photoUrl"];
      Future.delayed(Duration(seconds: 5));
      loading = true;

    });

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
          text: 'VISTORIA FINALIZADA',
          size: 20.0,
          color: PaletteColors.white,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              TextCustom(
                text: "Fotos:",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 16,
              ),
              loading ==true ?Column(
                children: [
                  Container(
                    width:  width * 0.9,

                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 160,mainAxisExtent: 120,mainAxisSpacing: 10,childAspectRatio: 1.0),
                        itemCount: imageList.length,
                        itemBuilder: (context, index) {
                          return Container(


                              child: Image.network('${imageList[index]}'));
                        }),
                  ),
                  SizedBox(height: height * 0.01,)
                ],
              ):
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                CircularProgressIndicator(
                  color: PaletteColors.primaryColor),
                
              ],),
              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.greyInput,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.sim_card_download,
                        color: PaletteColors.primaryColor,
                      ),
                      constraints: BoxConstraints(
                          minHeight: 46,
                          minWidth: 46,
                          maxHeight: 46,
                          maxWidth: 46),
                      iconSize: 32.0,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextCustom(
                    text: "Salvar Documento",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.greyInput,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.shortcut_rounded,
                        color: PaletteColors.primaryColor,
                      ),
                      constraints: BoxConstraints(
                          minHeight: 46,
                          minWidth: 46,
                          maxHeight: 46,
                          maxWidth: 46),
                      iconSize: 32.0,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextCustom(
                    text: "Compartilhar",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.1, horizontal: 26.0),
                child: ButtonCustom(
                  widthCustom: 0.8,
                  heightCustom: 0.070,
                  onPressed: () => getNSurvey(),
                  text: "Finalizar",
                  size: 14.0,
                  colorButton: PaletteColors.primaryColor,
                  colorText: PaletteColors.white,
                  colorBorder: PaletteColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
