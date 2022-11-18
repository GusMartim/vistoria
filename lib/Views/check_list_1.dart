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
  TextEditingController _controllerRoom = TextEditingController();
  int nSocialBathroom = 0;
  String SSocialBathroom = '0';
  TextEditingController _controllerSocialBathroom = TextEditingController();
  int nPrivateBathroom = 0;
  String SPrivateBathroom = '0';
  TextEditingController _controllerPrivateBathroom = TextEditingController();
  int nLav = 0;
  String SLav = '0';
  TextEditingController _controllerLavabos = TextEditingController();
  int nServiceBathroom = 0;
  String SServiceBathroom = '0';
  TextEditingController _controllerServiceBathroom = TextEditingController();
  int nMaidRoom = 0;
  String SMaidRoom = '0';
  TextEditingController _controllerMaidRoom = TextEditingController();
  int nBalcony = 0;
  String SBalcony = '0';
  TextEditingController _controllerBalconys = TextEditingController();
  int nCompleteCabinets = 0;
  String SCompleteCabinets = '0';
  TextEditingController _controllerCompleteCabinets = TextEditingController();
  int nKitchen = 0;
  String SKitchen = '0';
  TextEditingController _controllerKitchens = TextEditingController();
  int nRestRoom = 0;
  String SRestRoom = '0';
  TextEditingController _controllerRestRoom = TextEditingController();
  int nServiceAreaRoofed = 0;
  String SServiceAreaRoofed = '0';
  TextEditingController _controllerServiceAreaRoofed = TextEditingController();
  int nServiceAreaUnroofed = 0;
  String SServiceAreaUnroofed = '0';
  TextEditingController _controllerNumber = TextEditingController();
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

  String _urlPhoto = '';
  String selectedText = 'Imagens';
  FirebaseStorage storage = FirebaseStorage.instance;
  final Map<String, dynamic> data = HashMap();
  FirebaseFirestore db = FirebaseFirestore.instance;

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
      pathology.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    type.clear();
    for (int i = 6; i <= 9; i++) {
      var splitted = saveChecklist[i].replaceAll("2", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      type.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    infra.clear();
    for (int i = 10; i <= 18; i++) {
      var splitted = saveChecklist[i].replaceAll("3", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      infra.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    situation.clear();
    for (int i = 19; i <= 22; i++) {
      var splitted = saveChecklist[i].replaceAll("4", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      situation.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    quota.clear();
    for (int i = 23; i <= 26; i++) {
      var splitted = saveChecklist[i].replaceAll("5", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      quota.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    position.clear();
    for (int i = 27; i <= 32; i++) {
      var splitted = saveChecklist[i].replaceAll("6", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      position.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    roof.clear();
    for (int i = 33; i <= 37; i++) {
      var splitted = saveChecklist[i].replaceAll("7", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      roof.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    wall.clear();
    for (int i = 38; i <= 41; i++) {
      var splitted = saveChecklist[i].replaceAll("8", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      wall.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    paint.clear();
    for (int i = 42; i <= 47; i++) {
      var splitted = saveChecklist[i].replaceAll("9", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      paint.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    extern.clear();
    for (int i = 48; i <= 51; i++) {
      var splitted = saveChecklist[i].replaceAll("10", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      extern.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    floor.clear();
    for (int i = 52; i <= 55; i++) {
      var splitted = saveChecklist[i].replaceAll("11", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      floor.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    Intern.clear();
    for (int i = 56; i <= 59; i++) {
      var splitted = saveChecklist[i].replaceAll("12", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      Intern.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    Windows.clear();
    for (int i = 60; i <= 63; i++) {
      var splitted = saveChecklist[i].replaceAll("13", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      Windows.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    InternPaint.clear();
    for (int i = 64; i <= 69; i++) {
      var splitted = saveChecklist[i].replaceAll("14", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      InternPaint.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    balcony.clear();
    for (int i = 70; i <= 74; i++) {
      var splitted = saveChecklist[i].replaceAll("15", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      balcony.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    switchboard.clear();
    for (int i = 75; i <= 80; i++) {
      var splitted = saveChecklist[i].replaceAll("16", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      switchboard.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    kitchen.clear();
    for (int i = 81; i <= 86; i++) {
      var splitted = saveChecklist[i].replaceAll("17", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      kitchen.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    bathroom.clear();
    for (int i = 87; i <= 92; i++) {
      var splitted = saveChecklist[i].replaceAll("18", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      bathroom.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    tank.clear();
    for (int i = 93; i <= 98; i++) {
      var splitted = saveChecklist[i].replaceAll("19", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      tank.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    pattern.clear();
    for (int i = 99; i <= 106; i++) {
      var splitted = saveChecklist[i].replaceAll("20", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      pattern.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    state.clear();
    for (int i = 107; i <= 113; i++) {
      var splitted = saveChecklist[i].replaceAll("21", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      state.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    unityroof.clear();
    for (int i = 114; i <= 119; i++) {
      var splitted = saveChecklist[i].replaceAll("22", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      unityroof.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    block.clear();
    for (int i = 120; i <= 134; i++) {
      var splitted = saveChecklist[i].replaceAll("23", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      block.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }

    setState(() {
      _controllerAge = TextEditingController(text: data?["age"]);
      _controllerOpenArea = TextEditingController(text: data?["OpenArea"]);
      _controllerClosedArea = TextEditingController(text: data?["ClosedArea"]);
      _controllerTerrainArea =
          TextEditingController(text: data?["TerrainArea"]);
      _controllerPrice = TextEditingController(text: data?["price"]);
      _controllerPathology = TextEditingController(text: data?["Pathology"]);
      _controllerType = TextEditingController(text: data?["type"]);
      _controllerInfra = TextEditingController(text: data?["infra"]);
      _controllerSituation = TextEditingController(text: data?["situation"]);
      _controllerQuota = TextEditingController(text: data?["quota"]);
      _controllerPosition = TextEditingController(text: data?["unPosition"]);
      _controllerRoof = TextEditingController(text: data?["roof"]);
      _controllerWall = TextEditingController(text: data?["wall"]);
      _controllerInternPaint =
          TextEditingController(text: data?["internPaint"]);
      _controllerPaint = TextEditingController(text: data?["externPaint"]);
      _controllerExtern = TextEditingController(text: data?["externDoors"]);
      _controllerFloor = TextEditingController(text: data?["floor"]);
      _controllerIntern = TextEditingController(text: data?["internDoors"]);
      _controllerWindows = TextEditingController(text: data?["windowns"]);
      _controllerBalcony = TextEditingController(text: data?["balcony"]);
      _controllerSwitchBoard =
          TextEditingController(text: data?["switchboard"]);
      _controllerKitchen = TextEditingController(text: data?["kitchen"]);
      _controllerBathroom = TextEditingController(text: data?["bathroom"]);
      _controllerTank = TextEditingController(text: data?["tank"]);
      _controllerPattern = TextEditingController(text: data?["pattern"]);
      _controllerState = TextEditingController(text: data?["state"]);
      _controllerUnityRoof = TextEditingController(text: data?["unRoof"]);
      _controllerBlock = TextEditingController(text: data?["block"]);
      _controllerObs = TextEditingController(text: data?["obs"]);

      selectedGoal = data?["Goal"];
      selectedInfo = data?["Origin"];
      SRoom = data?["rooms"];
      SSocialBathroom = data?["socialbathrooms"];
      SPrivateBathroom = data?["privatebathrooms"];
      SLav = data?["lavs"];
      SServiceBathroom = data?["servicebathrooms"];
      SMaidRoom = data?["maidrooms"];
      SBalcony = data?["balconys"];
      SCompleteCabinets = data?["completecontainers"];
      SKitchen = data?["kitchens"];
      SRestRoom = data?["restrooms"];
      SServiceAreaRoofed = data?["servicearearoofed"];
      SServiceAreaUnroofed = data?["serviceareaunroofed"];
      SClosedGarage = data?["garageroofed"];
      SOpenGarage = data?["garageunroofed"];
      SAc = data?["acs"];
      SPool = data?["pools"];
    });
  }
  int nsurvey=0;
  String title = '';
  getOrder()async{
    DocumentSnapshot snapshot = await db
        .collection('surveyNumber')
        .doc('surveyNumber')
        .get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      order = data?["surveyNumber"] ?? 0;
      title = '${order + 1}';

    });

  }
  getNSurvey()async{
    DocumentSnapshot snapshot = await db
        .collection('surveys')
        .doc(widget.idSurvey)
        .get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      nsurvey = data?["Nsurvey"] ?? 0;
    });
    if(nsurvey== 0){
      getOrder();
    }else{
      setState(() {
        title = '$nsurvey';
      });

    }

  }
  List<XFile>? imageFileList = [];
  Future selectImages() async{
    int i = 0;
    final List<XFile>? selectedImages = await ImagePicker().pickMultiImage(imageQuality: 30);
    if(selectedImages!.isNotEmpty){
      imageFileList!.addAll(selectedImages);
    }
    setState(() {
      Navigator.of(context).pop();

    });
    for (int i = 0; i <imageFileList!.length; i++) {
      _uploadImages(imageFileList![i]);
    }
  }
  Future<void> _uploadImages(XFile file) async{
    print('chegou');
    int i = 0;
    Uint8List archive = await file.readAsBytes();
    if(archive!.isNotEmpty){
      Reference pastaRaiz = storage.ref();
      Reference arquivo = pastaRaiz
          .child("surveys")
          .child(selectedText + "_" + DateTime.now().toString() + ".jpg");
      await arquivo.putData(archive,SettableMetadata(contentType:'application/octet-stream')).then((upload) async {
        upload.ref.getDownloadURL().then((value) {
          Map<String, dynamic> dateUpdate = {
            'photoUrl': FieldValue.arrayUnion([value.toString()]),
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
  Future _savePhotoCamera() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 30);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.picture = imageTemporary;
        setState(() {

          Navigator.of(context).pop();
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

    await arquivo.putFile(picture!,SettableMetadata(contentType:'application/octet-stream')).then((value) async{
      value.ref.getDownloadURL().then((value) {
        setState(() {
          _urlPhoto = value;
        });
        _urlImageFirestore(value);

      });


    }


    );




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
    _unityModel.stateList = _controllerState.text;
    _unityModel.unRoof = _controllerUnityRoof.text;
    _unityModel.block = _controllerBlock.text;
    _unityModel.pathology = _controllerPathology.text;
    _unityModel.idSurvey = widget.idSurvey;

    _saveUnitys(_unityModel);
  }

  _saveCheckList() async {
    saveChecklist.clear();
    for (var i = 0; i < pathology.length; i++) {
      saveChecklist
          .add(pathology[i].title + '1' + '#' + pathology[i].value.toString());
    }
    for (var i = 0; i < type.length; i++) {
      saveChecklist.add(type[i].title + '2' + '#' + type[i].value.toString());
    }

    for (var i = 0; i < infra.length; i++) {
      saveChecklist.add(infra[i].title + '3' + '#' + infra[i].value.toString());
    }
    for (var i = 0; i < situation.length; i++) {
      saveChecklist
          .add(situation[i].title + '4' + '#' + situation[i].value.toString());
    }

    for (var i = 0; i < quota.length; i++) {
      saveChecklist.add(quota[i].title + '5' + '#' + quota[i].value.toString());
    }
    for (var i = 0; i < position.length; i++) {
      saveChecklist
          .add(position[i].title + '6' + '#' + position[i].value.toString());
    }

    for (var i = 0; i < roof.length; i++) {
      saveChecklist.add(roof[i].title + '7' + '#' + roof[i].value.toString());
    }

    for (var i = 0; i < wall.length; i++) {
      saveChecklist.add(wall[i].title + '8' + '#' + wall[i].value.toString());
    }

    for (var i = 0; i < paint.length; i++) {
      saveChecklist.add(paint[i].title + '9' + '#' + paint[i].value.toString());
    }
    for (var i = 0; i < extern.length; i++) {
      saveChecklist
          .add(extern[i].title + '10' + '#' + extern[i].value.toString());
    }

    for (var i = 0; i < floor.length; i++) {
      saveChecklist
          .add(floor[i].title + '11' + '#' + floor[i].value.toString());
    }

    for (var i = 0; i < Intern.length; i++) {
      saveChecklist
          .add(Intern[i].title + '12' + '#' + Intern[i].value.toString());
    }

    for (var i = 0; i < Windows.length; i++) {
      saveChecklist
          .add(Windows[i].title + '13' + '#' + Windows[i].value.toString());
    }

    for (var i = 0; i < InternPaint.length; i++) {
      saveChecklist.add(
          InternPaint[i].title + '14' + '#' + InternPaint[i].value.toString());
    }

    for (var i = 0; i < balcony.length; i++) {
      saveChecklist
          .add(balcony[i].title + '15' + '#' + balcony[i].value.toString());
    }

    for (var i = 0; i < switchboard.length; i++) {
      saveChecklist.add(
          switchboard[i].title + '16' + '#' + switchboard[i].value.toString());
    }
    for (var i = 0; i < kitchen.length; i++) {
      saveChecklist
          .add(kitchen[i].title + '17' + '#' + kitchen[i].value.toString());
    }

    for (var i = 0; i < bathroom.length; i++) {
      saveChecklist
          .add(bathroom[i].title + '18' + '#' + bathroom[i].value.toString());
    }

    for (var i = 0; i < tank.length; i++) {
      saveChecklist.add(tank[i].title + '19' + '#' + tank[i].value.toString());
    }

    for (var i = 0; i < pattern.length; i++) {
      saveChecklist
          .add(pattern[i].title + '20' + '#' + pattern[i].value.toString());
    }

    for (var i = 0; i < state.length; i++) {
      saveChecklist
          .add(state[i].title + '21' + '#' + state[i].value.toString());
    }

    for (var i = 0; i < unityroof.length; i++) {
      saveChecklist
          .add(unityroof[i].title + '22' + '#' + unityroof[i].value.toString());
    }
    for (var i = 0; i < block.length; i++) {
      saveChecklist
          .add(block[i].title + '23' + '#' + block[i].value.toString());
    }

    db.collection('surveys').doc(widget.idSurvey).update({
      "checklist": saveChecklist.toSet().toList(),
    });
    _UnitysTable();
  }

  List<CheckBoxModel> itens = [];
  TextEditingController _controllerObs = TextEditingController();
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
  TextEditingController _controllerBlock = TextEditingController();
  final kitchen = [
    CheckBoxModel(title: 'Ceramico'),
    CheckBoxModel(title: 'Barra lisa'),
    CheckBoxModel(title: '1/2 altura'),
    CheckBoxModel(title: 'Piso a teto'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerKitchen = TextEditingController();

  final bathroom = [
    CheckBoxModel(title: 'Ceramico'),
    CheckBoxModel(title: 'Barra lisa'),
    CheckBoxModel(title: '1/2 altura'),
    CheckBoxModel(title: 'Piso a teto'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerBathroom = TextEditingController();
  final tank = [
    CheckBoxModel(title: 'Ceramico'),
    CheckBoxModel(title: 'Barra lisa'),
    CheckBoxModel(title: '1/2 altura'),
    CheckBoxModel(title: 'Piso a teto'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerTank = TextEditingController();

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
  TextEditingController _controllerPattern = TextEditingController();

  final state = [
    CheckBoxModel(title: 'Novo'),
    CheckBoxModel(title: 'Bom'),
    CheckBoxModel(title: 'Regular'),
    CheckBoxModel(title: 'Reparos simples'),
    CheckBoxModel(title: 'Reparos importantes'),
    CheckBoxModel(title: 'Ruim'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerState = TextEditingController();

  final unityroof = [
    CheckBoxModel(title: 'Forro PVC'),
    CheckBoxModel(title: 'Forro Gesso'),
    CheckBoxModel(title: 'Forro Paulista'),
    CheckBoxModel(title: 'Laje'),
    CheckBoxModel(title: 'Telhado aparente'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerUnityRoof = TextEditingController();

  TextEditingController _controllerAge = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();

  final extern = [
    CheckBoxModel(title: 'Madeira'),
    CheckBoxModel(title: 'Blindex'),
    CheckBoxModel(title: 'Aço'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerExtern = TextEditingController();

  final floor = [
    CheckBoxModel(title: 'Cerâmico'),
    CheckBoxModel(title: 'Porcelanato'),
    CheckBoxModel(title: 'Cimento liso'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerFloor = TextEditingController();

  final Intern = [
    CheckBoxModel(title: 'Madeira'),
    CheckBoxModel(title: 'Blindex'),
    CheckBoxModel(title: 'Aço'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerIntern = TextEditingController();

  final Windows = [
    CheckBoxModel(title: 'Madeira'),
    CheckBoxModel(title: 'Blindex'),
    CheckBoxModel(title: 'Aço'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerWindows = TextEditingController();

  final InternPaint = [
    CheckBoxModel(title: 'PVA'),
    CheckBoxModel(title: 'Acrílica'),
    CheckBoxModel(title: 'Latex'),
    CheckBoxModel(title: 'Textura'),
    CheckBoxModel(title: 'Nenhuma'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerInternPaint = TextEditingController();

  final balcony = [
    CheckBoxModel(title: 'Granito'),
    CheckBoxModel(title: 'Mármore'),
    CheckBoxModel(title: 'Ardósia'),
    CheckBoxModel(title: 'Sintético'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerBalcony = TextEditingController();

  final switchboard = [
    CheckBoxModel(title: '2 Disjuntores'),
    CheckBoxModel(title: '3 Disjuntores'),
    CheckBoxModel(title: '4 Disjuntores'),
    CheckBoxModel(title: '4+ Disjuntores'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerSwitchBoard = TextEditingController();

  final type = [
    CheckBoxModel(title: 'Residencial'),
    CheckBoxModel(title: 'Comercial'),
    CheckBoxModel(title: 'Misto'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerType = TextEditingController();

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
  TextEditingController _controllerInfra = TextEditingController();

  final situation = [
    CheckBoxModel(title: 'Meio de Quadra'),
    CheckBoxModel(title: 'Esquina'),
    CheckBoxModel(title: 'Quadra Inteira'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerSituation = TextEditingController();
  final quota = [
    CheckBoxModel(title: 'Abaixo'),
    CheckBoxModel(title: 'Mesmo Nivel'),
    CheckBoxModel(title: 'Acima'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerQuota = TextEditingController();
  final position = [
    CheckBoxModel(title: 'Isolada'),
    CheckBoxModel(title: 'Junto a uma Lateral'),
    CheckBoxModel(title: 'Junto as Laterais'),
    CheckBoxModel(title: 'Geminada'),
    CheckBoxModel(title: 'Ocupa todo terreno'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerPosition = TextEditingController();
  final roof = [
    CheckBoxModel(title: 'Concreto'),
    CheckBoxModel(title: 'Plan'),
    CheckBoxModel(title: 'Americana'),
    CheckBoxModel(title: 'Fibrocimento'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerRoof = TextEditingController();
  final wall = [
    CheckBoxModel(title: 'Alvenaria'),
    CheckBoxModel(title: 'Placa'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerWall = TextEditingController();
  final paint = [
    CheckBoxModel(title: 'PVA'),
    CheckBoxModel(title: 'Acrílica'),
    CheckBoxModel(title: 'Latex'),
    CheckBoxModel(title: 'Textura'),
    CheckBoxModel(title: 'Nenhuma'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerPaint = TextEditingController();
  List<CheckBoxModel> pathology = [
    CheckBoxModel(title: 'Telhado selado'),
    CheckBoxModel(title: 'Solapamentos Visiveis'),
    CheckBoxModel(title: 'Umidade Paredes'),
    CheckBoxModel(title: 'Umidade Teto'),
    CheckBoxModel(title: 'Trincas/Fissuras/Rachaduras'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerPathology = TextEditingController();

  TextEditingController _controllerOpenArea = TextEditingController();
  TextEditingController _controllerClosedArea = TextEditingController();
  TextEditingController _controllerTerrainArea = TextEditingController();
  TextEditingController _controllerTotalArea = TextEditingController();

  List saveChecklist = [];
  int order = 0;

  @override
  void initState() {
    super.initState();
    _getData();
    getNSurvey();
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
          text: 'Vistoria Nº $title',
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
                onPressed: () => AlertModel().alert(
                    'Selecionar foto  da:','',
                    PaletteColors.primaryColor,
                    PaletteColors.primaryColor,
                    context,[
                  Row(
                    children: [
                      SizedBox(width: width * 0.03),
                      Container(
                        width: width * 0.65,
                        child: ButtonCustom(
                          widthCustom: 0.65,
                          heightCustom: 0.095,
                          onPressed: () => _savePhotoCamera(),
                          text: "Câmera",
                          size: 20.0,
                          colorButton: PaletteColors.primaryColor,
                          colorText: PaletteColors.white,
                          colorBorder: PaletteColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.055),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 75.0),
                    child: Row(
                      children: [
                        SizedBox(width: width * 0.03),
                        Container(
                          width: width * 0.65,
                          child: ButtonCustom(
                            widthCustom: 0.65,
                            heightCustom: 0.095,
                            onPressed: () => selectImages(),
                            text: "Galeria",
                            size: 20.0,
                            colorButton: PaletteColors.primaryColor,
                            colorText: PaletteColors.white,
                            colorBorder: PaletteColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                ]
                )
            ),
          ),
          SizedBox(width: width * 0.04),
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
                Row(
                  children: [
                    Container(
                      width: width * 0.28,
                      child: TextCustom(
                        text: "Idade",
                        size: 14.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                Row(children: [
                  Container(
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
                  Container(
                    child: InputRegister(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        RealInputFormatter(moeda: true)
                      ],
                      icons: Icons.height,
                      sizeIcon: 0.0,
                      width: width * 0.45,
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
                                  text: "Área Coberta",
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
                                  text: "Área Descoberta",
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
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width * 0.72,
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
                        SizedBox(height: height * 0.03),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: width * 0.72,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
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
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width * 0.72,
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
                        SizedBox(height: height * 0.03),
                        Row(
                          children: [
                            Container(
                              width: width * 0.72,
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
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
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Patologia",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: pathology.length * 50,
                  child: ListView.builder(
                      itemCount: pathology.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: pathology[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: pathology[index].value,
                                onChanged: (checked) => setState(() {
                                      pathology[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ),
                Container(
                  child: InputRegister(
                      controller: _controllerPathology,
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
                  text: "Tipo de Imóvel",
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
                              width: width * 0.45,
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
                                onChanged: (checked) => setState(() {
                                      type[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Tipo de imovel
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
                  text: "Infraestrutura",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: infra.length * 50,
                  child: ListView.builder(
                      itemCount: infra.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: infra[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: infra[index].value,
                                onChanged: (checked) => setState(() {
                                      infra[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Infraestrutura
                Container(
                  child: InputRegister(
                      controller: _controllerInfra,
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
                              width: width * 0.45,
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
                                onChanged: (checked) => setState(() {
                                      situation[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerSituation,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Cota/Greide",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: quota.length * 50,
                  child: ListView.builder(
                      itemCount: quota.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: quota[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: quota[index].value,
                                onChanged: (checked) => setState(() {
                                      quota[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerQuota,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Posição da Unidade",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: position.length * 50,
                  child: ListView.builder(
                      itemCount: position.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: position[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: position[index].value,
                                onChanged: (checked) => setState(() {
                                      position[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerPosition,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Telhado",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: roof.length * 50,
                  child: ListView.builder(
                      itemCount: roof.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: roof[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: roof[index].value,
                                onChanged: (checked) => setState(() {
                                      roof[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerRoof,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Muro",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: wall.length * 50,
                  child: ListView.builder(
                      itemCount: wall.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: wall[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: wall[index].value,
                                onChanged: (checked) => setState(() {
                                      wall[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerWall,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Pintura Externa",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: paint.length * 50,
                  child: ListView.builder(
                      itemCount: paint.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: paint[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: paint[index].value,
                                onChanged: (checked) => setState(() {
                                      paint[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerPaint,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Portas Externas",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: extern.length * 50,
                  child: ListView.builder(
                      itemCount: extern.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: extern[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: extern[index].value,
                                onChanged: (checked) => setState(() {
                                      extern[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerExtern,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Piso",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: floor.length * 50,
                  child: ListView.builder(
                      itemCount: floor.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: floor[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: floor[index].value,
                                onChanged: (checked) => setState(() {
                                      floor[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerFloor,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Portas Internas",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: Intern.length * 50,
                  child: ListView.builder(
                      itemCount: Intern.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: Intern[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: Intern[index].value,
                                onChanged: (checked) => setState(() {
                                      Intern[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerIntern,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Janelas",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: Windows.length * 50,
                  child: ListView.builder(
                      itemCount: Windows.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: Windows[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: Windows[index].value,
                                onChanged: (checked) => setState(() {
                                      Windows[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerWindows,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Pintura Interna",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: InternPaint.length * 50,
                  child: ListView.builder(
                      itemCount: InternPaint.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: InternPaint[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: InternPaint[index].value,
                                onChanged: (checked) => setState(() {
                                      InternPaint[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerInternPaint,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Bancada",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: balcony.length * 50,
                  child: ListView.builder(
                      itemCount: balcony.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: balcony[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: balcony[index].value,
                                onChanged: (checked) => setState(() {
                                      balcony[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerBalcony,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Quadro Elétrico",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: switchboard.length * 50,
                  child: ListView.builder(
                      itemCount: switchboard.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: switchboard[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: switchboard[index].value,
                                onChanged: (checked) => setState(() {
                                      switchboard[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerSwitchBoard,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Revestimento da Cozinha",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: kitchen.length * 50,
                  child: ListView.builder(
                      itemCount: kitchen.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: kitchen[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: kitchen[index].value,
                                onChanged: (checked) => setState(() {
                                      kitchen[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerKitchen,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Revestimento do Banheiro",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: bathroom.length * 50,
                  child: ListView.builder(
                      itemCount: bathroom.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: bathroom[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: bathroom[index].value,
                                onChanged: (checked) => setState(() {
                                      bathroom[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerBathroom,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Revestimento do Tanque",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: tank.length * 50,
                  child: ListView.builder(
                      itemCount: tank.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: tank[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: tank[index].value,
                                onChanged: (checked) => setState(() {
                                      tank[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerTank,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Padrão de Acabamento",
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
                              width: width * 0.45,
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
                                onChanged: (checked) => setState(() {
                                      pattern[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerPattern,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Estado de Conservação",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: state.length * 50,
                  child: ListView.builder(
                      itemCount: state.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: state[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: state[index].value,
                                onChanged: (checked) => setState(() {
                                      state[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerState,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
                ),
                SizedBox(height: height * 0.03),
                TextCustom(
                  text: "Teto da Unidade",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: unityroof.length * 50,
                  child: ListView.builder(
                      itemCount: unityroof.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: unityroof[index].title,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                            Spacer(),
                            Checkbox(
                                activeColor: PaletteColors.primaryColor,
                                checkColor: Colors.white,
                                value: unityroof[index].value,
                                onChanged: (checked) => setState(() {
                                      unityroof[index].value = checked!;
                                    })),
                          ],
                        );
                      }),
                ), //Situação
                InputRegister(
                    controller: _controllerUnityRoof,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(
                  thickness: 1,
                  color: PaletteColors.lightGrey,
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
                              // child: InputRegister(
                              //   icons: Icons.height,
                              //   sizeIcon: 0.0,
                              //   width: width * 0.12,
                              //   controller: _controllerNumber,
                              //   hint: "01",
                              //   fonts: 14.0,
                              //   keyboardType: TextInputType.number,
                              //   colorBorder: PaletteColors.greyInput,
                              //   background: PaletteColors.greyInput,
                              // ),
                            child: TextCustom(
                              text: SRoom,
                              color: PaletteColors.grey,
                              textAlign: TextAlign.center,
                            )

                        ),
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      height: height * 0.03,
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
                      color: PaletteColors.lightGrey,
                    ),
                    SizedBox(height: height * 0.03),
                    TextCustom(
                      text: "Condominio/Bloco",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: height * 0.03),
                    Container(
                      height: block.length * 50,
                      child: ListView.builder(
                          itemCount: block.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  width: width * 0.45,
                                  child: TextCustom(
                                      text: block[index].title,
                                      color: PaletteColors.grey,
                                      fontWeight: FontWeight.normal),
                                ),
                                Spacer(),
                                Checkbox(
                                    activeColor: PaletteColors.primaryColor,
                                    checkColor: Colors.white,
                                    value: block[index].value,
                                    onChanged: (checked) => setState(() {
                                          block[index].value = checked!;
                                        })),
                              ],
                            );
                          }),
                    ), //Situação
                    InputRegister(
                        controller: _controllerBlock,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.8,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                    Divider(
                      thickness: 1,
                      color: PaletteColors.lightGrey,
                    ),
                    TextCustom(
                      text: "Observações:",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      width: width * 0.9,
                      height: height * 0.2,
                      child: InputRegister(
                          controller: _controllerObs,
                          hint: ' ',
                          fonts: 14.0,
                          keyboardType: TextInputType.text,
                          width: width * 0.9,
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
