import 'dart:collection';

import 'package:flutter/services.dart';
import 'package:vistoria/Utils/exports.dart';

class CheckList1 extends StatefulWidget {
  final String idSurvey;

  CheckList1({required this.idSurvey});

  @override
  State<CheckList1> createState() => _CheckList1State();
}

class _CheckList1State extends State<CheckList1> {
  int nRoom = 0;
  String SRoom = '0';
  int nSocialBathroom = 0;
  String SSocialBathroom = '0';
  int nPrivateBathroom = 0;
  String SPrivateBathroom = '0';
  int nLav = 0;
  String SLav = '0';
  int nServiceBathroom = 0;
  String SServiceBathroom = '0';
  int nMaidRoom = 0;
  String SMaidRoom = '0';
  int nBalcony = 0;
  String SBalcony = '0';
  int nCompleteCabinets = 0;
  String SCompleteCabinets = '0';
  int nKitchen = 0;
  String SKitchen = '0';
  int nRestRoom = 0;
  String SRestRoom = '0';
  int nServiceAreaRoofed = 0;
  String SServiceAreaRoofed = '0';
  int nServiceAreaUnroofed = 0;
  String SServiceAreaUnroofed = '0';
  int nOpenGarage = 0;
  String SOpenGarage = '0';
  int nClosedGarage = 0;
  String SClosedGarage = '0';
  int nAc = 0;
  String SAc = '0';
  int nPool = 0;
  String SPool = '0';
  List<String> goal = ['Venda', 'Aluguel'];
  String? selectedGoal = 'Venda';
  List<String> infoOrigin = ['Oferta de Mercado', 'Transação Efetuada'];
  String? selectedInfo = 'Oferta de Mercado';
  UnityModel _unityModel = UnityModel();
  File? picture;
  bool _sending = false;
  String _urlPhoto = '';
  String selectedText = 'Imagens';
  FirebaseStorage storage = FirebaseStorage.instance;
  final Map<String, dynamic> data = HashMap();
  FirebaseFirestore db = FirebaseFirestore.instance;

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

