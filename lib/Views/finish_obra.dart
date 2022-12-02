import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:vistoria/Models/order_model.dart';
import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';
import 'package:pdf/widgets.dart' as pdfLib;

class SurveyFinishScreenObra extends StatefulWidget {
  final String idSurvey;

  SurveyFinishScreenObra({required this.idSurvey});

  @override
  State<SurveyFinishScreenObra> createState() => _SurveyFinishScreenObraState();
}

class _SurveyFinishScreenObraState extends State<SurveyFinishScreenObra> {
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
  List imageList = [];
  var Cod = '';
  var complement = '';
  var obs = '';
  var street = '';
  var number = '';
  var district = '';
  var surveyType = '';
  var city = '';
  var states = '';
  var cep = '';
  var SServices = '';
  var SInfra = '';
  var SSupra = '';
  var SWalls = '';
  var SFrames = '';
  var SGlasses = '';
  var SCeiling = '';
  var SWaterProof = '';
  var SIntern = '';
  var SLinings = '';
  var SExtern = '';
  var SPaint = '';
  var SFloors = '';
  var SFinishes = '';
  var SEletric = '';
  var SHidro = '';
  var SSewer = '';
  var SSlabs = '';
  var SComplements = '';
  var SOthers = '';

  var lat = '';
  var lng = '';
  var date = '';
  var user = '';
  var adress = '';
  var pdforder;

  _getData() async {
    DocumentSnapshot snapshot =
        await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      date = data?["hourRequest"] ?? "";
      user = data?["userName"] ?? "";
      complement = data?["complement"] ?? "";
      obs = data?["obs"] ?? "";
      lat = data?["lat"] ?? "";
      lng = data?["lng"] ?? "";
      street = data?["adress"] ?? "";
      number = data?["number"] ?? "";
      district = data?["district"] ?? "";
      city = data?["city"] ?? "";
      states = data?["estado"] ?? "";
      cep = data?["cep"] ?? "";
      imageList = data?["photoUrl"] ?? [];
      Cod = data?["userCode"] ?? '';
      SServices = data?["services"] ?? '';
      SInfra = data?["infra"] ?? '';
      SSupra = data?["supra"] ?? '';
      SWalls = data?["walls"] ?? '';
      SFrames = data?["frames"] ?? '';
      SGlasses = data?["glasses"] ?? '';
      SCeiling = data?["ceiling"] ?? '';
      SWaterProof = data?["waterproof"] ?? '';
      SIntern = data?["intern"] ?? '';
      SLinings = data?["linings"] ?? '';
      SExtern = data?["extern"] ?? '';
      SPaint = data?["paints"] ?? '';
      SFloors = data?["floors"] ?? '';
      SFinishes = data?["finishes"] ?? '';
      SEletric = data?["electric"] ?? '';
      SHidro = data?["hidro"] ?? '';
      SSewer = data?["sewer"] ?? '';
      SSlabs = data?["slabs"] ?? '';
      SComplements = data?["complements"] ?? '';
      SOthers = data?["others"] ?? '';
      surveyType = data?["typesurvey"] ?? '';
    });
  }

  FirebaseStorage storage = FirebaseStorage.instance;
  _createPdf(BuildContext context) async {
    print('entrou');
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    double width = 80;
    final font = await rootBundle.load("assets/fonts/Nunito-Regular.ttf");
    final ttf = pdfLib.Font.ttf(font);
    int lines = 32;

    print('lenght');

    int pag = 0;
    pdf.addPage(pdfLib.MultiPage(
        margin: pdfLib.EdgeInsets.all(2.0),
        orientation: pdfLib.PageOrientation.landscape,
        build: (context) => [
              pdfLib.Container(
                  child: pdfLib.Text('Vistoria de Obra',
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
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            child: pdfLib.Text(
                              ' $date',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
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
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            child: pdfLib.Text(
                              ' $user',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
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
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            child: pdfLib.Text(
                              ' $street, $number,$complement, $district - $city/$states - $cep',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
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
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            child: pdfLib.Text(
                              ' $Cod',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
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
                                  fontSize: 10.0,
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
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            child: pdfLib.Text(
                              ' $lat',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
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
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            child: pdfLib.Text(
                              ' $lng',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
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
                                fontSize: 10.0,
                                font: ttf,
                                fontWeight: pdfLib.FontWeight.bold),
                          ),
                        ),
                        pdfLib.Container(
                          child: pdfLib.Text(
                            '$obs',
                            textAlign: pdfLib.TextAlign.left,
                            style: pdfLib.TextStyle(
                                fontSize: 10.0,
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
                    pdfLib.Container(
                      child: pdfLib.Column(
                        children: [
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Serviços',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 14.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Serviços Preliminares e gerais',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Infraestrutura',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Supra-estrutura',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Paredes e painéis',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Esquadrias',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Vidros e plásticos',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Coberturas',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Impermeabilizações',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Revestimentos Internos',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Forros',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),

                        ],
                      ),
                    ),
                    pdfLib.SizedBox(width: 20),
                    pdfLib.Container(
                      child: pdfLib.Column(
                        children: [
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 14.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(

                            height: 25,
                            child: pdfLib.Text(
                              '$SServices',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(

                            height: 25,
                            child: pdfLib.Text(
                              '$SInfra',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(

                            height: 25,
                            child: pdfLib.Text(
                              '$SSupra',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(

                            height: 25,
                            child: pdfLib.Text(
                              '$SWalls',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(

                            height: 25,
                            child: pdfLib.Text(
                              '$SFrames',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(

                            height: 25,
                            child: pdfLib.Text(
                              '$SGlasses',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(

                            height: 25,
                            child: pdfLib.Text(
                              '$SCeiling',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(

                            height: 25,
                            child: pdfLib.Text(
                              '$SWaterProof',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(

                            height: 25,
                            child: pdfLib.Text(
                              '$SIntern',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SLinings',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),

                        ],
                      ),
                    ),
                    pdfLib.SizedBox(width: 20),
                    pdfLib.Container(
                      child: pdfLib.Column(
                        children: [
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              '',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Revestimentos externos',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Pintura',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Pisos',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Acabamentos',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Inst. elétricas e telefônicas',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Inst. hidráulicas',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Inst. esgoto e águas pluviais',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Louças e metais',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Complementos',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            width: 200,
                            height: 25,
                            child: pdfLib.Text(
                              'Outros serviços',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pdfLib.Container(
                      child: pdfLib.Column(
                        children: [
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SExtern',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SPaint',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SFloors',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SFinishes',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SEletric',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SHidro',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SSewer',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SSlabs',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SComplements',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                          pdfLib.Container(
                            height: 25,
                            child: pdfLib.Text(
                              '$SOthers',
                              textAlign: pdfLib.TextAlign.left,
                              style: pdfLib.TextStyle(
                                  fontSize: 10.0,
                                  font: ttf,
                                  fontWeight: pdfLib.FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              )
            ]));
    pag = pag + lines;
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
      imageList = data?["photoUrl"] ?? [];
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
                      onPressed: () => _createPdf(context),
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