import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:vistoria/Models/order_model.dart';
import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';
import 'package:pdf/widgets.dart' as pdfLib;

class SurveyFinishScreenLote extends StatefulWidget {
  final String idSurvey;

  SurveyFinishScreenLote({required this.idSurvey});

  @override
  State<SurveyFinishScreenLote> createState() => _SurveyFinishScreenLoteState();
}

class _SurveyFinishScreenLoteState extends State<SurveyFinishScreenLote> {
  final storageRef = FirebaseStorage.instance.ref();
  Uint8List? bytes;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  int order = 0;
  int nsurvey = 0;
  var path = '';
  List Nsurveys = [];
  OrderModel _orderModel = OrderModel();
  final Map<String, dynamic> data = HashMap();
  String status = "survey";
  var surveyType = '';
  var Cod = '';
  var street='';
  var number='';
  var complement='';
  var district ='';
  var city ='';
  var states= '';
  var cep = '';
  var obs= '';
  var age= '' ;
  var price= '';
  var lat= '';
  var lng= '';
  var date= '';
  var user= '';
  var adress= '';
  var factors= '';
  var AreaT= '';
  var Goal= '';
  var Origin= '';
  var sType= '';
  var sShape= '';
  var sSituation= '';
  var sTopography= '';
  var sClosing= '';
  var sLocalization= '';
  var sUse= '';
  var sPattern= '';
  var sRatings= '';
  var sDensity= '';
  var sTransport= '';
  var contato = '';
  var telefone = '';
  List imageList = [];
  List terrainType = [];
  List terrainShape = [];
  List terrainSituation = [];
  List topography = [];
  List terrainClosing = [];
  List localization = [];
  List use = [];
  List pattern = [];
  List ratings = [];
  List density = [];
  List transport = [];
  List rates =[];
  List saveChecklist = [];
  List saveRatings = [];
  _getData() async {
    DocumentSnapshot snapshot =
    await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    setState(() {
      saveChecklist = data?["checklist"];
      saveRatings = data?["ratings"];
    });
    if(saveChecklist.length != 0){
      terrainType.clear();
      for (int i = 0; i <= 3; i++) {
        var splitted = saveChecklist[i].replaceAll("1", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          terrainType.add(title);
        }
      }
      terrainShape.clear();
      for (int i = 4; i <= 8; i++) {
        var splitted = saveChecklist[i].replaceAll("2", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          terrainShape.add(title);
        }
      }
      terrainSituation.clear();
      for (int i = 9; i <= 12; i++) {
        var splitted = saveChecklist[i].replaceAll("3", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          terrainSituation.add(title);
        }
      }
      topography.clear();
      for (int i = 13; i <= 20; i++) {
        var splitted = saveChecklist[i].replaceAll("4", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          topography.add(title);
        }
      }
      terrainClosing.clear();
      for (int i = 21; i <= 25; i++) {
        var splitted = saveChecklist[i].replaceAll("5", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          terrainClosing.add(title);
        }
      }
      localization.clear();
      for (int i = 26; i <= 29; i++) {
        var splitted = saveChecklist[i].replaceAll("6", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          localization.add(title);
        }
      }
      use.clear();
      for (int i = 30; i <= 34; i++) {
        var splitted = saveChecklist[i].replaceAll("7", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          use.add(title);
        }
      }
      pattern.clear();
      for (int i = 35; i <= 39; i++) {
        var splitted = saveChecklist[i].replaceAll("8", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          pattern.add(title);
        }
      }
      ratings.clear();
      for (int i = 40; i <= 43; i++) {
        var splitted = saveChecklist[i].replaceAll("9", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          ratings.add(title);
        }
      }
      density.clear();
      for (int i = 44; i <= 47; i++) {
        var splitted = saveChecklist[i].replaceAll("10", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          density.add(title);
        }
      }
      transport.clear();
      for (int i = 48; i <= 52; i++) {
        var splitted = saveChecklist[i].replaceAll("11", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if(check == 'true'){
          transport.add(title);
        }
      }
    }
    if (saveRatings.length != 0) {
      rates.clear();
      for( int i = 0; i < saveRatings.length; i++){
        var splitted = saveRatings[i].split('#');
        var title =  splitted[0];
        var check1 = splitted[1];
        var check2 = splitted[2];
        var check3 = splitted[3];
        if(check1 == 'true'){
          rates.add(title + ' - ' +'Satisfatório');
        };
        if(check2 == 'true'){
          rates.add(title + ' - ' +'Precário');
        };
        if(check3 == 'true'){
          rates.add(title + ' - ' +'Não disponível');
        };


      }
    }

    setState(() {
      age = data?["age"]??"";
      contato = data?["contato"] ?? "";
      telefone = data?["telefone"] ?? "";
      complement = data?["complement"]??"";
      price = data?["price"]??"";
      obs = data?["obs"]??"";
      date = data?["hourRequest"]??"";
      user = data?["userName"]??"";
      lat = data?["lat"]??"";
      lng = data?["lng"]??"";
      street =data?["adress"]??"";
      number =data?["number"]??"";
      district=data?["district"]??"";
      city=data?["city"]??"";
      states=data?["estado"]??"";
      cep=data?["cep"]??"";
      imageList = data?["photoUrl"]??[];
      Cod = data?["userCode"]??'';
      AreaT = data?["TerrainArea"]??'';
      sType= data?["type"]??'';
      sShape= data?["shape"]??'';
      sSituation= data?["situation"]??'';
      sTopography= data?["topography"]??'';
      sClosing= data?["terrainClosing"]??'';
      sLocalization= data?["localization"]??'';
      sUse= data?["use"]??'';
      sPattern= data?["pattern"]??'';
      sDensity= data?["density"]??'';
      surveyType = data?["typesurvey"] ?? '';
      sTransport= data?["transport"]??'';
      sRatings= data?["rating"]??'';
      factors = data?["factors"]??"";
    });
    _createPdf(context);

  }

  FirebaseStorage storage = FirebaseStorage.instance;
  _createPdf(BuildContext context) async {
    print('entrou');
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    double width = 80;
    final font = await rootBundle.load("assets/fonts/Nunito-Regular.ttf");
    final ttf = pdfLib.Font.ttf(font);
    int lines = 32;
    int pages = (saveChecklist.length / lines).round() + 1;
    print('lenght');
    print(saveChecklist.length);
    int pag = 0;
    pdf.addPage(pdfLib.MultiPage(
        margin: pdfLib.EdgeInsets.all(6.0),
        build: (context) => [
          pdfLib.Container(
              child: pdfLib.Text('Vistoria Lote',
                  textAlign: pdfLib.TextAlign.left,
                  style: pdfLib.TextStyle(
                      fontSize: 14,
                      font: ttf,
                      fontWeight: pdfLib.FontWeight.bold))),
          pdfLib.Row(
            mainAxisAlignment: pdfLib.MainAxisAlignment.start,
            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
            children: [
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Data:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $date',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Vistoriador:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $user',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Endereço:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $street, $number,$complement, $district - $city/$states - $cep',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Idade:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $age',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Valor:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $price',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Cod:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $Cod',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ])
                  ]),
              pdfLib.SizedBox(width: 50),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Coordenadas:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Latitude:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $lat',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Longitude:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $lng',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Área do Terreno/Testada:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $AreaT',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 9.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Contato:',

                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 09.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $contato',

                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 09.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Telefone:',

                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 09.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $telefone',

                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 09.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                  ]),
            ],
          ),
          pdfLib.Divider(),
          pdfLib.Row(
            mainAxisAlignment: pdfLib.MainAxisAlignment.start,
            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
            children: [
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 80,
                      child: pdfLib.Text(
                        'Tipo de Terreno',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: terrainType.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 80,
                                child:
                                pdfLib.Text(
                                  '${terrainType[index].toString()}',

                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 80,
                      child: pdfLib.Text(
                        sType,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 85,
                      child: pdfLib.Text(
                        'Formato do Terreno',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: terrainShape.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 85,
                                child:
                                pdfLib.Text(
                                  '${terrainShape[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 85,
                      child: pdfLib.Text(
                        sShape,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 75,
                      child: pdfLib.Text(
                        'Situação',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: terrainSituation.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 75,
                                child:
                                pdfLib.Text(
                                  '${terrainSituation[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 75,
                      child: pdfLib.Text(
                        sSituation,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 115,
                      child: pdfLib.Text(
                        'Topografia',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: topography.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 115,
                                child:
                                pdfLib.Text(
                                  '${topography[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 115,
                      child: pdfLib.Text(
                        sTopography,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 115,
                      child: pdfLib.Text(
                        'Fechamento do Terreno',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: terrainClosing.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 115,
                                child:
                                pdfLib.Text(
                                  '${terrainClosing[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 115,
                      child: pdfLib.Text(
                        sClosing,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 120,
                      child: pdfLib.Text(
                        'Localização da Unidade',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: localization.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 120,
                                child:
                                pdfLib.Text(
                                  '${localization[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 120,
                      child: pdfLib.Text(
                        sLocalization,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),

            ],
          ),
          pdfLib.Divider(),
          pdfLib.Row(
            mainAxisAlignment: pdfLib.MainAxisAlignment.start,
            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
            children: [
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 80,
                      child: pdfLib.Text(
                        'Uso Predominante',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: use.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 80,
                                child:
                                pdfLib.Text(
                                  '${use[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 80,
                      child: pdfLib.Text(
                        sUse,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 140,
                      child: pdfLib.Text(
                        'Padrão Usual de Acabamento',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: pattern.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 140,
                                child:
                                pdfLib.Text(
                                  '${pattern[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 140,
                      child: pdfLib.Text(
                        sPattern,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 140,
                      child: pdfLib.Text(
                        'Avaliação da Localização',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: ratings.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 140,
                                child:
                                pdfLib.Text(
                                  '${ratings[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 140,
                      child: pdfLib.Text(
                        sRatings,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 130,
                      child: pdfLib.Text(
                        'Densidade de Ocupação',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: density.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 130,
                                child:
                                pdfLib.Text(
                                  '${density[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 130,
                      child: pdfLib.Text(
                        sDensity,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 95,
                      child: pdfLib.Text(
                        'Transporte Coletivo',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: transport.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 95,
                                child:
                                pdfLib.Text(
                                  '${transport[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 95,
                      child: pdfLib.Text(
                        sTransport,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),

            ],
          ),
          pdfLib.Divider(),
          pdfLib.Row(
            children: [
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(

                      child: pdfLib.Text(
                        'Soluções de infra-estrutura disponíveis junto à unidade, serviços e equipamentos comunitários no entorno',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: rates.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 150,
                                child:
                                pdfLib.Text(
                                  '${rates[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 9.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                  ]
              ),

            ]
          ),
          pdfLib.Divider(),
          pdfLib.Row(
              mainAxisAlignment: pdfLib.MainAxisAlignment.start,
              crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
            children: [
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      width: 90,
                      child: pdfLib.Text(
                        'Fatores desvalorizantes na região:',
                        textAlign: pdfLib.TextAlign.left,
                        maxLines: 2,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold),
                      ),
                    ),
                    pdfLib.Container(
                      width: 90,
                      child: pdfLib.Text(
                        '$factors',
                        textAlign: pdfLib.TextAlign.left,
                        maxLines: 4,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold),
                      ),
                    ),
                  ]),
              pdfLib.SizedBox(width: 20),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Container(
                      child: pdfLib.Text(
                        'Observações:',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold),
                      ),
                    ),
                    pdfLib.Container(
                      child: pdfLib.Text(
                        '$obs',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 9.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold),
                      ),
                    ),
                  ]),
            ]
          )

        ]));
    pag = pag + lines;

    final String dir = (await getApplicationDocumentsDirectory()).path;
    path = '$dir/Vistoria$surveyType.pdf';
    final File file = File(path);

    file.writeAsBytesSync(pdf.save());
    Uint8List archive = await file.readAsBytes();
    if (archive!.isNotEmpty) {
      Reference pastaRaiz = storage.ref();
      Reference arquivo =
      pastaRaiz.child("surveys").child("Vistoria$surveyType" +"N_OS_$Cod" + ".pdf");
      await arquivo
          .putData(archive,
          SettableMetadata(contentType: 'application/octet-stream'))
          .then((upload) async {
        upload.ref.getDownloadURL().then((value) {
          Map<String, dynamic> dateUpdate = {
            'savedPdf': value.toString(),
            'idSurvey': widget.idSurvey
          };
          db
              .collection("surveys")
              .doc(widget.idSurvey)
              .set(dateUpdate, SetOptions(merge: true));
        });
      });
    }
  }


  getNSurvey() async {
    DocumentSnapshot snapshot =
    await db.collection('surveys').doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      nsurvey = data?["Nsurvey"] ?? 0;
    });
    getOrder();
  }

  getOrder() async {
    DocumentSnapshot snapshot =
    await db.collection('surveyNumber').doc('surveyNumber').get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      order = data?["surveyNumber"] ?? 0;
    });
    _getStatus();
  }

  _getStatus() async {
    _orderModel.status = status;
    await db
        .collection('surveys')
        .doc(widget.idSurvey)
        .update({'status': _orderModel.status});

    _getUserNSurvey();
  }

  _getUserNSurvey() async {
    DocumentSnapshot snapshot =
    await db.collection('users').doc(_auth.currentUser?.uid).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      Nsurveys = data?["nsurveys"] ?? [];
    });
    print(Nsurveys.length);
    setState(() {
      Nsurveys.add(order + 1);
    });
    await db.collection('users').doc(_auth.currentUser?.uid).update({
      "nsurveys": Nsurveys.toSet().toList(),
    });
    _NSurveyValidation();
  }

  _NSurveyValidation() async {
    print(order);
    print(nsurvey);

    if (nsurvey == 0) {
      _orderModel.order = order + 1;
      nsurvey = order;
      _orderModel.Nsurvey = nsurvey + 1;

      await db
          .collection('surveys')
          .doc(widget.idSurvey)
          .set({'Nsurvey': _orderModel.Nsurvey}, SetOptions(merge: true));

      await db.collection('surveyNumber').doc('surveyNumber').set({
        'surveyNumber': _orderModel.order
      }, SetOptions(merge: true)).then(
              (value) => Navigator.pushReplacementNamed(context, '/main'));
    } else {
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataImages();
    _getData();

  }

  bool loading = true;
  _dataImages() async {
    DocumentSnapshot snapshot =
    await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      imageList = data?["photoUrl"]??[];
    });

    setState(() {
      loading = false;
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
              imageList.length == 0
                  ? Container()
                  : TextCustom(
                text: "Fotos:",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 16,
              ),
              loading == false
                  ? Column(
                children: [
                  Container(
                    width: width * 0.9,
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 120,
                            mainAxisExtent: 160,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 1.0),
                        itemCount: imageList.length,
                        itemBuilder: (context, index) {
                          return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Ink(
                                    decoration: ShapeDecoration(
                                      color: PaletteColors.white,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                      constraints: BoxConstraints(
                                          minHeight: 14,
                                          minWidth: 14,
                                          maxHeight: 14,
                                          maxWidth: 14),
                                      iconSize: 14.0,
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        AlertModel().alert(
                                            'Deseja realmente apagar essa imagem?',
                                            '',
                                            PaletteColors.primaryColor,
                                            PaletteColors.grey,
                                            context, [
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(width: width * 0.04),
                                              ButtonCustom(
                                                widthCustom: 0.3,
                                                heightCustom: 0.085,
                                                onPressed: () {
                                                  db
                                                      .collection('surveys')
                                                      .doc(widget.idSurvey)
                                                      .update({
                                                    'photoUrl': FieldValue
                                                        .arrayRemove([
                                                      imageList[index]
                                                    ])
                                                  }).then((value) =>
                                                      Navigator.of(
                                                          context)
                                                          .pop());
                                                  setState(() {
                                                    imageList.remove(
                                                        imageList[index]);
                                                  });
                                                },
                                                text: "Sim",
                                                size: 14.0,
                                                colorButton: PaletteColors
                                                    .primaryColor,
                                                colorText:
                                                PaletteColors.white,
                                                colorBorder: PaletteColors
                                                    .primaryColor,
                                              ),
                                              SizedBox(width: width * 0.04),
                                              ButtonCustom(
                                                widthCustom: 0.3,
                                                heightCustom: 0.085,
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(),
                                                text: "Não",
                                                size: 14.0,
                                                colorButton:
                                                PaletteColors.white,
                                                colorText: PaletteColors
                                                    .primaryColor,
                                                colorBorder: PaletteColors
                                                    .primaryColor,
                                              ),
                                            ],
                                          ),
                                        ]);
                                      },
                                    ),
                                  ),
                                  Image.network('${imageList[index]}'),
                                ],
                              ));
                        }),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  )
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  imageList.length == 0
                      ? Container()
                      : CircularProgressIndicator(
                      color: PaletteColors.primaryColor),
                ],
              ),
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
                      onPressed: () => Navigator.push(
                          context,MaterialPageRoute(builder: (context) => PDFScreen(path))),
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

class PDFScreen extends StatelessWidget {
  PDFScreen(this.pathPDF);

  final String pathPDF;

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text('Vistoria'),
          actions: [
            IconButton(
                onPressed: () {
                  ShareExtend.share(pathPDF, 'file',
                      sharePanelTitle: "Enviar PDF");
                },
                icon: Icon(Icons.share))
          ],
        ),
        path: pathPDF);
  }
}
