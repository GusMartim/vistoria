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
  final TextEditingController _controllerFactors = TextEditingController();
  final type = [
    CheckBoxModel(title: 'Lote único'),
    CheckBoxModel(title: 'Loteamento'),
    CheckBoxModel(title: 'Condomínio'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerType = TextEditingController();

  final shape = [
    CheckBoxModel(title: 'Retangular'),
    CheckBoxModel(title: 'Trapezoidal'),
    CheckBoxModel(title: 'Triangular'),
    CheckBoxModel(title: 'Irregular'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerShape = TextEditingController();

  final situation = [
    CheckBoxModel(title: 'Meio de Quadra'),
    CheckBoxModel(title: 'Esquina'),
    CheckBoxModel(title: 'Quadra Inteira'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerSituation = TextEditingController();

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
  final TextEditingController _controllerTopography = TextEditingController();
  final terrain = [
    CheckBoxModel(title: 'Muro alvenaria'),
    CheckBoxModel(title: 'Muro pré-moldado'),
    CheckBoxModel(title: 'Cerca arame'),
    CheckBoxModel(title: 'Tela soldada'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerTerrain = TextEditingController();

  final location = [
    CheckBoxModel(title: 'Inserida na malha urbana'),
    CheckBoxModel(title: 'Periferia em área de expansão'),
    CheckBoxModel(title: 'Periferia fora da área de expansão'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerLocation = TextEditingController();

  final use = [
    CheckBoxModel(title: 'Residencial unifamiliar'),
    CheckBoxModel(title: 'Residencial multifamiliar'),
    CheckBoxModel(title: 'Comercial'),
    CheckBoxModel(title: 'Industrial'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerUse = TextEditingController();

  final pattern = [
    CheckBoxModel(title: 'Alto'),
    CheckBoxModel(title: 'Normal'),
    CheckBoxModel(title: 'Baixo'),
    CheckBoxModel(title: 'Mínimo'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerPattern = TextEditingController();

  final evaluation = [
    CheckBoxModel(title: 'Boa'),
    CheckBoxModel(title: 'Regular'),
    CheckBoxModel(title: 'Ruim'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerEvaluation = TextEditingController();
  final density = [
    CheckBoxModel(title: 'Área altamente adensada'),
    CheckBoxModel(title: 'Densidade normal p/ o município'),
    CheckBoxModel(title: 'Área pouco adensada'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerDensity = TextEditingController();

  final transport = [
    CheckBoxModel(title: 'Satisfatório'),
    CheckBoxModel(title: 'Precário'),
    CheckBoxModel(title: 'Não disponível'),
    CheckBoxModel(title: 'Não necessário'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerTransport = TextEditingController();

  final TextEditingController _controllerTerrainArea = TextEditingController();

  final TextEditingController _controllerPrice = TextEditingController();
  final TextEditingController _controllerObs = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  LoteModel _loteModel = LoteModel();
  File? picture;
  bool _sending = false;
  String _urlPhoto = '';
  String selectedText = 'Imagens';
  FirebaseStorage storage = FirebaseStorage.instance;
  final Map<String, dynamic> data = HashMap();


  Future _savePhoto() async{
    try{
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 100);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.picture = imageTemporary;
        setState(() {
          _sending = true;
        });
        _uploadImage();
      });
    } on PlatformException catch (e){
      print('Error : $e');
    }
  }

  Future _uploadImage() async{
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz.child("surveys").child(selectedText+"_"+DateTime.now().toString()+".jpg");

    UploadTask task = arquivo.putFile(picture!);

    Future.delayed(const Duration(seconds: 5), ()async{
      String urlImage = await task.snapshot.ref.getDownloadURL();
      if (urlImage != null) {
        setState(() {
          _urlPhoto= urlImage;
        });
        _urlImageFirestore(urlImage);
      }
    });
  }
  _urlImageFirestore(String url){

    Map<String , dynamic> dateUpdate = {
      'photoUrl' : FieldValue.arrayUnion([url]),
      'idSurvey': widget.idSurvey
    };
    db
        .collection("surveys")
        .doc(widget.idSurvey)
        .set(dateUpdate,SetOptions(merge: true))
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
        .then((_) => Navigator.pushNamed(context, '/finished',arguments: widget.idSurvey));
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

  _saveCheckList() async {
    saveTerrain.clear();
    for (var i = 0; i < type.length; i++) {
      if (type[i].value != false) {
        saveTerrain.add(type[i].title + '#' + type[i].value.toString());
      }
    }
    saveTerrainForm.clear();
    for (var i = 0; i < shape.length; i++) {
      if (shape[i].value != false) {
        saveTerrainForm.add(shape[i].title + '#' + shape[i].value.toString());
      }
    }
    saveSituation.clear();
    for (var i = 0; i < situation.length; i++) {
      if (situation[i].value != false) {
        saveSituation
            .add(situation[i].title + '#' + situation[i].value.toString());
      }
    }
    saveTopography.clear();
    for (var i = 0; i < topography.length; i++) {
      if (topography[i].value != false) {
        saveTopography
            .add(topography[i].title + '#' + topography[i].value.toString());
      }
    }
    savePattern.clear();
    for (var i = 0; i < pattern.length; i++) {
      if (pattern[i].value != false) {
        savePattern.add(pattern[i].title +
            '#' +
            pattern[i].value.toString() +
            _controllerPattern.text);
      }
    }

    saveSituation.clear();
    for (var i = 0; i < situation.length; i++) {
      if (situation[i].value != false) {
        saveSituation.add(situation[i].title +
            '#' +
            situation[i].value.toString() +
            _controllerSituation.text);
      }
    }
    
        saveratings.clear();
        for(var i = 0; i < titles.length; i++){
          saveratings.add('${titles[i]}#${ratings[i].satisfactory}#${ratings[i].precary}#${ratings[i].notAvaiable}');
        }
        setState(() {
          print(saveratings);
        });



    db.collection('surveys').doc(widget.idSurvey).update({
      "Patologia": savePathology.toSet().toList(),
      "Tipo": saveTerrain.toSet().toList(),
      "Forma do Terreno": saveTerrainForm.toSet().toList(),
      "Situação": saveSituation.toSet().toList(),
      "Topografia": saveTopography.toSet().toList(),
      "Fechamento do Terreno": saveClosing.toSet().toList(),
      "Localização da Unidade": saveLocation.toSet().toList(),
      "Uso predominante": saveUse.toSet().toList(),
      "Padrão usual de acabamento": savePattern.toSet().toList(),
      "Avaliação da Localização": saveRating.toSet().toList(),
      "Densidade de Ocupação": saveDensity.toSet().toList(),
      "Transporte coletivo": saveTransport.toSet().toList(),
      "Avaliações": saveratings.toList(),
    });

    _LoteTable();
  }

  bool satisfactory = false;
  bool precary = false;
  bool notAvaiable = false;
  List saveTerrain = [];
  List saveTerrainForm = [];
  List saveSituation = [];
  List saveTopography = [];
  List saveClosing = [];
  List saveLocation = [];
  List saveUse = [];
  List savePattern = [];
  List saveRating = [];
  List saveDensity = [];
  List saveTransport = [];
  List savePathology = [];
  List saveratings = [];
  List titles= [
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
  int order = 0;
  _getSurveyNumber()async{

    DocumentSnapshot snapshot = await db
        .collection('surveyNumber')
        .doc('surveyNumber')
        .get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      order = data?["surveyNumber"]??0;

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSurveyNumber();
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
          text: 'Vistoria Nº $order',
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
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            TextCustom(
                              text: "Valor",
                              size: 14.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.left,
                            ),

                            SizedBox(height: 6),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.7,
                              child: InputRegister(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  RealInputFormatter(moeda: true),
                                ],
                                icons: Icons.height,
                                sizeIcon: 0.0,
                                width: width * 0.50,
                                controller: _controllerPrice,
                                hint: 'R\$000.000.00',
                                fonts: 14.0,
                                keyboardType: TextInputType.number,
                                colorBorder: PaletteColors.greyInput,
                                background: PaletteColors.greyInput,
                              ),
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              width: width * 0.7,
                              child: TextCustom(
                                  text: "Área do Terreno",
                                  size: 14.0,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          width: width * 0.7,
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
                TextCustom(
                  text: "Tipo",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ), //Tipo
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...type.map(buildSingleCheckbox).toList(),
                  ],
                ),
                InputRegister(
                    controller: _controllerType,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1.0,
                ),
                TextCustom(
                  text: "Forma do terreno",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ), //Forma do terreno
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...shape.map(buildSingleCheckbox).toList(),
                  ],
                ), //Infraestrutura
                InputRegister(
                    controller: _controllerShape,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1.0,
                ),
                TextCustom(
                  text: "Situação",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ), //Situação
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...situation.map(buildSingleCheckbox).toList(),
                  ],
                ),
                InputRegister(
                    controller: _controllerSituation,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1.0,
                ),
                TextCustom(
                  text: "Topografia",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ), //Topografia
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...topography.map(buildSingleCheckbox).toList(),
                  ],
                ),
                InputRegister(
                    controller: _controllerTopography,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1.0,
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
                TextCustom(
                  text: "Fechamento do terreno",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...terrain.map(buildSingleCheckbox).toList(),
                  ],
                ), // Posição da Unidade
                InputRegister(
                    controller: _controllerTerrain,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
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
                    SizedBox(height: 8),
                    TextCustom(
                      text: "Localização da Unidade",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ), //Localização da Unidade
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...location.map(buildSingleCheckbox).toList(),
                      ],
                    ),
                    InputRegister(
                        controller: _controllerLocation,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.5,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                    Divider(
                      thickness: 1.0,
                    ),
                    TextCustom(
                      text: "Uso predominante",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ), //Uso predominante
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...use.map(buildSingleCheckbox).toList(),
                      ],
                    ), //Infraestrutura
                    InputRegister(
                        controller: _controllerUse,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.5,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                    Divider(
                      thickness: 1.0,
                    ),
                    TextCustom(
                      text: "Padrão usual de acabamento",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ), //Padrão usual de acabamento
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...pattern.map(buildSingleCheckbox).toList(),
                      ],
                    ),
                    InputRegister(
                        controller: _controllerPattern,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.5,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                    Divider(
                      thickness: 1.0,
                    ),
                    TextCustom(
                      text: "Avaliação da Localização",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ), //Avaliação da Localização
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...evaluation.map(buildSingleCheckbox).toList(),
                      ],
                    ),
                    InputRegister(
                        controller: _controllerEvaluation,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.5,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                    Divider(
                      thickness: 1.0,
                    ),
                    TextCustom(
                      text: "Densidade de ocupação",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ), //Densidade de ocupação
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...density.map(buildSingleCheckbox).toList(),
                      ],
                    ),
                    InputRegister(
                        controller: _controllerDensity,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.5,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                    Divider(
                      thickness: 1.0,
                    ),
                    TextCustom(
                      text: "Transporte coletivo",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ), //Transporte coletivo
                    ListView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...transport.map(buildSingleCheckbox).toList(),
                      ],
                    ),
                    InputRegister(
                        controller: _controllerTransport,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.5,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                    Divider(
                      thickness: 1.0,
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
                      height:  titles.length * 50,
                      child: ListView.builder(
                          itemCount: titles.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
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
                                    value: ratings[index].satisfactory,
                                    onChanged: (checked) => setState(() {
                                      ratings[index].satisfactory = checked!;

                                    })
                                ),
                                Checkbox(
                                    value:ratings[index].precary,
                                    onChanged: (checked) => setState(() {
                                      ratings[index].precary = checked!;

                                    })
                                ),
                                Checkbox(
                                    value: ratings[index].notAvaiable,
                                    onChanged: (checked) => setState(() {
                                      ratings[index].notAvaiable = checked!;

                                    })
                                ),
                              ],
                            );
                          }
                      ),
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
                            widthCustom: 0.3,
                            heightCustom: 0.070,
                            onPressed: () => Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                  builder: (_) => Surveyscreen(
                                      text: 'Nova Vistoria',
                                      buttonText: 'Prosseguir',
                                      id: ''),
                                )
                            ),
                            text: "Voltar",
                            size: 14.0,
                            colorButton: PaletteColors.white,
                            colorText: PaletteColors.primaryColor,
                            colorBorder: PaletteColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: width * 0.15),
                        Container(
                          width: width * 0.35,
                          child: ButtonCustom(
                            widthCustom: 0.3,
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

  Widget buildSingleCheckbox(CheckBoxModel checkBoxModel) => CheckboxListTile(
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