  _saveUnitys(UnityModel unityModel) async {
    db
        .collection('surveys')
        .doc(widget.idSurvey)
        .update(unityModel.toMap())
        .then((_) => Navigator.pushNamed(context, '/finished',
            arguments: widget.idSurvey));
  }
  _UnitysTable() async {
    _unityModel.Goal = selectedGoal.toString();
    _unityModel.Origin = selectedInfo.toString();
    _unityModel.rooms = SRoom;
    _unityModel.socialbathrooms = SSocialBathroom;
    _unityModel.privatebathrooms = SPrivateBathroom;
    _unityModel.lavs = SLav;
    _unityModel.servicebathrooms = SServiceBathroom;
    _unityModel.maidrooms = SMaidRoom;
    _unityModel.balconys = SBalcony;
    _unityModel.completecontainers = SCompleteCabinets;
    _unityModel.kitchens = SKitchen;
    _unityModel.restrooms = SRestRoom;
    _unityModel.servicearearoofed = SServiceAreaRoofed;
    _unityModel.serviceareaunroofed = SServiceAreaUnroofed;
    _unityModel.garageroofed = SClosedGarage;
    _unityModel.garageunroofed = SOpenGarage;
    _unityModel.acs = SAc;
    _unityModel.pools = SPool;
    _unityModel.age = _controllerAge.text;
    _unityModel.price = _controllerPrice.text;
    _unityModel.obs = _controllerObs.text;
    _unityModel.TotalArea = _controllerTotalArea.text;
    _unityModel.OpenArea = _controllerOpenArea.text;
    _unityModel.ClosedArea = _controllerClosedArea.text;
    _unityModel.TerrainArea = _controllerTerrainArea.text;
    _unityModel.type = _controllerType.text;
    _unityModel.infra = _controllerInfra.text;
    _unityModel.situation = _controllerSituation.text;
    _unityModel.quota = _controllerQuota.text;
    _unityModel.unPosition = _controllerPosition.text;
    _unityModel.roof = _controllerRoof.text;
    _unityModel.wall = _controllerWall.text;
    _unityModel.internPaint = _controllerInternPaint.text;
    _unityModel.externPaint = _controllerPaint.text;
    _unityModel.externDoors = _controllerExtern.text;
    _unityModel.floor = _controllerFloor.text;
    _unityModel.internDoors = _controllerIntern.text;
    _unityModel.windowns = _controllerWindows.text;
    _unityModel.balcony = _controllerBalcony.text;
    _unityModel.switchboard = _controllerSwitchBoard.text;
    _unityModel.kitchen = _controllerKitchen.text;
    _unityModel.bathroom = _controllerBathroom.text;
    _unityModel.tank = _controllerTank.text;
    _unityModel.pattern = _controllerPattern.text;
    _unityModel.state = _controllerState.text;
    _unityModel.unRoof = _controllerUnityRoof.text;
    _unityModel.block = _controllerBlock.text;
    _unityModel.pathology = _controllerPathology.text;

    _saveUnitys(_unityModel);
  }
  _saveCheckList() async {
    saveBlock.clear();
    for (var i = 0; i < block.length; i++) {
      if (block[i].value != false) {
        saveBlock.add(block[i].title + '#' + block[i].value.toString());
      }
    }
    saveKitchen.clear();
    for (var i = 0; i < kitchen.length; i++) {
      if (kitchen[i].value != false) {
        saveKitchen.add(kitchen[i].title + '#' + kitchen[i].value.toString());
      }
    }
    saveBathroom.clear();
    for (var i = 0; i < bathroom.length; i++) {
      if (bathroom[i].value != false) {
        saveBathroom
            .add(bathroom[i].title + '#' + bathroom[i].value.toString());
      }
    }
    saveTank.clear();
    for (var i = 0; i < tank.length; i++) {
      if (tank[i].value != false) {
        saveTank.add(tank[i].title + '#' + tank[i].value.toString());
      }
    }
    savePattern.clear();
    for (var i = 0; i < pattern.length; i++) {
      if (pattern[i].value != false) {
        savePattern.add(pattern[i].title + '#' + pattern[i].value.toString());
      }
    }
    saveState.clear();
    for (var i = 0; i < state.length; i++) {
      if (state[i].value != false) {
        saveState.add(state[i].title + '#' + state[i].value.toString());
      }
    }
    saveUnityroof.clear();
    for (var i = 0; i < unityroof.length; i++) {
      if (unityroof[i].value != false) {
        saveUnityroof
            .add(unityroof[i].title + '#' + unityroof[i].value.toString());
      }
    }
    saveExtern.clear();
    for (var i = 0; i < extern.length; i++) {
      if (extern[i].value != false) {
        saveExtern.add(extern[i].title + '#' + extern[i].value.toString());
      }
    }
    saveFloor.clear();
    for (var i = 0; i < floor.length; i++) {
      if (floor[i].value != false) {
        saveFloor.add(floor[i].title + '#' + floor[i].value.toString());
      }
    }
    saveIntern.clear();
    for (var i = 0; i < Intern.length; i++) {
      if (Intern[i].value != false) {
        saveIntern.add(Intern[i].title + '#' + Intern[i].value.toString());
      }
    }
    saveWindowns.clear();
    for (var i = 0; i < Windows.length; i++) {
      if (Windows[i].value != false) {
        saveWindowns.add(Windows[i].title + '#' + Windows[i].value.toString());
      }
    }
    saveInternPaint.clear();
    for (var i = 0; i < InternPaint.length; i++) {
      if (InternPaint[i].value != false) {
        saveInternPaint
            .add(InternPaint[i].title + '#' + InternPaint[i].value.toString());
      }
    }
    saveBalcony.clear();
    for (var i = 0; i < balcony.length; i++) {
      if (balcony[i].value != false) {
        saveBalcony.add(balcony[i].title + '#' + balcony[i].value.toString());
      }
    }
    saveSwitchBoard.clear();
    for (var i = 0; i < switchboard.length; i++) {
      if (switchboard[i].value != false) {
        saveSwitchBoard
            .add(switchboard[i].title + '#' + switchboard[i].value.toString());
      }
    }
    saveType.clear();
    for (var i = 0; i < type.length; i++) {
      if (type[i].value != false) {
        saveType.add(type[i].title + '#' + type[i].value.toString());
      }
    }
    saveInfra.clear();
    for (var i = 0; i < infra.length; i++) {
      if (infra[i].value != false) {
        saveInfra.add(infra[i].title + '#' + infra[i].value.toString());
      }
    }
    saveSituation.clear();
    for (var i = 0; i < situation.length; i++) {
      if (situation[i].value != false) {
        saveSituation
            .add(situation[i].title + '#' + situation[i].value.toString());
      }
    }
    saveQuota.clear();
    for (var i = 0; i < quota.length; i++) {
      if (quota[i].value != false) {
        saveQuota.add(quota[i].title + '#' + quota[i].value.toString());
      }
    }
    savePosition.clear();
    for (var i = 0; i < position.length; i++) {
      if (position[i].value != false) {
        savePosition
            .add(position[i].title + '#' + position[i].value.toString());
      }
    }
    saveRoof.clear();
    for (var i = 0; i < roof.length; i++) {
      if (roof[i].value != false) {
        saveRoof.add(roof[i].title + '#' + roof[i].value.toString());
      }
    }
    saveWall.clear();
    for (var i = 0; i < wall.length; i++) {
      if (wall[i].value != false) {
        saveWall.add(wall[i].title + '#' + wall[i].value.toString());
      }
    }
    savePaint.clear();
    for (var i = 0; i < paint.length; i++) {
      if (paint[i].value != false) {
        savePaint.add(paint[i].title + '#' + paint[i].value.toString());
      }
    }
    savePathology.clear();
    for (var i = 0; i < pathology.length; i++) {
      if (pathology[i].value != false) {
        savePathology
            .add(pathology[i].title + '#' + pathology[i].value.toString());
      }
    }
    db.collection('surveys').doc(widget.idSurvey).update({
      "Patologia": savePathology.toSet().toList(),
      "Tipo de Imóvel": saveType.toSet().toList(),
      "Infraestrutura": saveInfra.toSet().toList(),
      "Situação": saveSituation.toSet().toList(),
      "Cota Greide": saveQuota.toSet().toList(),
      "Posição da Unidade": savePosition.toSet().toList(),
      "Telhado": saveRoof.toSet().toList(),
      "Muro": saveWall.toSet().toList(),
      "Pintura": savePaint.toSet().toList(),
      "Portas externas": saveExtern.toSet().toList(),
      "Piso": saveFloor.toSet().toList(),
      "Portas Internas": saveIntern.toSet().toList(),
      "Janelas": saveWindowns.toSet().toList(),
      "Pintura Interna": saveInternPaint.toSet().toList(),
      "Bancada": saveBalcony.toSet().toList(),
      "Quadro Elétrico": saveSwitchBoard.toSet().toList(),
      "Revestimento da Cozinha": saveKitchen.toSet().toList(),
      "Revestimento do Banheiro": saveBathroom.toSet().toList(),
      "Revestimento do Tanque": saveTank.toSet().toList(),
      "Padrão de Acabamento": savePattern.toSet().toList(),
      "Estado de Conservação": saveState.toSet().toList(),
      "Teto da Unidade": saveUnityroof.toSet().toList(),
      "Condominio Bloco": saveBlock.toSet().toList(),
    });
    _UnitysTable();
  }

