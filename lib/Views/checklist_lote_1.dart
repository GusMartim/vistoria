import 'package:vistoria/Models/check_box_model_ratings.dart';
import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class CheckListLote1 extends StatefulWidget {
  final String idSurvey;
  CheckListLote1({required this.idSurvey});

  @override
  State<CheckListLote1> createState() => _CheckListLote1State();
}

class _CheckListLote1State extends State<CheckListLote1> {
  bool checkBoxvalue = false;
   TextEditingController _controllerFactors = TextEditingController();
  final type = [
    CheckBoxModel(title: 'Lote único'),
    CheckBoxModel(title: 'Loteamento'),
    CheckBoxModel(title: 'Condomínio'),
    CheckBoxModel(title: 'Outro:'),
  ];
   TextEditingController _controllerType = TextEditingController();

  final shape = [
    CheckBoxModel(title: 'Retangular'),
    CheckBoxModel(title: 'Trapezoidal'),
    CheckBoxModel(title: 'Triangular'),
    CheckBoxModel(title: 'Irregular'),
    CheckBoxModel(title: 'Outro:'),
  ];
   TextEditingController _controllerShape = TextEditingController();

  final situation = [
    CheckBoxModel(title: 'Meio de Quadra'),
    CheckBoxModel(title: 'Esquina'),
    CheckBoxModel(title: 'Quadra Inteira'),
    CheckBoxModel(title: 'Outro:'),
  ];
   TextEditingController _controllerSituation = TextEditingController();

  final topography = [
    CheckBoxModel(title: 'Plano/ semi plano'),
    CheckBoxModel(title: 'Aclive > 10%'),
    CheckBoxModel(title: 'Declive > 10%'),
    CheckBoxModel(title: 'Acidentado'),
    CheckBoxModel(title: 'Acima do greide da rua'),
    CheckBoxModel(title: 'Abaixo do greide da rua'),
    CheckBoxModel(title: 'No greide da rua'),
    CheckBoxModel(title: 'Outro:'),
  ];
   TextEditingController _controllerTopography = TextEditingController();
  final terrain = [
    CheckBoxModel(title: 'Muro alvenaria'),
    CheckBoxModel(title: 'Muro pré-moldado'),
    CheckBoxModel(title: 'Cerca arame'),
    CheckBoxModel(title: 'Tela soldada'),
    CheckBoxModel(title: 'Outro:'),
  ];
   TextEditingController _controllerTerrain = TextEditingController();

  final location = [
    CheckBoxModel(title: 'Inserida na malha urbana'),
    CheckBoxModel(title: 'Periferia em área de expansão'),
    CheckBoxModel(title: 'Periferia fora da área de expansão'),
    CheckBoxModel(title: 'Outro:'),
  ];
   TextEditingController _controllerLocation = TextEditingController();

  final use = [
    CheckBoxModel(title: 'Residencial unifamiliar'),
    CheckBoxModel(title: 'Residencial multifamiliar'),
    CheckBoxModel(title: 'Comercial'),
    CheckBoxModel(title: 'Industrial'),
    CheckBoxModel(title: 'Outro:'),
  ];
   TextEditingController _controllerUse = TextEditingController();

  final pattern = [
    CheckBoxModel(title: 'Alto'),
    CheckBoxModel(title: 'Normal'),
    CheckBoxModel(title: 'Baixo'),
    CheckBoxModel(title: 'Mínimo'),
    CheckBoxModel(title: 'Outro:'),
  ];
   TextEditingController _controllerPattern = TextEditingController();

  final evaluation = [
    CheckBoxModel(title: 'Boa'),
    CheckBoxModel(title: 'Regular'),
    CheckBoxModel(title: 'Ruim'),
    CheckBoxModel(title: 'Outro:'),
  ];
   TextEditingController _controllerEvaluation = TextEditingController();
  final density = [
    CheckBoxModel(title: 'Área altamente adensada'),
    CheckBoxModel(title: 'Densidade normal p/ o município'),
    CheckBoxModel(title: 'Área pouco adensada'),
    CheckBoxModel(title: 'Outro:'),
  ];
   TextEditingController _controllerDensity = TextEditingController();

