import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:vistoria/Models/order_model.dart';
import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';
import 'package:pdf/widgets.dart' as pdfLib;

class SurveyFinishScreenApt extends StatefulWidget {
  final String idSurvey;

  SurveyFinishScreenApt({required this.idSurvey});

  @override
  State<SurveyFinishScreenApt> createState() => _SurveyFinishScreenAptState();
}

class _SurveyFinishScreenAptState extends State<SurveyFinishScreenApt> {
  var street;
  var Cod;
  var number;
  var district;
  var city;
  var states;
  var surveyType;
  var cep;
  var sPathology;
  var sType;
  var sInfra;
  var sSituation;
  var sQuota;
  var sPosition;
  var sRoof;
  var sWall;
  var sInternPaint;
  var sPaint;
  var sExtern;
  var sFloor;
  var sIntern;
  var sWindows;
  var sBalcony;
  var sSwitchBoard;
  var sKitchen;
  var sBathroom;
  var sUnity;
  var sView;
  var sUnPosition;
  var sTank;
  var sPattern;
  var sState;
  var sUnityroof;
  var sBlock;
  var age;
  var price;
  var lat;
  var lng;
  var date;
  var user;
  var adress;
  var SRoom;
  var SPavs;
  var SElevators;
  var SAge;
  var SAptos;
  var SUnitys;
  var SSocialBathroom;
  var SPrivateBathroom;
  var SLav;
  var SServiceBathroom;
  var SMaidRoom;
  var SBalcony;
  var SCompleteCabinets;
  var SKitchen;
  var SRestRoom;
  var SServiceAreaRoofed;
  var SServiceAreaUnroofed;
  var SOpenGarage;
  var SClosedGarage;
  var SAc;
  var SPool;
  var condPrice;
  var admin;
  var phone;
  var Origin;
  var Final;
  var IPavs;
  var Area;
  var Obs;
  var complement;

