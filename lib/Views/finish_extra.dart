import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:vistoria/Models/order_model.dart';
import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';
import 'package:pdf/widgets.dart' as pdfLib;

class SurveyFinishScreenExtra extends StatefulWidget {
  final String idSurvey;

  SurveyFinishScreenExtra({required this.idSurvey});

  @override
  State<SurveyFinishScreenExtra> createState() => _SurveyFinishScreenExtraState();
}

class _SurveyFinishScreenExtraState extends State<SurveyFinishScreenExtra> {
  final storageRef = FirebaseStorage.instance.ref();
  Uint8List? bytes;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  int order = 0;
  int nsurvey = 0;
  var priceSurvey = '';
  int contador = 0;
  List Nsurveys = [];
  var path = '';
  var plano = '';
  var valor = '';
  OrderModel _orderModel = OrderModel();
  final Map<String, dynamic> data = HashMap();
  String status = "survey";
  var surveyType = '';
  var Cod = '';
  var street = '';
  var complement = '';
  var SDivisaoInterna = '';
  var number = '';
  var district = '';
  var city = '';
  var states = '';
  var cep = '';
  var sPathology = '';
  var sType = '';
  var sInfra = '';
  var sSituation = '';
  var sQuota = '';
  var sPosition = '';
  var sRoof = '';
  var sWall = '';
  var sInternPaint = '';
  var sPaint = '';
  var sExtern = '';
  var sFloor = '';
  var sIntern = '';
  var sWindows = '';
  var sBalcony = '';
  var sSwitchBoard = '';
  var sKitchen = '';
  var sBathroom = '';
  var sTank = '';
  var sPattern = '';
  var sState = '';
  var sUnityroof = '';
  var sBlock = '';
  var obs = '';
  var age = '';
  var price = '';
  var lat = '';
  var lng = '';
  var date;
  var user = '';
  var adress = '';
  var SRoom = '';
  var SSocialBathroom = '';
  var SPrivateBathroom = '';
  var SLav = '';
  var SServiceBathroom = '';
  var SMaidRoom = '';
  var SBalcony = '';
  var SCompleteCabinets = '';
  var SKitchen = '';
  var SRestRoom = '';
  var SServiceAreaRoofed = '';
  var SServiceAreaUnroofed = '';
  var SOpenGarage = '';
  var SClosedGarage = '';
  var SAc = '';
  var SPool = '';
  var AreaC = '';
  var AreaD = '';
  var AreaT = '';
  var TotalArea = '';
  var Goal = '';
  var Origin = '';
  var contact = '';
  var phone = '';
  List imageList = [];
  List paint = [];
  List wall = [];
  List roof = [];
  List position = [];
  List quota = [];
  List situation = [];
  List infra = [];
  List internpaint = [];
  List windows = [];
  List state = [];
  List pattern = [];
  List saveChecklist = [];
  _getData() async {
    DocumentSnapshot snapshot =
    await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    setState(() {
      saveChecklist = data?["checklist"];
    });
    if(saveChecklist.length != 0){
      infra.clear();
      for (int i = 0; i <= 8; i++) {
        var splitted = saveChecklist[i].replaceAll("1", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          infra.add(title);
        }
      }
      situation.clear();
      for (int i = 9; i <= 12; i++) {
        var splitted = saveChecklist[i].replaceAll("2", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          situation.add(title);
        }
      }
      quota.clear();
      for (int i = 13; i <= 16; i++) {
        var splitted = saveChecklist[i].replaceAll("3", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          quota.add(title);
        }
      }
      position.clear();
      for (int i = 17; i <= 22; i++) {
        var splitted = saveChecklist[i].replaceAll("4", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          position.add(title);
        }
      }
      roof.clear();
      for (int i = 23; i <= 27; i++) {
        var splitted = saveChecklist[i].replaceAll("5", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          roof.add(title);
        }
      }
      wall.clear();
      for (int i = 28; i <= 31; i++) {
        var splitted = saveChecklist[i].replaceAll("6", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          wall.add(title);
        }
      }
      paint.clear();
      for (int i = 32; i <= 37; i++) {
        var splitted = saveChecklist[i].replaceAll("7", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          paint.add(title);
        }
      }
      internpaint.clear();
      for (int i = 38; i <= 43; i++) {
        var splitted = saveChecklist[i].replaceAll("8", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          internpaint.add(title);
        }
      }
      windows.clear();
      for (int i = 44; i <= 47; i++) {
        var splitted = saveChecklist[i].replaceAll("9", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          windows.add(title);
        }
      }
      state.clear();
      for (int i = 48; i <= 54; i++) {
        var splitted = saveChecklist[i].replaceAll("10", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          state.add(title);
        }
      }
      pattern.clear();
      for (int i = 55; i <= 62; i++) {
        var splitted = saveChecklist[i].replaceAll("11", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        if (check == 'true') {
          pattern.add(title);
        }
      }
    }
    setState(() {

      age = data?["age"] ?? "";
      price = data?["price"] ?? "";
      sPathology = data?["Pathology"] ?? "";
      sType = data?["type"] ?? "";
      sInfra = data?["infra"] ?? "";
      sSituation = data?["situation"] ?? "";
      sQuota = data?["quota"] ?? "";
      sPosition = data?["unPosition"] ?? "";
      sRoof = data?["roof"] ?? "";
      sWall = data?["wall"] ?? "";
      sInternPaint = data?["internPaint"] ?? "";
      sPaint = data?["externPaint"] ?? "";
      sExtern = data?["externDoors"] ?? "";
      sFloor = data?["floor"] ?? "";
      sIntern = data?["internDoors"] ?? "";
      sWindows = data?["windowns"] ?? "";
      sBalcony = data?["balcony"] ?? "";
      sSwitchBoard = data?["switchboard"] ?? "";
      sKitchen = data?["kitchen"] ?? "";
      sBathroom = data?["bathroom"] ?? "";
      sTank = data?["tank"] ?? "";
      sPattern = data?["pattern"] ?? "";
      sState = data?["state"] ?? "";
      sUnityroof = data?["unRoof"] ?? "";
      sBlock = data?["block"] ?? "";
      obs = data?["obs"] ?? "";
      date = data?["hourRequest"].toDate() ?? DateTime.now();
      user = data?["userName"] ?? "";
      lat = data?["lat"] ?? "";
      lng = data?["lng"] ?? "";
      SRoom = data?["rooms"] ?? "";
      SSocialBathroom = data?["socialbathrooms"] ?? "";
      SPrivateBathroom = data?["privatebathrooms"] ?? "";
      SLav = data?["lavs"] ?? "";
      SServiceBathroom = data?["servicebathrooms"] ?? "";
      SMaidRoom = data?["maidrooms"] ?? "";
      SBalcony = data?["balconys"] ?? "";
      SCompleteCabinets = data?["completecontainers"] ?? "";
      SKitchen = data?["kitchens"] ?? "";
      SRestRoom = data?["restrooms"] ?? "";
      SServiceAreaRoofed = data?["servicearearoofed"] ?? "";
      SServiceAreaUnroofed = data?["serviceareaunroofed"] ?? "";
      SClosedGarage = data?["garageroofed"] ?? "";
      SOpenGarage = data?["garageunroofed"] ?? "";
      SAc = data?["acs"];
      SPool = data?["pools"];
      street = data?["adress"] ?? "";
      number = data?["number"] ?? "";
      district = data?["district"] ?? "";
      city = data?["city"] ?? "";
      states = data?["estado"] ?? "";
      cep = data?["cep"] ?? "";
      imageList = data?["photoUrl"] ?? [];
      Cod = data?["userCode"] ?? '';
      AreaT = data?["TerrainArea"] ?? '';
      AreaD = data?["OpenArea"] ?? '';
      AreaC = data?["ClosedArea"] ?? '';
      TotalArea = data?["TotalArea"] ?? '';
      surveyType = data?["typesurvey"] ?? '';
      Goal = data?["Goal"] ?? '';
      Origin = data?["Origin"] ?? '';
      phone = data?["telefone"] ?? '';
      contact = data?["contato"] ?? '';
      complement = data?["complement"] ?? '';
      SDivisaoInterna = data?["divisaointerna"] ?? '';
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
              child: pdfLib.Text(surveyType == 'Dados'?'Vistoria de Dados'
                  :'Vistoria Infrutifera',
                  textAlign: pdfLib.TextAlign.left,
                  style: pdfLib.TextStyle(
                      fontSize: 10,
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
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $date',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
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
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $user',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                        children: [
                          pdfLib.Container(

                            child: pdfLib.Text(
                              'Endereço:',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 8.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            child: pdfLib.Text(
                              ' $street, $number,$complement,$district - $city/$states - $cep',

                              textAlign: pdfLib.TextAlign.left,
                              maxLines: 2,
                              style: pdfLib.TextStyle(
                                  fontSize: 8.0,
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
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $age',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
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
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $price',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
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
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $Cod',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ])
                  ]),
              pdfLib.SizedBox(width: 25),
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
                              fontSize: 8.0,
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
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $lat',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
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
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $lng',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),

                  ]),
              pdfLib.SizedBox(width: 10),
              pdfLib.Column(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                  crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                  children: [
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Contato:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $contact',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.normal),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Telefone:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $phone',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.normal),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Finalidade:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $Goal',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Origem da Informação:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $Origin',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Área Coberta/Fechada:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $AreaC',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Área Coberta/Aberta:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $AreaD',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
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
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $AreaT',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                    ]),
                    pdfLib.Row(children: [
                      pdfLib.Container(
                        child: pdfLib.Text(
                          'Área Total:',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
                              font: ttf,
                              fontWeight: pdfLib.FontWeight.bold),
                        ),
                      ),
                      pdfLib.Container(
                        child: pdfLib.Text(
                          ' $TotalArea',
                          textAlign: pdfLib.TextAlign.left,
                          style: pdfLib.TextStyle(
                              fontSize: 8.0,
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
                      width: 100,
                      child: pdfLib.Text(
                        'Infraestrutura',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: infra.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 100,
                                child:
                                pdfLib.Text(
                                  '${infra[index].toString()}',

                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 100,
                      child: pdfLib.Text(
                        sInfra,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                      width: 80,
                      child: pdfLib.Text(
                        'Situação',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: situation.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 80,
                                child:
                                pdfLib.Text(
                                  '${situation[index].toString()}',

                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 80,
                      child: pdfLib.Text(
                        sSituation,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                      width: 70,
                      child: pdfLib.Text(
                        'Cota/Greide',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: quota.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 70,
                                child:
                                pdfLib.Text(
                                  '${quota[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 70,
                      child: pdfLib.Text(
                        sQuota,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                        'Posição da Unidade',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: position.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 85,
                                child:
                                pdfLib.Text(
                                  '${position[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 85,
                      child: pdfLib.Text(
                        sPosition,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                      width: 80,
                      child: pdfLib.Text(
                        'Telhado',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: roof.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 80,
                                child:
                                pdfLib.Text(
                                  '${roof[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 80,
                      child: pdfLib.Text(
                        sRoof,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                      width: 65,
                      child: pdfLib.Text(
                        'Muro',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: wall.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 65,
                                child:
                                pdfLib.Text(
                                  '${wall[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 65,
                      child: pdfLib.Text(
                        sWall,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                      width: 80,
                      child: pdfLib.Text(
                        'Pintura Externa',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: paint.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 80,
                                child:
                                pdfLib.Text(
                                  '${paint[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 80,
                      child: pdfLib.Text(
                        sPaint,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                        'Pintura Interna',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: internpaint.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 80,
                                child:
                                pdfLib.Text(
                                  '${internpaint[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 80,
                      child: pdfLib.Text(
                        sInternPaint,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                      width: 65,
                      child: pdfLib.Text(
                        'Janelas',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: windows.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 65,
                                child:
                                pdfLib.Text(
                                  '${windows[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 65,
                      child: pdfLib.Text(
                        sWindows,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                        'Padrão de Acabamento',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                                width: 120,
                                child:
                                pdfLib.Text(
                                  '${pattern[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 120,
                      child: pdfLib.Text(
                        sPattern,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
                        'Estado de Conservação',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.ListView.builder(
                        itemCount: state.length,
                        itemBuilder: (context,index){
                          return
                            pdfLib.Container(
                                width: 120,
                                child:
                                pdfLib.Text(
                                  '${state[index].toString()}',
                                  textAlign: pdfLib.TextAlign.left,
                                  style: pdfLib.TextStyle(
                                      fontSize: 8.0,
                                      font: ttf,
                                      fontWeight: pdfLib.FontWeight.bold),
                                )
                            );
                        }
                    ),
                    pdfLib.Container(
                      width: 120,
                      child: pdfLib.Text(
                        sState,
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.normal
                        ),
                      ),
                    )
                  ]
              ),
              pdfLib.Container(
                child: pdfLib.Column(
                  children: [
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Divisão Interna',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Quartos',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Banheiros Sociais',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Banheiros Privativos',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Lavabos',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Banheiros de Serviço',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Quartos de Empregada',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Varanda/Sacada',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Número de armários completos',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Cozinha',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Sala',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Área de Serviço Coberta',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Área de Serviço Descoberta',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Garagem Coberta',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Garagem Descoberta',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Ar condicionado',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 120,
                      height: 15,
                      child: pdfLib.Text(
                        'Piscina',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 130,
                      height: 15,
                      child: pdfLib.Text(
                        'Outro:',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 09.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      width: 130,
                      height: 15,
                      child: pdfLib.Text(
                        SDivisaoInterna,
                        textAlign: pdfLib.TextAlign.left,
                        maxLines: 5,
                        style: pdfLib.TextStyle(
                            fontSize: 09.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pdfLib.Container(
                child: pdfLib.Column(
                  children: [
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SRoom',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SSocialBathroom',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SPrivateBathroom',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SLav',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SServiceBathroom',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SMaidRoom',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child:pdfLib.Text(
                        '$SBalcony',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SCompleteCabinets',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SKitchen',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SRestRoom',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SServiceAreaRoofed',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SServiceAreaUnroofed',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SOpenGarage',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SClosedGarage',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SAc',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                    pdfLib.Container(
                      height: 15,
                      child: pdfLib.Text(
                        '$SPool',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
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
                      child: pdfLib.Text(
                        'Observações:',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
                            font: ttf,
                            fontWeight: pdfLib.FontWeight.bold),
                      ),
                    ),
                    pdfLib.Container(
                      child: pdfLib.Text(
                        '$obs',
                        textAlign: pdfLib.TextAlign.left,
                        style: pdfLib.TextStyle(
                            fontSize: 8.0,
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
    DocumentSnapshot link = await db.collection("link").doc("links").get();
    Map<String, dynamic>? linkData = link.data() as Map<String, dynamic>?;
    DocumentSnapshot snapshot =
    await db.collection('users').doc(_auth.currentUser?.uid).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      Nsurveys = data?["nsurveys"] ?? [];
      priceSurvey = linkData?["Valor Vistoria"]?? '0';
      contador = data?["contadorVistorias"]?? 0;
      plano = data?["plano"]?? '';
      valor = data?["valor"]?? '0';
    });

    setState(() {
      double price = double.parse(valor.replaceAll("R\$",'').replaceAll(',','.'));
      double surveyPrice =double.parse(priceSurvey.replaceAll("R\$",'').replaceAll(',','.'));
      valor = "R\$ ${price + surveyPrice}";
      Nsurveys.add(order + 1);
    });
    await db.collection('users').doc(_auth.currentUser?.uid).update({
      "nsurveys": Nsurveys.toSet().toList(),
    });
    Map<String, dynamic> mapVistorias = {
      'contadorVistorias': contador+ 1
    };

    await db
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(mapVistorias,SetOptions(merge: true));
    _NSurveyValidation();
  }

  _NSurveyValidation() async {
    if(plano == "Vistoriador"){
      Map<String, dynamic> mapValor = {
        'valor': valor
      };
      db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(mapValor,SetOptions(merge: true));
    }



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
                  ? TextCustom(
                text: "Não há imagens salvas",
                size: 14.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              )
                  : TextCustom(
                text: "Fotos:",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              imageList.length == 0?Container():Column(
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
                            mainAxisExtent: 200,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
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
                                                widthCustom: 0.25,
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
                                                  }).then((value) {
                                                    setState(() {
                                                      imageList.remove(
                                                          imageList[index]);
                                                    });

                                                    Navigator.of(
                                                        context)
                                                        .pop();

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
                                              SizedBox(width: width * 0.07),
                                              ButtonCustom(
                                                widthCustom: 0.25,
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
              ),

              SizedBox(
                height: 100,
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