  final TextEditingController _controllerObs = TextEditingController();
  final block = [
    CheckBoxModel(title: 'Portaria/Guarita'),
    CheckBoxModel(title: 'Equipe de Segurança'),
    CheckBoxModel(title: 'Salão de Festas'),
    CheckBoxModel(title: 'PlayGround'),
    CheckBoxModel(title: 'Sauna/Ofurô'),
    CheckBoxModel(title: 'Quadra Poliesportiva'),
    CheckBoxModel(title: 'Quadra de Tênis'),
    CheckBoxModel(title: 'Mini Quadra'),
    CheckBoxModel(title: 'Piscina'),
    CheckBoxModel(title: 'Espaço com churrasqueira'),
    CheckBoxModel(title: 'Aquecimento Solar'),
    CheckBoxModel(title: 'Gerador'),
    CheckBoxModel(title: 'Campo de futebol/Mini Golf'),
    CheckBoxModel(title: 'Poço Artesiano'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerBlock = TextEditingController();
  final kitchen = [
    CheckBoxModel(title: 'Ceramico'),
    CheckBoxModel(title: 'Barra lisa'),
    CheckBoxModel(title: '1/2 altura'),
    CheckBoxModel(title: 'Piso a teto'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerKitchen = TextEditingController();

  final bathroom = [
    CheckBoxModel(title: 'Ceramico'),
    CheckBoxModel(title: 'Barra lisa'),
    CheckBoxModel(title: '1/2 altura'),
    CheckBoxModel(title: 'Piso a teto'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerBathroom = TextEditingController();
  final tank = [
    CheckBoxModel(title: 'Ceramico'),
    CheckBoxModel(title: 'Barra lisa'),
    CheckBoxModel(title: '1/2 altura'),
    CheckBoxModel(title: 'Piso a teto'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerTank = TextEditingController();

  final pattern = [
    CheckBoxModel(title: 'Luxo'),
    CheckBoxModel(title: 'Alto'),
    CheckBoxModel(title: 'Normal/Alto'),
    CheckBoxModel(title: 'Normal'),
    CheckBoxModel(title: 'Normal/Baixo'),
    CheckBoxModel(title: 'Baixo'),
    CheckBoxModel(title: 'Mínimo'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerPattern = TextEditingController();

  final state = [
    CheckBoxModel(title: 'Novo'),
    CheckBoxModel(title: 'Bom'),
    CheckBoxModel(title: 'Regular'),
    CheckBoxModel(title: 'Reparos simples'),
    CheckBoxModel(title: 'Reparos importantes'),
    CheckBoxModel(title: 'Ruim'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerState = TextEditingController();

  final unityroof = [
    CheckBoxModel(title: 'Forro PVC'),
    CheckBoxModel(title: 'Forro Gesso'),
    CheckBoxModel(title: 'Forro Paulista'),
    CheckBoxModel(title: 'Laje'),
    CheckBoxModel(title: 'Telhado aparente'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerUnityRoof = TextEditingController();

  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerPrice = TextEditingController();

  final extern = [
    CheckBoxModel(title: 'Madeira'),
    CheckBoxModel(title: 'Blindex'),
    CheckBoxModel(title: 'Aço'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerExtern = TextEditingController();

  final floor = [
    CheckBoxModel(title: 'Cerâmico'),
    CheckBoxModel(title: 'Porcelanato'),
    CheckBoxModel(title: 'Cimento liso'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerFloor = TextEditingController();

  final Intern = [
    CheckBoxModel(title: 'Madeira'),
    CheckBoxModel(title: 'Blindex'),
    CheckBoxModel(title: 'Aço'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerIntern = TextEditingController();

  final Windows = [
    CheckBoxModel(title: 'Madeira'),
    CheckBoxModel(title: 'Blindex'),
    CheckBoxModel(title: 'Aço'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerWindows = TextEditingController();

  final InternPaint = [
    CheckBoxModel(title: 'PVA'),
    CheckBoxModel(title: 'Acrílica'),
    CheckBoxModel(title: 'Latex'),
    CheckBoxModel(title: 'Textura'),
    CheckBoxModel(title: 'Nenhuma'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerInternPaint = TextEditingController();

  final balcony = [
    CheckBoxModel(title: 'Granito'),
    CheckBoxModel(title: 'Mármore'),
    CheckBoxModel(title: 'Ardósia'),
    CheckBoxModel(title: 'Sintético'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerBalcony = TextEditingController();

  final switchboard = [
    CheckBoxModel(title: '2 Disjuntores'),
    CheckBoxModel(title: '3 Disjuntores'),
    CheckBoxModel(title: '4 Disjuntores'),
    CheckBoxModel(title: '4+ Disjuntores'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerSwitchBoard = TextEditingController();

  final type = [
    CheckBoxModel(title: 'Residencial'),
    CheckBoxModel(title: 'Comercial'),
    CheckBoxModel(title: 'Misto'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerType = TextEditingController();

  final infra = [
    CheckBoxModel(title: 'Rede de Água'),
    CheckBoxModel(title: 'Iluminação Pública'),
    CheckBoxModel(title: 'Pavimentação'),
    CheckBoxModel(title: 'Rede de Água Pluvial'),
    CheckBoxModel(title: 'Rede de Esgoto'),
    CheckBoxModel(title: 'Fossa Séptica'),
    CheckBoxModel(title: 'Semidouro'),
    CheckBoxModel(title: 'Cisterna'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerInfra = TextEditingController();

  final situation = [
    CheckBoxModel(title: 'Meio de Quadra'),
    CheckBoxModel(title: 'Esquina'),
    CheckBoxModel(title: 'Quadra Inteira'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerSituation = TextEditingController();
  final quota = [
    CheckBoxModel(title: 'Abaixo'),
    CheckBoxModel(title: 'Mesmo Nivel'),
    CheckBoxModel(title: 'Acima'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerQuota = TextEditingController();
  final position = [
    CheckBoxModel(title: 'Isolada'),
    CheckBoxModel(title: 'Junto a uma Lateral'),
    CheckBoxModel(title: 'Junto as Laterais'),
    CheckBoxModel(title: 'Geminada'),
    CheckBoxModel(title: 'Ocupa todo terreno'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerPosition = TextEditingController();
  final roof = [
    CheckBoxModel(title: 'Concreto'),
    CheckBoxModel(title: 'Plan'),
    CheckBoxModel(title: 'Americana'),
    CheckBoxModel(title: 'Fibrocimento'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerRoof = TextEditingController();
  final wall = [
    CheckBoxModel(title: 'Alvenaria'),
    CheckBoxModel(title: 'Placa'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerWall = TextEditingController();
  final paint = [
    CheckBoxModel(title: 'PVA'),
    CheckBoxModel(title: 'Acrílica'),
    CheckBoxModel(title: 'Latex'),
    CheckBoxModel(title: 'Textura'),
    CheckBoxModel(title: 'Nenhuma'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerPaint = TextEditingController();
  final pathology = [
    CheckBoxModel(title: 'Telhado selado'),
    CheckBoxModel(title: 'Solapamentos Visiveis'),
    CheckBoxModel(title: 'Umidade Paredes'),
    CheckBoxModel(title: 'Umidade Teto'),
    CheckBoxModel(title: 'Trincas/Fissuras/Rachaduras'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerPathology = TextEditingController();

  final TextEditingController _controllerOpenArea = TextEditingController();
  final TextEditingController _controllerClosedArea = TextEditingController();
  final TextEditingController _controllerTerrainArea = TextEditingController();
  final TextEditingController _controllerTotalArea = TextEditingController();

  List saveBlock = [];
  List saveKitchen = [];
  List saveBathroom = [];
  List saveTank = [];
  List savePattern = [];
  List saveState = [];
  List saveUnityroof = [];
  List saveExtern = [];
  List saveFloor = [];
  List saveIntern = [];
  List saveWindowns = [];
  List saveInternPaint = [];
  List saveBalcony = [];
  List saveSwitchBoard = [];
  List saveType = [];
  List saveInfra = [];
  List saveSituation = [];
  List saveQuota = [];
  List savePosition = [];
  List saveRoof = [];
  List saveWall = [];
  List savePaint = [];
  List savePathology = [];
  int order = 0;



  @override
  void initState() {
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
          SizedBox(width: width * 0.04),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                            Container(
                              width: width * 0.25,
                              child: TextCustom(
                                  text: "Idade",
                                  size: 14.0,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          width: width * 0.25,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.2,
                            controller: _controllerAge,
                            hint: " 00 ",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: "Valor",
                                  size: 14.0,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          width: width * 0.45,
                          child: InputRegister(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              RealInputFormatter(moeda: true)
                            ],
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.53,
                            controller: _controllerPrice,
                            hint: 'R\$100.000.00',
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                        SizedBox(width: width * 0.045)
                      ],
                    )
                  ],
                ),
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
                            Container(
                              width: width * 0.7,
                              child: TextCustom(
                                  text: "Área Coberta",
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
                            controller: _controllerClosedArea,
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
                            Container(
                              width: width * 0.7,
                              child: TextCustom(
                                  text: "Área Descoberta",
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
                            controller: _controllerOpenArea,
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
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              width: width * 0.7,
                              child: TextCustom(
                                text: "Finalidade",
                                size: 16.0,
                                color: PaletteColors.grey,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              height: 50,
                              width: width * 0.7,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: PaletteColors.greyInput),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  items: goal
                                      .map((goal) => DropdownMenuItem<String>(
                                          value: goal,
                                          child: TextCustom(
                                            text: goal,
                                            color: PaletteColors.grey,
                                          )))
                                      .toList(),
                                  value: selectedGoal,
                                  onChanged: (goal) =>
                                      setState(() => selectedGoal = goal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              width: width * 0.7,
                              child: TextCustom(
                                text: "Origem da Informação",
                                size: 16.0,
                                color: PaletteColors.grey,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              width: width * 0.7,
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: PaletteColors.greyInput),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  items: infoOrigin
                                      .map((infoOrigin) =>
                                          DropdownMenuItem<String>(
                                              value: infoOrigin,
                                              child: TextCustom(
                                                text: infoOrigin,
                                                color: PaletteColors.grey,
                                              )))
                                      .toList(),
                                  value: selectedInfo,
                                  onChanged: (infoOrigin) =>
                                      setState(() => selectedInfo = infoOrigin),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                TextCustom(
                  text: "Patologia",
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
                    ...pathology.map(buildSingleCheckbox).toList(),
                  ],
                ), //Tipo de imovel
                InputRegister(
                    controller: _controllerPathology,
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
                SizedBox(height: height * 0.01),
                TextCustom(
                  text: "Tipo de Imóvel",
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
                    ...type.map(buildSingleCheckbox).toList(),
                  ],
                ), //Tipo de imovel
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
                  text: "Infraestrutura",
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
                    ...infra.map(buildSingleCheckbox).toList(),
                  ],
                ), //Infraestrutura
                InputRegister(
                    controller: _controllerInfra,
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
                ),
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...situation.map(buildSingleCheckbox).toList(),
                  ],
                ), //Situação
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
                  text: "Cota /Greide",
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
                    ...quota.map(buildSingleCheckbox).toList(),
                  ],
                ), //Cota /Greide
                InputRegister(
                    controller: _controllerQuota,
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
                  text: "Posição da Unidade",
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
                    ...position.map(buildSingleCheckbox).toList(),
                  ],
                ), // Posição da Unidade
                InputRegister(
                    controller: _controllerPosition,
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
                  text: "Telhado",
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
                    ...roof.map(buildSingleCheckbox).toList(),
                  ],
                ), // Telhado
                InputRegister(
                    controller: _controllerRoof,
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
                  text: "Muro",
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
                    ...wall.map(buildSingleCheckbox).toList(),
                  ],
                ), // Muro
                InputRegister(
                    controller: _controllerWall,
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
                  text: "Pintura",
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
                    ...paint.map(buildSingleCheckbox).toList(),
                  ],
                ), // Pintura
                InputRegister(
                    controller: _controllerPaint,
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
                    TextCustom(
                      text: "Revestimento da Cozinha",
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
                        ...kitchen.map(buildSingleCheckbox).toList(),
                      ],
                    ), //Revestimento da Cozinha
                    InputRegister(
                        controller: _controllerKitchen,
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
                      text: "Revestimento do Banheiro",
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
                        ...bathroom.map(buildSingleCheckbox).toList(),
                      ],
                    ), //Revestimento do Banheiro
                    InputRegister(
                        controller: _controllerBathroom,
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
                      text: "Revestimento do Tanque",
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
                        ...tank.map(buildSingleCheckbox).toList(),
                      ],
                    ), //Revestimento do Tanque
                    InputRegister(
                        controller: _controllerTank,
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
                      text: "Padrão de Acabamento",
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
                        ...pattern.map(buildSingleCheckbox).toList(),
                      ],
                    ), //Padrão de Acabamento
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
                      text: "Estado de Conservação",
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
                        ...state.map(buildSingleCheckbox).toList(),
                      ],
                    ), //Estado de Conservação
                    InputRegister(
                        controller: _controllerState,
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
                      text: "Teto da Unidade",
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
                        ...unityroof.map(buildSingleCheckbox).toList(),
                      ],
                    ), //Teto da Unidade
                    InputRegister(
                        controller: _controllerUnityRoof,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextCustom(
                      text: "Unidade",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Quartos",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nRoom > 0) {
                                  nRoom = nRoom - 1;

                                  SRoom = "$nRoom";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SRoom,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nRoom >= 0) {
                                  nRoom = nRoom + 1;
                                  SRoom = "$nRoom";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ), //Quartos
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Banheiros sociais",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nSocialBathroom > 0) {
                                  nSocialBathroom = nSocialBathroom - 1;
                                  SSocialBathroom = "$nSocialBathroom";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SSocialBathroom,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nSocialBathroom >= 0) {
                                  nSocialBathroom = nSocialBathroom + 1;
                                  SSocialBathroom = "$nSocialBathroom";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Banheiros sociais
                    Row(
                      children: [
                        TextCustom(
                          text: "Banheiros privativos",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nPrivateBathroom > 0) {
                                  nPrivateBathroom = nPrivateBathroom - 1;
                                  SPrivateBathroom = "$nPrivateBathroom";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SPrivateBathroom,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nPrivateBathroom >= 0) {
                                  nPrivateBathroom = nPrivateBathroom + 1;

                                  SPrivateBathroom = "$nPrivateBathroom";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Banheiros privativos
                    Row(
                      children: [
                        TextCustom(
                          text: "Lavabos",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nLav > 0) {
                                  nLav = nLav - 1;
                                  SLav = "$nLav";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SLav,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nLav >= 0) {
                                  nLav = nLav + 1;
                                  SLav = "$nLav";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Lavabos
                    Row(
                      children: [
                        TextCustom(
                          text: "Banheiro de serviço",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nServiceBathroom > 0) {
                                  nServiceBathroom = nServiceBathroom - 1;
                                  SServiceBathroom = '$nServiceBathroom';
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SServiceBathroom,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nServiceBathroom >= 0) {
                                  nServiceBathroom = nServiceBathroom + 1;
                                  SServiceBathroom = '$nServiceBathroom';
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Banheiro de serviço
                    Row(
                      children: [
                        TextCustom(
                          text: "Quarto de empregada",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nMaidRoom > 0) {
                                  nMaidRoom = nMaidRoom - 1;
                                  SMaidRoom = "$nMaidRoom";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SMaidRoom,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nMaidRoom >= 0) {
                                  nMaidRoom = nMaidRoom + 1;
                                  SMaidRoom = '$nMaidRoom';
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Quarto de empregada
                    Row(
                      children: [
                        TextCustom(
                          text: "Varanda/Sacada",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nBalcony > 0) {
                                  nBalcony = nBalcony - 1;
                                  SBalcony = "$nBalcony";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SBalcony,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nBalcony >= 0) {
                                  nBalcony = nBalcony + 1;
                                  SBalcony = "$nBalcony";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Varanda/sacada
                    Row(
                      children: [
                        Container(
                          width: width * 0.4,
                          child: TextCustom(
                            text: "Número de armários completos",
                            size: 16.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.normal,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nCompleteCabinets > 0) {
                                  nCompleteCabinets = nCompleteCabinets - 1;
                                  SCompleteCabinets = "$nCompleteCabinets";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SCompleteCabinets,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nCompleteCabinets >= 0) {
                                  nCompleteCabinets = nCompleteCabinets + 1;
                                  SCompleteCabinets = "$nCompleteCabinets";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Numero de armarios completos
                    Row(
                      children: [
                        TextCustom(
                          text: "Cozinha",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nKitchen > 0) {
                                  nKitchen = nKitchen - 1;
                                  SKitchen = "$nKitchen";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SKitchen,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nKitchen >= 0) {
                                  nKitchen = nKitchen + 1;
                                  SKitchen = "$nKitchen";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Cozinha
                    Row(
                      children: [
                        TextCustom(
                          text: "Sala",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nRestRoom > 0) {
                                  nRestRoom = nRestRoom - 1;
                                  SRestRoom = "$nRestRoom";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SRestRoom,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nRestRoom >= 0) {
                                  nRestRoom = nRestRoom + 1;
                                  SRestRoom = "$nRestRoom";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Sala
                    Row(
                      children: [
                        Container(
                          width: width * 0.4,
                          child: TextCustom(
                            text: "Área de serviço coberto",
                            size: 16.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.normal,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nServiceAreaRoofed > 0) {
                                  nServiceAreaRoofed = nServiceAreaRoofed - 1;
                                  SServiceAreaRoofed = "$nServiceAreaRoofed";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SServiceAreaRoofed,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nServiceAreaRoofed >= 0) {
                                  nServiceAreaRoofed = nServiceAreaRoofed + 1;
                                  SServiceAreaRoofed = "$nServiceAreaRoofed";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Area de serviço coberto
                    Row(
                      children: [
                        Container(
                          width: width * 0.4,
                          child: TextCustom(
                            text: "Área de serviço descoberta",
                            size: 16.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.normal,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nServiceAreaUnroofed > 0) {
                                  nServiceAreaUnroofed =
                                      nServiceAreaUnroofed - 1;
                                  SServiceAreaUnroofed =
                                      "$nServiceAreaUnroofed";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SServiceAreaUnroofed,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nServiceAreaUnroofed >= 0) {
                                  nServiceAreaUnroofed =
                                      nServiceAreaUnroofed + 1;
                                  SServiceAreaUnroofed =
                                      "$nServiceAreaUnroofed";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Area de serviço descoberto
                    Row(
                      children: [
                        Container(
                          width: width * 0.4,
                          child: TextCustom(
                            text: "Garagem coberta",
                            size: 16.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.normal,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nOpenGarage > 0) {
                                  nOpenGarage = nOpenGarage - 1;
                                  SOpenGarage = "$nOpenGarage";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SOpenGarage,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nOpenGarage >= 0) {
                                  nOpenGarage = nOpenGarage + 1;
                                  SOpenGarage = "$nOpenGarage";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Garagem Coberta
                    Row(
                      children: [
                        TextCustom(
                          text: "Garagem Descoberta",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nClosedGarage > 0) {
                                  nClosedGarage = nClosedGarage - 1;
                                  SClosedGarage = "$nClosedGarage";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SClosedGarage,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nClosedGarage >= 0) {
                                  nClosedGarage = nClosedGarage + 1;
                                  SClosedGarage = "$nClosedGarage";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Garagem Descoberta
                    Row(
                      children: [
                        TextCustom(
                          text: "Ar condicionado",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nAc > 0) {
                                  nAc = nAc - 1;
                                  SAc = "$nAc";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SAc,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nAc >= 0) {
                                  nAc = nAc + 1;
                                  SAc = "$nAc";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ), //Ar condicionado
                    Row(
                      children: [
                        TextCustom(
                          text: "Piscina",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nPool > 0) {
                                  nPool = nPool - 1;
                                  SPool = "$nPool";
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: width * 0.12,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.0)),
                            child: TextCustom(
                              text: SPool,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: PaletteColors.grey,
                            ),
                            constraints: BoxConstraints(
                                minHeight: 28,
                                minWidth: 28,
                                maxHeight: 28,
                                maxWidth: 28),
                            iconSize: 16.0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                if (nPool >= 0) {
                                  nPool = nPool + 1;
                                  SPool = "$nPool";
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ), //Piscina
                    Divider(
                      thickness: 1.0,
                    ),
                    TextCustom(
                      text: "Condominio/Bloco",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...block.map(buildSingleCheckbox).toList(),
                      ],
                    ), //Revestimento do Banheiro
                    InputRegister(
                        controller: _controllerBlock,
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
                          hint: ' ',
                          fonts: 14.0,
                          keyboardType: TextInputType.text,
                          width: width * 0.5,
                          sizeIcon: 0.0,
                          icons: Icons.height,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput),
                    ),
                    SizedBox(height: height * 0.1),

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
        onChanged: (value) => setState(() {
          checkBoxModel.value = value!;
        }),
        activeColor: PaletteColors.primaryColor,
        checkColor: PaletteColors.white,
      );
}