  final transport = [
    CheckBoxModel(title: 'Satisfatório'),
    CheckBoxModel(title: 'Precário'),
    CheckBoxModel(title: 'Não disponível'),
    CheckBoxModel(title: 'Não necessário'),
    CheckBoxModel(title: 'Outro:'),
  ];
  List saveCheckList = [];
  List saveratings = [];
  List titles = [
    'Água',
    'Esgoto',
    'Energia elétrica',
    'Iluminação Pública',
    'Telefone',
    'Pavimentação',
    'Águas pluviais',
    'Guias e sarjetas',
    'Abast. de gás',
    'Coleta de lixo',
    'Escola',
    'Creche',
    'Saúde Pública',
    'Comércio',
    'Segurança Pública',
    'Lazer',
  ];
  final ratings = [];
  TextEditingController _controllerTransport = TextEditingController();

  TextEditingController _controllerTerrainArea = TextEditingController();

  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerObs = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  LoteModel _loteModel = LoteModel();
  File? picture;
  bool _sending = false;
  String _urlPhoto = '';
  String selectedText = 'Imagens';
  FirebaseStorage storage = FirebaseStorage.instance;
  final Map<String, dynamic> data = HashMap();

  Future _savePhoto() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 100);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.picture = imageTemporary;
        setState(() {
          _sending = true;
        });
        _uploadImage();
      });
    } on PlatformException catch (e) {
      print('Error : $e');
    }
  }

  Future _uploadImage() async {
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz
        .child("surveys")
        .child(selectedText + "_" + DateTime.now().toString() + ".jpg");

    UploadTask task = arquivo.putFile(picture!);

    Future.delayed(const Duration(seconds: 5), () async {
      String urlImage = await task.snapshot.ref.getDownloadURL();
      if (urlImage != null) {
        setState(() {
          _urlPhoto = urlImage;
        });
        _urlImageFirestore(urlImage);
      }
    });
  }

  _urlImageFirestore(String url) {
    Map<String, dynamic> dateUpdate = {
      'photoUrl': FieldValue.arrayUnion([url]),
      'idSurvey': widget.idSurvey
    };
    db
        .collection("surveys")
        .doc(widget.idSurvey)
        .set(dateUpdate, SetOptions(merge: true))
        .then((value) {
      setState(() {
        _sending = false;
      });
    });
  }

  _saveLote(LoteModel loteModel) async {
    db
        .collection('surveys')
        .doc(widget.idSurvey)
        .update(loteModel.toMap())
        .then((_) =>
        Navigator.pushNamed(context, '/finished',
            arguments: widget.idSurvey));
  }

  _LoteTable() async {
    _loteModel.obs = _controllerObs.text;
    _loteModel.type = _controllerType.text;
    _loteModel.shape = _controllerShape.text;
    _loteModel.situation = _controllerSituation.text;
    _loteModel.topography = _controllerTopography.text;
    _loteModel.terrainClosing = _controllerTerrain.text;
    _loteModel.localization = _controllerLocation.text;
    _loteModel.use = _controllerUse.text;
    _loteModel.pattern = _controllerPattern.text;
    _loteModel.TerrainArea = _controllerTerrainArea.text;
    _loteModel.transport = _controllerTransport.text;
    _loteModel.shape = _controllerShape.text;
    _loteModel.rating = _controllerEvaluation.text;
    _loteModel.density = _controllerDensity.text;
    _loteModel.Price = _controllerPrice.text;
    _loteModel.factors = _controllerFactors.text;

    _saveLote(_loteModel);
  }

  _getData() async {
    DocumentSnapshot snapshot =
    await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    setState(() {
      saveCheckList = data?["checklist"];
      saveratings = data?["ratings"];
    });
    type.clear();
    for (int i = 0; i <= 3; i++) {
      var splitted = saveCheckList[i].replaceAll("1", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      type.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    shape.clear();
    for (int i = 4; i <= 8; i++) {
      var splitted = saveCheckList[i].replaceAll("2", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      shape.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    situation.clear();
    for (int i = 9; i <= 12; i++) {
      var splitted = saveCheckList[i].replaceAll("3", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      situation.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }

    topography.clear();
    for (int i = 13; i <= 20; i++) {
      var splitted = saveCheckList[i].replaceAll("4", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      topography.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    terrain.clear();
    for (int i = 21; i <= 25; i++) {
      var splitted = saveCheckList[i].replaceAll("5", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      terrain.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    location.clear();
    for (int i = 26; i <= 29; i++) {
      var splitted = saveCheckList[i].replaceAll("6", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      location.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    use.clear();
    for (int i = 30; i <= 34; i++) {
      var splitted = saveCheckList[i].replaceAll("7", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      use.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    pattern.clear();
    for (int i = 35; i <= 39; i++) {
      var splitted = saveCheckList[i].replaceAll("8", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      pattern.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    evaluation.clear();
    for (int i = 40; i <= 43; i++) {
      var splitted = saveCheckList[i].replaceAll("9", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      evaluation.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    density.clear();
    for (int i = 44; i <= 47; i++) {
      var splitted = saveCheckList[i].replaceAll("10", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      density.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    transport.clear();
    for (int i = 48; i <= 52; i++) {
      var splitted = saveCheckList[i].replaceAll("11", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      transport.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    ratings.clear();
    for( int i = 0; i < saveratings.length; i++){
      var splitted = saveratings[i].split('#');
      var check1 = splitted[1];
      var check2 = splitted[2];
      var check3 = splitted[3];
      ratings.add(
            CheckBoxModelRatings(satisfactory: check1== 'true' ? true : false,
            precary: check2== 'true' ? true : false,
            notAvaiable: check3== 'true' ? true : false
        ));


    }
  setState(() {
    _controllerPrice = TextEditingController(text: data?["price"]);
    _controllerTerrainArea = TextEditingController(text: data?["TerrainArea"]);
    _controllerType = TextEditingController(text: data?["type"]);
    _controllerShape = TextEditingController(text: data?["shape"]);
    _controllerSituation = TextEditingController(text: data?["situation"]);
    _controllerTopography = TextEditingController(text: data?["topography"]);
    _controllerTerrain = TextEditingController(text: data?["terrainClosing"]);
    _controllerLocation = TextEditingController(text: data?["localization"]);
    _controllerUse = TextEditingController(text: data?["use"]);
    _controllerPattern = TextEditingController(text: data?["pattern"]);
    _controllerEvaluation = TextEditingController(text: data?["rating"]);
    _controllerDensity = TextEditingController(text: data?["density"]);
    _controllerTransport = TextEditingController(text: data?["transport"]);
    _controllerFactors = TextEditingController(text: data?["factors"]);
    _controllerObs = TextEditingController(text: data?["obs"]);
  });
  }
    _saveCheckList() async {
      saveCheckList.clear();
      for (var i = 0; i < type.length; i++) {
        saveCheckList.add(type[i].title + '1' + '#' + type[i].value.toString());
      }

      for (var i = 0; i < shape.length; i++) {
        saveCheckList.add(
            shape[i].title + '2' + '#' + shape[i].value.toString());
      }

      for (var i = 0; i < situation.length; i++) {
        saveCheckList
            .add(
            situation[i].title + '3' + '#' + situation[i].value.toString());
      }

      for (var i = 0; i < topography.length; i++) {
        saveCheckList.add(
            topography[i].title + '4' + '#' + topography[i].value.toString());
      }
      for (var i = 0; i < terrain.length; i++) {
        saveCheckList
            .add(terrain[i].title + '5' + '#' + terrain[i].value.toString());
      }
      for (var i = 0; i < location.length; i++) {
        saveCheckList
            .add(location[i].title + '6' + '#' + location[i].value.toString());
      }
      for (var i = 0; i < use.length; i++) {
        saveCheckList.add(use[i].title + '7' + '#' + use[i].value.toString());
      }

      for (var i = 0; i < pattern.length; i++) {
        saveCheckList.add(
            pattern[i].title + '8' + '#' + pattern[i].value.toString());
      }

      for (var i = 0; i < evaluation.length; i++) {
        saveCheckList
            .add(
            evaluation[i].title + '9' + '#' + evaluation[i].value.toString());
      }
      for (var i = 0; i < density.length; i++) {
        saveCheckList.add(
            density[i].title + '10' + '#' + density[i].value.toString());
      }

      for (var i = 0; i < transport.length; i++) {
        saveCheckList
            .add(
            transport[i].title + '11' + '#' + transport[i].value.toString());
      }

      saveratings.clear();
      for (var i = 0; i < titles.length; i++) {
        saveratings.add(
            '${titles[i]}'+'#'+'${ratings[i].satisfactory}'+'#'+'${ratings[i]
                .precary}'+'#'+'${ratings[i].notAvaiable}'+'#');
      }
      setState(() {

      });

      db.collection('surveys').doc(widget.idSurvey).update({
        "checklist": saveCheckList.toSet().toList(),
        "ratings": saveratings.toList(),
      });

      _LoteTable();
    }

    bool satisfactory = false;
    bool precary = false;
    bool notAvaiable = false;

    int order = 0;
    int nsurvey = 0;
    String title = '';
    getOrder() async {
      DocumentSnapshot snapshot =
      await db.collection('surveyNumber').doc('surveyNumber').get();
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      setState(() {
        order = data?["surveyNumber"] ?? 0;
        title = '${order + 1}';
      });
    }
    getNSurvey() async {
      DocumentSnapshot snapshot =
      await db.collection('surveys').doc(widget.idSurvey).get();
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      setState(() {
        nsurvey = data?["Nsurvey"] ?? 0;
      });
      if (nsurvey == 0) {
        getOrder();
      } else {
        setState(() {
          title = '$nsurvey';
        });
      }
    }

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getNSurvey();
      _getData();
    }

    @override
    Widget build(BuildContext context) {
      double width = MediaQuery
          .of(context)
          .size
          .width;
      double height = MediaQuery
          .of(context)
          .size
          .height;

      return Scaffold(
        backgroundColor: PaletteColors.white,
        appBar: AppBar(
          backgroundColor: PaletteColors.bgColor,
          iconTheme: IconThemeData(
            color: PaletteColors.white,
          ),
          elevation: 0,
          title: TextCustom(
            text: 'Vistoria Nº ${title}',
            size: 20.0,
            color: PaletteColors.white,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Ink(
              decoration: ShapeDecoration(
                color: PaletteColors.white,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  color: PaletteColors.primaryColor,
                ),
                constraints: BoxConstraints(
                    minHeight: 28, minWidth: 28, maxHeight: 28, maxWidth: 28),
                iconSize: 24.0,
                padding: EdgeInsets.all(3.0),
                onPressed: () => _savePhoto(),
              ),
            ),
            SizedBox(
              width: width * 0.04,
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 26),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: height * 0.01),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * 0.60,
                            child: TextCustom(
                                text: "Valor",
                                size: 14.0,
                                color: PaletteColors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(children: [
                        Container(
                          child: InputRegister(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              RealInputFormatter(moeda: true)
                            ],
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.60,
                            controller: _controllerPrice,
                            hint: 'R\$100.000.00',
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                      ]),
                      SizedBox(height: height * 0.03),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: width * 0.8,
                                    child: TextCustom(
                                        text: "Área do Terreno",
                                        size: 14.0,
                                        color: PaletteColors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                width: width * 0.8,
                                child: InputRegister(
                                  icons: Icons.height,
                                  sizeIcon: 0.0,
                                  width: width * 0.2,
                                  controller: _controllerTerrainArea,
                                  hint: "   ",
                                  fonts: 14.0,
                                  keyboardType: TextInputType.number,
                                  colorBorder: PaletteColors.greyInput,
                                  background: PaletteColors.greyInput,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: TextCustom(
                      text: "TERRENO",
                      size: 20.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 8),
                  Divider(
                    thickness: 1,
                    color: PaletteColors.lightGrey,
                  ),
                  SizedBox(height: height * 0.03),
                  TextCustom(
                    text: "Tipo",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: type.length * 50,
                    child: ListView.builder(
                        itemCount: type.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: width * 0.60,
                                child: TextCustom(
                                    text: type[index].title,
                                    color: PaletteColors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                              Spacer(),
                              Checkbox(
                                  activeColor: PaletteColors.primaryColor,
                                  checkColor: Colors.white,
                                  value: type[index].value,
                                  onChanged: (checked) =>
                                      setState(() {
                                        type[index].value = checked!;
                                      })),
                            ],
                          );
                        }),
                  ),
                  Container(
                    child: InputRegister(
                        controller: _controllerType,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.8,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                  ),
                  Divider(
                    thickness: 1,
                    color: PaletteColors.lightGrey,
                  ),
                  SizedBox(height: height * 0.03),
                  TextCustom(
                    text: "Forma do Terreno",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: shape.length * 50,
                    child: ListView.builder(
                        itemCount: shape.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: width * 0.60,
                                child: TextCustom(
                                    text: shape[index].title,
                                    color: PaletteColors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                              Spacer(),
                              Checkbox(
                                  activeColor: PaletteColors.primaryColor,
                                  checkColor: Colors.white,
                                  value: shape[index].value,
                                  onChanged: (checked) =>
                                      setState(() {
                                        shape[index].value = checked!;
                                      })),
                            ],
                          );
                        }),
                  ),
                  Container(
                    child: InputRegister(
                        controller: _controllerShape,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.8,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                  ),
                  Divider(
                    thickness: 1,
                    color: PaletteColors.lightGrey,
                  ),
                  SizedBox(height: height * 0.03),
                  TextCustom(
                    text: "Situação",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: situation.length * 50,
                    child: ListView.builder(
                        itemCount: situation.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: width * 0.60,
                                child: TextCustom(
                                    text: situation[index].title,
                                    color: PaletteColors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                              Spacer(),
                              Checkbox(
                                  activeColor: PaletteColors.primaryColor,
                                  checkColor: Colors.white,
                                  value: situation[index].value,
                                  onChanged: (checked) =>
                                      setState(() {
                                        situation[index].value = checked!;
                                      })),
                            ],
                          );
                        }),
                  ),
                  Container(
                    child: InputRegister(
                        controller: _controllerSituation,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.8,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                  ),
                  Divider(
                    thickness: 1,
                    color: PaletteColors.lightGrey,
                  ),
                  SizedBox(height: height * 0.03),
                  TextCustom(
                    text: "Topografia",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: topography.length * 50,
                    child: ListView.builder(
                        itemCount: topography.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: width * 0.60,
                                child: TextCustom(
                                    text: topography[index].title,
                                    color: PaletteColors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                              Spacer(),
                              Checkbox(
                                  activeColor: PaletteColors.primaryColor,
                                  checkColor: Colors.white,
                                  value: topography[index].value,
                                  onChanged: (checked) =>
                                      setState(() {
                                        topography[index].value = checked!;
                                      })),
                            ],
                          );
                        }),
                  ),
                  Container(
                    child: InputRegister(
                        controller: _controllerTopography,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.8,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                  ),
                  Divider(
                    thickness: 1,
                    color: PaletteColors.lightGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: TextCustom(
                      text: "BENFEITORIAS EXISTENTES",
                      size: 20.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: height * 0.03),
                  TextCustom(
                    text: "Fechamento do terreno",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: terrain.length * 50,
                    child: ListView.builder(
                        itemCount: terrain.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: width * 0.60,
                                child: TextCustom(
                                    text: terrain[index].title,
                                    color: PaletteColors.grey,
                                    fontWeight: FontWeight.normal),
                              ),
                              Spacer(),
                              Checkbox(
                                  activeColor: PaletteColors.primaryColor,
                                  checkColor: Colors.white,
                                  value: terrain[index].value,
                                  onChanged: (checked) =>
                                      setState(() {
                                        terrain[index].value = checked!;
                                      })),
                            ],
                          );
                        }),
                  ),
                  Container(
                    child: InputRegister(
                        controller: _controllerTerrain,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.8,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: TextCustom(
                          text: "CARACTERÍSTICAS DA REGIÃO",
                          size: 20.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      TextCustom(
                        text: "Localização da Unidade",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        height: location.length * 50,
                        child: ListView.builder(
                            itemCount: location.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: width * 0.60,
                                    child: TextCustom(
                                        text: location[index].title,
                                        color: PaletteColors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Spacer(),
                                  Checkbox(
                                      activeColor: PaletteColors.primaryColor,
                                      checkColor: Colors.white,
                                      value: location[index].value,
                                      onChanged: (checked) =>
                                          setState(() {
                                            location[index].value = checked!;
                                          })),
                                ],
                              );
                            }),
                      ),
                      Container(
                        child: InputRegister(
                            controller: _controllerLocation,
                            hint: 'Especificar',
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
                            width: width * 0.8,
                            sizeIcon: 0.0,
                            icons: Icons.height,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput),
                      ),
                      Divider(
                        thickness: 1,
                        color: PaletteColors.lightGrey,
                      ),
                      SizedBox(height: height * 0.03),
                      TextCustom(
                        text: "Uso predominante",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        height: use.length * 50,
                        child: ListView.builder(
                            itemCount: use.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: width * 0.60,
                                    child: TextCustom(
                                        text: use[index].title,
                                        color: PaletteColors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Spacer(),
                                  Checkbox(
                                      activeColor: PaletteColors.primaryColor,
                                      checkColor: Colors.white,
                                      value: use[index].value,
                                      onChanged: (checked) =>
                                          setState(() {
                                            use[index].value = checked!;
                                          })),
                                ],
                              );
                            }),
                      ),
                      Container(
                        child: InputRegister(
                            controller: _controllerUse,
                            hint: 'Especificar',
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
                            width: width * 0.8,
                            sizeIcon: 0.0,
                            icons: Icons.height,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput),
                      ),
                      Divider(
                        thickness: 1,
                        color: PaletteColors.lightGrey,
                      ),
                      SizedBox(height: height * 0.03),
                      TextCustom(
                        text: "Padrão usual de acabamento",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        height: pattern.length * 50,
                        child: ListView.builder(
                            itemCount: pattern.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: width * 0.60,
                                    child: TextCustom(
                                        text: pattern[index].title,
                                        color: PaletteColors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Spacer(),
                                  Checkbox(
                                      activeColor: PaletteColors.primaryColor,
                                      checkColor: Colors.white,
                                      value: pattern[index].value,
                                      onChanged: (checked) =>
                                          setState(() {
                                            pattern[index].value = checked!;
                                          })),
                                ],
                              );
                            }),
                      ),
                      Container(
                        child: InputRegister(
                            controller: _controllerPattern,
                            hint: 'Especificar',
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
                            width: width * 0.8,
                            sizeIcon: 0.0,
                            icons: Icons.height,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput),
                      ),
                      Divider(
                        thickness: 1,
                        color: PaletteColors.lightGrey,
                      ),
                      SizedBox(height: height * 0.03),
                      TextCustom(
                        text: "Avaliação da Localização",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        height: evaluation.length * 50,
                        child: ListView.builder(
                            itemCount: evaluation.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: width * 0.60,
                                    child: TextCustom(
                                        text: evaluation[index].title,
                                        color: PaletteColors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Spacer(),
                                  Checkbox(
                                      activeColor: PaletteColors.primaryColor,
                                      checkColor: Colors.white,
                                      value: evaluation[index].value,
                                      onChanged: (checked) =>
                                          setState(() {
                                            evaluation[index].value = checked!;
                                          })),
                                ],
                              );
                            }),
                      ),
                      Container(
                        child: InputRegister(
                            controller: _controllerEvaluation,
                            hint: 'Especificar',
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
                            width: width * 0.8,
                            sizeIcon: 0.0,
                            icons: Icons.height,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput),
                      ),
                      Divider(
                        thickness: 1,
                        color: PaletteColors.lightGrey,
                      ),
                      SizedBox(height: height * 0.03),
                      TextCustom(
                        text: "Densidade de ocupação",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        height: density.length * 50,
                        child: ListView.builder(
                            itemCount: density.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: width * 0.60,
                                    child: TextCustom(
                                        text: density[index].title,
                                        color: PaletteColors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Spacer(),
                                  Checkbox(
                                      activeColor: PaletteColors.primaryColor,
                                      checkColor: Colors.white,
                                      value: density[index].value,
                                      onChanged: (checked) =>
                                          setState(() {
                                            density[index].value = checked!;
                                          })),
                                ],
                              );
                            }),
                      ),
                      Container(
                        child: InputRegister(
                            controller: _controllerDensity,
                            hint: 'Especificar',
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
                            width: width * 0.8,
                            sizeIcon: 0.0,
                            icons: Icons.height,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput),
                      ),
                      Divider(
                        thickness: 1,
                        color: PaletteColors.lightGrey,
                      ),
                      SizedBox(height: height * 0.03),
                      TextCustom(
                        text: "Transporte Coletivo",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: height * 0.03),
                      Container(
                        height: transport.length * 50,
                        child: ListView.builder(
                            itemCount: transport.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: width * 0.60,
                                    child: TextCustom(
                                        text: transport[index].title,
                                        color: PaletteColors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Spacer(),
                                  Checkbox(
                                      activeColor: PaletteColors.primaryColor,
                                      checkColor: Colors.white,
                                      value: transport[index].value,
                                      onChanged: (checked) =>
                                          setState(() {
                                            transport[index].value = checked!;
                                          })),
                                ],
                              );
                            }),
                      ),
                      Container(
                        child: InputRegister(
                            controller: _controllerTransport,
                            hint: 'Especificar',
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
                            width: width * 0.8,
                            sizeIcon: 0.0,
                            icons: Icons.height,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput),
                      ),
                      Divider(
                        thickness: 1,
                        color: PaletteColors.lightGrey,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextCustom(
                        text:
                        'Soluções de infra-estrutura disponíveis \njunto à unidade, serviços e equipamentos\ncomunitários no entorno',
                        color: PaletteColors.grey,
                        maxLines: 3,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          RotatedBox(
                            quarterTurns: 3,
                            child: TextCustom(
                              text: 'Satisfatório',
                              color: PaletteColors.grey,
                              size: 14.0,
                            ),
                          ),
                          SizedBox(
                            width: 27,
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: TextCustom(
                              text: 'Precário',
                              color: PaletteColors.grey,
                              size: 14.0,
                            ),
                          ),
                          SizedBox(
                            width: 27,
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: TextCustom(
                              text: 'Não disponível',
                              color: PaletteColors.grey,
                              size: 14.0,
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                      Container(
                        height: titles.length * 50,
                        child: ListView.builder(
                            itemCount: titles.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              ratings.add(CheckBoxModelRatings());
                              return Row(
                                children: [
                                  Container(
                                    width: width * 0.35,
                                    child: TextCustom(
                                        text: titles[index],
                                        color: PaletteColors.grey,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Spacer(),
                                  Checkbox(
                                      activeColor: PaletteColors.primaryColor,
                                      checkColor: Colors.white,
                                      value: ratings[index].satisfactory,
                                      onChanged: (checked) =>
                                          setState(() {
                                            ratings[index].satisfactory =
                                            checked!;
                                          })),
                                  Checkbox(
                                      activeColor: PaletteColors.primaryColor,
                                      checkColor: Colors.white,
                                      value: ratings[index].precary,
                                      onChanged: (checked) =>
                                          setState(() {
                                            ratings[index].precary = checked!;
                                          })),
                                  Checkbox(
                                      activeColor: PaletteColors.primaryColor,
                                      checkColor: Colors.white,
                                      value: ratings[index].notAvaiable,
                                      onChanged: (checked) =>
                                          setState(() {
                                            ratings[index].notAvaiable =
                                            checked!;
                                          })),
                                ],
                              );
                            }),
                      ),
                      Divider(
                        thickness: 1.0,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextCustom(
                        text: "Fatores desvalorizantes na região",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        child: TextCustom(
                          text:
                          "Há no entorno da unidade atividades e/ou características incompatíveis com o uso ou que possam provocar risco ou situação de insalubridade nas edificações, com consequente comprometimento do retorno da operação? Em caso afirmativo especifique abaixo:",
                          size: 16.0,
                          maxLines: 7,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: width * 0.8,
                        height: height * 0.2,
                        child: InputRegister(
                            controller: _controllerFactors,
                            hint: '',
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
                            width: width * 0.5,
                            sizeIcon: 0.0,
                            icons: Icons.height,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput),
                      ),
                      Divider(thickness: 1),
                      TextCustom(
                        text: "Observações:",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        width: width * 0.8,
                        height: height * 0.2,
                        child: InputRegister(
                            controller: _controllerObs,
                            hint: '',
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
                            width: width * 0.5,
                            sizeIcon: 0.0,
                            icons: Icons.height,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            width: width * 0.35,
                            child: ButtonCustom(
                              widthCustom: 0.35,
                              heightCustom: 0.070,
                              onPressed: () =>

                                  Navigator.pop(context),
                              text: "Voltar",
                              size: 14.0,
                              colorButton: PaletteColors.white,
                              colorText: PaletteColors.primaryColor,
                              colorBorder: PaletteColors.primaryColor,
                            ),
                          ),
                          SizedBox(width: width * 0.08),
                          Container(
                            width: width * 0.35,
                            child: ButtonCustom(
                              widthCustom: 0.35,
                              heightCustom: 0.070,
                              onPressed: () => _saveCheckList(),
                              text: "Concluir",
                              size: 14.0,
                              colorButton: PaletteColors.primaryColor,
                              colorText: PaletteColors.white,
                              colorBorder: PaletteColors.primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget buildSingleCheckbox(CheckBoxModel checkBoxModel) =>
        CheckboxListTile(
          title: TextCustom(
              text: checkBoxModel.title,
              color: PaletteColors.grey,
              fontWeight: FontWeight.normal,
              size: 16.0),
          value: checkBoxModel.value,
          onChanged: (value) => setState(() => checkBoxModel.value = value!),
          activeColor: PaletteColors.primaryColor,
          checkColor: PaletteColors.white,
        );
  }