  List imageList = [];
  List pathology = [];
  List paint = [];
  List wall = [];
  List roof = [];
  List position = [];
  List quota = [];
  List situation = [];
  List infra = [];
  List type = [];
  List switchboard = [];
  List balcony = [];
  List internpaint = [];
  List windows = [];
  List intern = [];
  List floor = [];
  List extern = [];
  List unityroof = [];
  List state = [];
  List pattern = [];
  List tank = [];
  List bathroom = [];
  List kitchen = [];
  List unity = [];
  List view = [];
  List unposition = [];
  List block = [];
  List saveChecklist = [];
  final storageRef = FirebaseStorage.instance.ref();
  Uint8List? bytes;

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  int order = 0;
  int nsurvey = 0;
  List Nsurveys = [];
  OrderModel _orderModel = OrderModel();
  final Map<String, dynamic> data = HashMap();
  String status = "survey";
  _getData() async {
    DocumentSnapshot snapshot =
    await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    setState(() {
      saveChecklist = data?["checklist"];
    });
    pathology.clear();
    for (int i = 0; i <= 5; i++) {
      var splitted = saveChecklist[i].replaceAll("1", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        pathology.add(title);
      }
    }
    type.clear();
    for (int i = 6; i <= 9; i++) {
      var splitted = saveChecklist[i].replaceAll("2", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        type.add(title);
      }
    }
    infra.clear();
    for (int i = 10; i <= 18; i++) {
      var splitted = saveChecklist[i].replaceAll("3", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        infra.add(title);
      }
    }
    situation.clear();
    for (int i = 19; i <= 22; i++) {
      var splitted = saveChecklist[i].replaceAll("4", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        situation.add(title);
      }
    }
    quota.clear();
    for (int i = 23; i <= 26; i++) {
      var splitted = saveChecklist[i].replaceAll("5", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        quota.add(title);
      }
    }
    wall.clear();
    for (int i = 27; i <= 30; i++) {
      var splitted = saveChecklist[i].replaceAll("6", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        wall.add(title);
      }
    }
    paint.clear();
    for (int i = 31; i <= 36; i++) {
      var splitted = saveChecklist[i].replaceAll("7", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        paint.add(title);
      }
    }
    internpaint.clear();
    for (int i = 37; i <= 42; i++) {
      var splitted = saveChecklist[i].replaceAll("8", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        internpaint.add(title);
      }
    }
    extern.clear();
    for (int i = 43; i <= 46; i++) {
      var splitted = saveChecklist[i].replaceAll("9", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        extern.add(title);
      }
    }
    intern.clear();
    for (int i = 47; i <= 50; i++) {
      var splitted = saveChecklist[i].replaceAll("10", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        intern.add(title);
      }
    }
    floor.clear();
    for (int i = 51; i <= 54; i++) {
      var splitted = saveChecklist[i].replaceAll("11", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        floor.add(title);
      }
    }
    windows.clear();
    for (int i = 55; i <= 58; i++) {
      var splitted = saveChecklist[i].replaceAll("12", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        windows.add(title);
      }
    }

    balcony.clear();
    for (int i = 59; i <= 63; i++) {
      var splitted = saveChecklist[i].replaceAll("13", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        balcony.add(title);
      }
    }
    switchboard.clear();
    for (int i = 64; i <= 69; i++) {
      var splitted = saveChecklist[i].replaceAll("14", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        switchboard.add(title);
      }
    }
    kitchen.clear();
    for (int i = 70; i <= 75; i++) {
      var splitted = saveChecklist[i].replaceAll("15", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        kitchen.add(title);
      }
    }
    bathroom.clear();
    for (int i = 76; i <= 81; i++) {
      var splitted = saveChecklist[i].replaceAll("16", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        bathroom.add(title);
      }
    }
    tank.clear();
    for (int i = 82; i <= 87; i++) {
      var splitted = saveChecklist[i].replaceAll("17", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        tank.add(title);
      }
    }
    pattern.clear();
    for (int i = 88; i <= 95; i++) {
      var splitted = saveChecklist[i].replaceAll("18", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        pattern.add(title);
      }
    }
    state.clear();
    for (int i = 96; i <= 102; i++) {
      var splitted = saveChecklist[i].replaceAll("19", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        state.add(title);
      }
    }
    unityroof.clear();
    for (int i = 103; i <= 108; i++) {
      var splitted = saveChecklist[i].replaceAll("20", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        unityroof.add(title);
      }
    }
    unity.clear();
    for (int i = 109; i <= 111; i++) {
      var splitted = saveChecklist[i].replaceAll("21", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        unity.add(title);
      }
    }
    view.clear();
    for (int i = 112; i <= 115; i++) {
      var splitted = saveChecklist[i].replaceAll("22", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        view.add(title);
      }
    }

    block.clear();
    for (int i = 116; i <= 130; i++) {
      var splitted = saveChecklist[i].replaceAll("23", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      if (check == 'true') {
        block.add(title);
      }
    }
    setState(() {
      age = data?["age"] ?? '';
      price = data?["price"] ?? '';
      sPathology = data?["Pathology"] ?? '';
      sType = data?["type"] ?? '';
      sInfra = data?["infra"] ?? '';
      sSituation = data?["situation"] ?? '';
      sQuota = data?["quota"] ?? '';
      sPosition = data?["unPosition"] ?? '';
      sRoof = data?["roof"] ?? '';
      sWall = data?["wall"] ?? '';
      sInternPaint = data?["internPaint"] ?? '';
      sPaint = data?["externPaint"] ?? '';
      sExtern = data?["externDoors"] ?? '';
      sFloor = data?["floor"] ?? '';
      sIntern = data?["internDoors"] ?? '';
      sWindows = data?["windowns"] ?? '';
      sBalcony = data?["balcony"] ?? '';
      sSwitchBoard = data?["switchboard"] ?? '';
      sKitchen = data?["kitchen"] ?? '';
      sBathroom = data?["bathroom"] ?? '';
      sTank = data?["tank"] ?? '';
      sPattern = data?["pattern"] ?? '';
      sState = data?["state"] ?? '';
      sUnityroof = data?["unRoof"] ?? '';
      sUnity = data?["unity"] ?? '';
      sView = data?["view"] ?? '';
      sUnPosition = data?["unPosition"] ?? '';
      sBlock = data?["block"] ?? '';
      Obs = data?["obs"] ?? '';
      date = data?["hourRequest"] ?? '';
      user = data?["userName"] ?? '';
      Cod = data?["userCode"] ?? '';
      lat = data?["lat"] ?? '';
      lng = data?["lng"] ?? '';
      surveyType = data?["typesurvey"] ?? '';
      SRoom = data?["rooms"] ?? '';
      SSocialBathroom = data?["socialbathrooms"] ?? '';
      SPrivateBathroom = data?["privatebathrooms"] ?? '';
      SLav = data?["lavs"] ?? '';
      SServiceBathroom = data?["servicebathrooms"] ?? '';
      SMaidRoom = data?["maidrooms"] ?? '';
      SBalcony = data?["balconys"] ?? '';
      SCompleteCabinets = data?["completecontainers"] ?? '';
      SKitchen = data?["kitchens"] ?? '';
      SRestRoom = data?["restrooms"] ?? '';
      SServiceAreaRoofed = data?["servicearearoofed"] ?? '';
      SServiceAreaUnroofed = data?["serviceareaunroofed"] ?? '';
      SClosedGarage = data?["garageroofed"] ?? '';
      SOpenGarage = data?["garageunroofed"] ?? '';
      SPavs = data?["pavs"] ?? '';
      SElevators = data?["elevators"] ?? '';
      SAge = data?["age"] ?? '';
      SAptos = data?["aptos"] ?? '';
      SUnitys = data?["unitys"] ?? '';
      SAc = data?["acs"] ?? '';
      SPool = data?["pools"] ?? '';
      street = data?["adress"] ?? '';
      number = data?["number"] ?? '';
      district = data?["district"] ?? '';
      city = data?["city"] ?? '';
      states = data?["estado"] ?? '';
      cep = data?["cep"] ?? '';
      imageList = data?["photoUrl"] ??[];
      condPrice = data?["condprice"] ?? '';
      admin = data?["admin"] ?? '';
      phone = data?["phone"] ?? '';
      Area = data?["TerrainArea"] ?? '';
      IPavs = data?["PavType"] ?? '';
      Final = data?["Goal"] ?? '';
      Origin = data?["Origin"] ?? '';
      complement = data?["complement"] ?? '';
    });
    print(street);
    print(number);
    print(district);
    print(city);
    print(states);
    print(cep);
  }

  FirebaseStorage storage = FirebaseStorage.instance;
  _createPdf(BuildContext context) async {
    print('entrou');
    print(order);
    print(nsurvey);
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    final font = await rootBundle.load("assets/fonts/Nunito-Regular.ttf");
    final ttf = pdfLib.Font.ttf(font);
    pdf.addPage(
        pdfLib.MultiPage(
            margin: pdfLib.EdgeInsets.all(2.0),
            orientation: pdfLib.PageOrientation.landscape,
            build: (context) => [
              pdfLib.Container(
                  child: pdfLib.Text('Vistoria de Apartamento',
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
                        pdfLib.Row(
                            children: [
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
                        pdfLib.Row(children: [
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
                            child: pdfLib.Text(
                              ' $street, $number,$complement, $district - $city/$states - $cep',

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
                  pdfLib.SizedBox(width: 50),
                  pdfLib.Column(
                      mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                      crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                      children: [
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
                              ' $Area',
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
                              'Identificação dos Pavimentos:',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 8.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            child: pdfLib.Text(
                              ' $IPavs',
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
                              ' $Final',

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
                              'Valor do Condomiínio:',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 8.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            child: pdfLib.Text(
                              ' $condPrice',

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
                              'Administrador:',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 8.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            child: pdfLib.Text(
                              ' $admin',

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
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                        ]),
                      ]),
                  pdfLib.SizedBox(width: 50),
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
                            '$Obs',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold),
                          ),
                        ),
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
                          width: 130,
                          child: pdfLib.Text(
                            'Patologia',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: pathology.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 130,
                                    child:
                                    pdfLib.Text(
                                      '${pathology[index].toString()}',
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
                          width: 130,
                          child: pdfLib.Text(
                            sPathology,
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
                          width: 75,
                          child: pdfLib.Text(
                            'Tipo de Imóvel',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: type.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 75,
                                    child:
                                    pdfLib.Text(
                                      '${type[index].toString()}',

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
                          width: 75,
                          child: pdfLib.Text(
                            sType,
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
                          width: 105,
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
                                    width: 105,
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
                          width: 105,
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
                          width: 80,
                          child: pdfLib.Text(
                            'Portas Externas',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: extern.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 80,
                                    child:
                                    pdfLib.Text(
                                      '${extern[index].toString()}',
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
                            sExtern,
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
              ), pdfLib.Divider(),
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
                            'Portas Internas',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: intern.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 80,
                                    child:
                                    pdfLib.Text(
                                      '${intern[index].toString()}',
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
                            sIntern,
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
                            'Piso',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: floor.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 80,
                                    child:
                                    pdfLib.Text(
                                      '${floor[index].toString()}',
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
                            sFloor,
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
                          width: 80,
                          child: pdfLib.Text(
                            'Bancada',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: balcony.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 80,
                                    child:
                                    pdfLib.Text(
                                      '${balcony[index].toString()}',
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
                            sBalcony,
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
                            'Quadro Elétrico',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: switchboard.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 80,
                                    child:
                                    pdfLib.Text(
                                      '${switchboard[index].toString()}',
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
                            sSwitchBoard,
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
                            'Revestimento da Cozinha',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: kitchen.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 120,
                                    child:
                                    pdfLib.Text(
                                      '${kitchen[index].toString()}',
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
                            sKitchen,
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
                            'Revestimento do Banheiro',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: bathroom.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 120,
                                    child:
                                    pdfLib.Text(
                                      '${bathroom[index].toString()}',
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
                            sBathroom,
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
                            'Revestimento do Tanque',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: tank.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 120,
                                    child:
                                    pdfLib.Text(
                                      '${tank[index].toString()}',
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
                            sTank,
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
                            'Unidade',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 8.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold
                            ),
                          ),
                        ),
                        pdfLib.ListView.builder(
                            itemCount: unity.length,
                            itemBuilder: (context,index){
                              return
                                pdfLib.Container(
                                    width: 70,
                                    child:
                                    pdfLib.Text(
                                      '${unity[index].toString()}',
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
                            sUnity,
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
                  children:
                  [
                    pdfLib.Column(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                        children: [
                          pdfLib.Container(
                            width: 110,
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
                                      width: 110,
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
                            width: 110,
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
                            width: 110,
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
                                      width: 110,
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
                            width: 110,
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

                    pdfLib.Column(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                        children: [
                          pdfLib.Container(
                            width: 85,
                            child: pdfLib.Text(
                              'Teto da Unidade',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 8.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold
                              ),
                            ),
                          ),
                          pdfLib.ListView.builder(
                              itemCount: unityroof.length,
                              itemBuilder: (context,index){
                                return
                                  pdfLib.Container(
                                      width: 85,
                                      child:
                                      pdfLib.Text(
                                        '${unityroof[index].toString()}',
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
                              sUnityroof,
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
                            'Bloco/Prédio',
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
                            'Nº de pavimentos',
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
                            'Quantidade de elevadores',
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
                            'Idade estimada',
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
                            'Nº de aptos/pavtos',
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
                            'Nº de unidades no predio',
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
                              '$SPavs',
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
                              '$SElevators',
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
                              '$SAge',
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
                              '$SAptos',
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
                              '$SUnitys',
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
                    pdfLib.SizedBox(width: 20),
                    pdfLib.Column(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                        children: [
                          pdfLib.Container(
                            width: 85,
                            child: pdfLib.Text(
                              'Vista Panorâmica',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 8.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold
                              ),
                            ),
                          ),
                          pdfLib.ListView.builder(
                              itemCount: view.length,
                              itemBuilder: (context,index){
                                return
                                  pdfLib.Container(
                                      width: 85,
                                      child:
                                      pdfLib.Text(
                                        '${view[index].toString()}',
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
                              sView,
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
                            width: 130,
                            height: 15,
                            child: pdfLib.Text(
                              'Unidade',
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                            width: 130,
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
                    pdfLib.SizedBox(
                        width: 20
                    ),
                    pdfLib.Column(
                        mainAxisAlignment: pdfLib.MainAxisAlignment.start,
                        crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
                        children: [
                          pdfLib.Container(
                            width: 120,
                            child: pdfLib.Text(
                              'Condominio/Bloco',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 8.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold
                              ),
                            ),
                          ),
                          pdfLib.ListView.builder(
                              itemCount: block.length,
                              itemBuilder: (context,index){
                                return
                                  pdfLib.Container(
                                      width: 120,
                                      child:
                                      pdfLib.Text(
                                        '${block[index].toString()}',
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
                              sBlock,
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
                  ]
              )
            ]));
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/Vistoria$surveyType.pdf';
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
            'pdfUrl': value.toString(),
            'idSurvey': widget.idSurvey
          };
          db
              .collection("surveys")
              .doc(widget.idSurvey)
              .set(dateUpdate, SetOptions(merge: true));
        });
      });
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PDFScreen(path)));
  }

  salvarpdfweb(file) async {
    var arquivo = XFile.fromData(file);
    Uint8List archive = await arquivo.readAsBytes();

    if (archive != null) {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference pastaRaiz = storage.ref();
      Reference storageRef = pastaRaiz
          .child("surveys")
          .child(DateTime.now().toString() + 'Vistoria' + "$order");

      await storageRef.putData(archive).then((upload) async {
        upload.ref.getDownloadURL().then((value) {
          db
              .collection("surveys")
              .doc(widget.idSurvey)
              .update({'pdfUrl': value.toString()});
        });
        print(upload);
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
                      onPressed: () => saveChecklist.length != 0
                          ? _createPdf(context)
                          : showSnackBar(context, 'erro', Colors.red),
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
                        onPressed: () {}),
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