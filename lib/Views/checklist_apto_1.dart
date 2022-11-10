import 'package:vistoria/Utils/exports.dart';

class CheckListApto1 extends StatefulWidget {
  final String idSurvey;
  CheckListApto1({required this.idSurvey});

  @override
  State<CheckListApto1> createState() => _CheckListApto1State();
}

class _CheckListApto1State extends State<CheckListApto1> {
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
  int nPavs = 0;
  String SPavs = '0';
  int nElevators = 0;
  String SElevators = '0';
  int nAge = 0;
  String SAge = '0';
  int nAptos = 0;
  String SAptos = '0';
  int nUnitys = 0;
  String SUnitys = '0';
  int order = 0;
  File? picture;
  bool _sending = false;
  String _urlPhoto = '';
  String selectedText = 'Imagens';
  FirebaseStorage storage = FirebaseStorage.instance;
  final Map<String, dynamic> data = HashMap();

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

  Future _savePhotoGallery() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.picture = imageTemporary;
        setState(() {
          _sending = true;
          Navigator.of(context).pop();
        });
        _uploadImage();
      });
    } on PlatformException catch (e) {
      print('Error : $e');
    }
  }
  Future _savePhotoCamera() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.picture = imageTemporary;
        setState(() {
          _sending = true;
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

    await arquivo.putFile(picture!).then((value) async{
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
        _sending = false;
      });
    });
  }

  AptoModel _aptoModel = AptoModel();
  FirebaseFirestore db = FirebaseFirestore.instance;

  _saveApto(AptoModel aptoModel) async {
    db
        .collection('surveys')
        .doc(widget.idSurvey)
        .update(aptoModel.toMap())
        .then((_) => Navigator.pushNamed(context, '/finished',
            arguments: widget.idSurvey));
  }
  _AptoTable() async {
    _aptoModel.Goal = selectedGoal.toString();
    _aptoModel.Origin = selectedInfo.toString();
    _aptoModel.PavType = selectedType.toString();
    _aptoModel.TerrainArea = _controllerTerrainArea.text;
    _aptoModel.pathology = _controllerPathology.text;
    _aptoModel.type = _controllerType.text;
    _aptoModel.infra = _controllerInfra.text;
    _aptoModel.situation = _controllerSituation.text;
    _aptoModel.quota = _controllerQuota.text;
    _aptoModel.unPosition = _controllerPosition.text;
    _aptoModel.wall = _controllerWall.text;
    _aptoModel.internPaint = _controllerInternPaint.text;
    _aptoModel.externPaint = _controllerPaint.text;
    _aptoModel.externDoors = _controllerExtern.text;
    _aptoModel.floor = _controllerFloor.text;
    _aptoModel.internDoors = _controllerIntern.text;
    _aptoModel.windowns = _controllerWindows.text;
    _aptoModel.balcony = _controllerBalcony.text;
    _aptoModel.switchboard = _controllerSwitchBoard.text;
    _aptoModel.kitchen = _controllerKitchen.text;
    _aptoModel.bathroom = _controllerBathroom.text;
    _aptoModel.tank = _controllerTank.text;
    _aptoModel.pattern = _controllerPattern.text;
    _aptoModel.state = _controllerState.text;
    _aptoModel.unRoof = _controllerUnityroof.text;
    _aptoModel.unity = _controllerUnity.text;
    _aptoModel.view = _controllerView.text;
    _aptoModel.block = _controllerBlock.text;
    _aptoModel.rooms = SRoom;
    _aptoModel.socialbathrooms = SSocialBathroom;
    _aptoModel.privatebathrooms = SPrivateBathroom;
    _aptoModel.lavs = SLav;
    _aptoModel.servicebathrooms = SServiceBathroom;
    _aptoModel.maidrooms = SMaidRoom;
    _aptoModel.balconys = SBalcony;
    _aptoModel.completecontainers = SCompleteCabinets;
    _aptoModel.kitchens = SKitchen;
    _aptoModel.restrooms = SRestRoom;
    _aptoModel.servicearearoofed = SServiceAreaRoofed;
    _aptoModel.serviceareaunroofed = SServiceAreaUnroofed;
    _aptoModel.garageroofed = SClosedGarage;
    _aptoModel.garageunroofed = SOpenGarage;
    _aptoModel.acs = SAc;
    _aptoModel.pools = SPool;
    _aptoModel.age = _controllerAge.text;
    _aptoModel.price = _controllerPrice.text;
    _aptoModel.obs = _controllerObs.text;
    _aptoModel.unitys = SUnitys;
    _aptoModel.aptos = SAptos;
    _aptoModel.elevators = SElevators;
    _aptoModel.estimatedAge = SAge;
    _aptoModel.pavs = SPavs;
    _aptoModel.condPrice = _controllerCondPrice.text;
    _aptoModel.admin = _controllerAdmin.text;
    _aptoModel.phone = _controllerPhone.text;
    _saveApto(_aptoModel);
  }
  _getData() async {
    DocumentSnapshot snapshot =
        await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    setState(() {
      saveChecklist = data?["checklist"];
      _controllerAge = TextEditingController(text: data?["age"]);
      _controllerTerrainArea =TextEditingController(text: data?["TerrainArea"]);
      _controllerPrice = TextEditingController(text: data?["price"]);
      _controllerPathology = TextEditingController(text: data?["Pathology"]);
      _controllerType = TextEditingController(text: data?["type"]);
      _controllerInfra = TextEditingController(text: data?["infra"]);
      _controllerSituation = TextEditingController(text: data?["situation"]);
      _controllerQuota = TextEditingController(text: data?["quota"]);
      _controllerWall = TextEditingController(text: data?["wall"]);
      _controllerInternPaint =TextEditingController(text: data?["internPaint"]);
      _controllerPaint = TextEditingController(text: data?["externPaint"]);
      _controllerExtern = TextEditingController(text: data?["externDoors"]);
      _controllerFloor = TextEditingController(text: data?["floor"]);
      _controllerIntern = TextEditingController(text: data?["internDoors"]);
      _controllerWindows = TextEditingController(text: data?["windowns"]);
      _controllerBalcony = TextEditingController(text: data?["balcony"]);
      _controllerSwitchBoard =TextEditingController(text: data?["switchboard"]);
      _controllerKitchen = TextEditingController(text: data?["kitchen"]);
      _controllerBathroom = TextEditingController(text: data?["bathroom"]);
      _controllerTank = TextEditingController(text: data?["tank"]);
      _controllerPattern = TextEditingController(text: data?["pattern"]);
      _controllerState = TextEditingController(text: data?["state"]);
      _controllerUnityroof = TextEditingController(text: data?["unRoof"]);
      _controllerUnity = TextEditingController(text: data?["unity"]);
      _controllerView = TextEditingController(text: data?["view"]);
      _controllerPosition = TextEditingController(text: data?["unPosition"]);
      _controllerBlock = TextEditingController(text: data?["block"]);
      _controllerObs = TextEditingController(text: data?["obs"]);
      _controllerCondPrice = TextEditingController(text: data?["condprice"]);
      _controllerAdmin = TextEditingController(text: data?["admin"]);
      _controllerPhone = TextEditingController(text: data?["phone"]);

      selectedGoal = data?["Goal"];
      selectedInfo = data?["Origin"];
      selectedType = data?["PavType"];
      SUnitys =data?["unitys"];
      SAptos =data?["aptos"];
      SAge =data?["estimatedAge"];
      SElevators =data?["elevators"];
      SPavs =data?["pavs"];
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
    wall.clear();
    for (int i = 27; i <= 30; i++) {
      var splitted = saveChecklist[i].replaceAll("6", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      wall.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    paint.clear();
    for (int i = 31; i <= 36; i++) {
      var splitted = saveChecklist[i].replaceAll("7", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      paint.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    extern.clear();
    for (int i = 37; i <= 40; i++) {
      var splitted = saveChecklist[i].replaceAll("8", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      extern.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    floor.clear();
    for (int i = 41; i <= 44; i++) {
      var splitted = saveChecklist[i].replaceAll("9", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      floor.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    Intern.clear();
    for (int i = 45; i <= 48; i++) {
      var splitted = saveChecklist[i].replaceAll("10", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      Intern.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    Windows.clear();
    for (int i = 49; i <= 52; i++) {
      var splitted = saveChecklist[i].replaceAll("11", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      Windows.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    InternPaint.clear();
    for (int i = 53; i <= 58; i++) {
      var splitted = saveChecklist[i].replaceAll("12", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      InternPaint.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    balcony.clear();
    for (int i = 59; i <= 63; i++) {
      var splitted = saveChecklist[i].replaceAll("13", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      balcony.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    switchboard.clear();
    for (int i = 64; i <= 69; i++) {
      var splitted = saveChecklist[i].replaceAll("14", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      switchboard.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    kitchen.clear();
    for (int i = 70; i <= 75; i++) {
      var splitted = saveChecklist[i].replaceAll("15", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      kitchen.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    bathroom.clear();
    for (int i = 76; i <= 81; i++) {
      var splitted = saveChecklist[i].replaceAll("16", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      bathroom.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    tank.clear();
    for (int i = 82; i <= 87; i++) {
      var splitted = saveChecklist[i].replaceAll("17", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      tank.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    pattern.clear();
    for (int i = 88; i <= 95; i++) {
      var splitted = saveChecklist[i].replaceAll("18", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      pattern.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    state.clear();
    for (int i = 96; i <= 102; i++) {
      var splitted = saveChecklist[i].replaceAll("19", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      state.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    Unityroof.clear();
    for (int i = 103; i <= 108; i++) {
      var splitted = saveChecklist[i].replaceAll("20", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      Unityroof.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    unity.clear();
    for (int i = 109; i <= 111; i++) {
      var splitted = saveChecklist[i].replaceAll("21", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      unity.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    view.clear();
    for (int i = 112; i <= 115; i++) {
      var splitted = saveChecklist[i].replaceAll("22", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      view.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    position.clear();
    for (int i = 116; i <= 121; i++) {
      var splitted = saveChecklist[i].replaceAll("23", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      position.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }
    block.clear();
    for (int i = 122; i <= 136; i++) {
      var splitted = saveChecklist[i].replaceAll("24", '').split('#');
      var title = splitted[0];
      var check = splitted[1];
      block.add(
          CheckBoxModel(title: title, value: check == 'true' ? true : false));
    }

    setState(() {

    });
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

    for (var i = 0; i < wall.length; i++) {
      saveChecklist.add(wall[i].title + '6' + '#' + wall[i].value.toString());
    }

    for (var i = 0; i < paint.length; i++) {
      saveChecklist.add(paint[i].title + '7' + '#' + paint[i].value.toString());
    }
    for (var i = 0; i < extern.length; i++) {
      saveChecklist
          .add(extern[i].title + '8' + '#' + extern[i].value.toString());
    }

    for (var i = 0; i < floor.length; i++) {
      saveChecklist
          .add(floor[i].title + '9' + '#' + floor[i].value.toString());
    }

    for (var i = 0; i < Intern.length; i++) {
      saveChecklist
          .add(Intern[i].title + '10' + '#' + Intern[i].value.toString());
    }

    for (var i = 0; i < Windows.length; i++) {
      saveChecklist
          .add(Windows[i].title + '11' + '#' + Windows[i].value.toString());
    }

    for (var i = 0; i < InternPaint.length; i++) {
      saveChecklist.add(
          InternPaint[i].title + '12' + '#' + InternPaint[i].value.toString());
    }

    for (var i = 0; i < balcony.length; i++) {
      saveChecklist
          .add(balcony[i].title + '13' + '#' + balcony[i].value.toString());
    }

    for (var i = 0; i < switchboard.length; i++) {
      saveChecklist.add(
          switchboard[i].title + '14' + '#' + switchboard[i].value.toString());
    }
    for (var i = 0; i < kitchen.length; i++) {
      saveChecklist
          .add(kitchen[i].title + '15' + '#' + kitchen[i].value.toString());
    }

    for (var i = 0; i < bathroom.length; i++) {
      saveChecklist
          .add(bathroom[i].title + '16' + '#' + bathroom[i].value.toString());
    }

    for (var i = 0; i < tank.length; i++) {
      saveChecklist.add(tank[i].title + '17' + '#' + tank[i].value.toString());
    }

    for (var i = 0; i < pattern.length; i++) {
      saveChecklist
          .add(pattern[i].title + '18' + '#' + pattern[i].value.toString());
    }

    for (var i = 0; i < state.length; i++) {
      saveChecklist
          .add(state[i].title + '19' + '#' + state[i].value.toString());
    }

    for (var i = 0; i < Unityroof.length; i++) {
      saveChecklist
          .add(Unityroof[i].title + '20' + '#' + Unityroof[i].value.toString());
    }
    for (var i = 0; i < unity.length; i++) {
      saveChecklist
          .add(unity[i].title + '21' + '#' + unity[i].value.toString());
    }
    for (var i = 0; i < view.length; i++) {
      saveChecklist
          .add(view[i].title + '22' + '#' + view[i].value.toString());
    }
    for (var i = 0; i < position.length; i++) {
      saveChecklist
          .add(position[i].title + '23' + '#' + position[i].value.toString());
    }
    for (var i = 0; i < block.length; i++) {
      saveChecklist
          .add(block[i].title + '24' + '#' + block[i].value.toString());
    }

    db.collection('surveys').doc(widget.idSurvey).update({
      "checklist": saveChecklist.toSet().toList(),
    });
    _AptoTable();
  }

  final type = [
    CheckBoxModel(title: 'Residencial'),
    CheckBoxModel(title: 'Comercial'),
    CheckBoxModel(title: 'Misto'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerType = TextEditingController();
  TextEditingController _controllerAdmin = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
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

  TextEditingController _controllerAge = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();
  TextEditingController _controllerCondPrice = TextEditingController();
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

  final Unityroof = [
    CheckBoxModel(title: 'Forro PVC'),
    CheckBoxModel(title: 'Forro Gesso'),
    CheckBoxModel(title: 'Forro Paulista'),
    CheckBoxModel(title: 'Laje'),
    CheckBoxModel(title: 'Telhado aparente'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerUnityroof = TextEditingController();
  final view = [
    CheckBoxModel(title: 'Favorável'),
    CheckBoxModel(title: 'Desfavorável'),
    CheckBoxModel(title: 'Sem influência'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerView = TextEditingController();
  final position = [
    CheckBoxModel(title: 'Frente/ Canto'),
    CheckBoxModel(title: 'Frente/ Meio'),
    CheckBoxModel(title: 'Fundo/ Canto'),
    CheckBoxModel(title: 'Fundo/ Meio'),
    CheckBoxModel(title: 'Lateral'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerPosition = TextEditingController();
  TextEditingController _controllerObs = TextEditingController();
  final pathology = [
    CheckBoxModel(title: 'Telhado selado'),
    CheckBoxModel(title: 'Solapamentos Visiveis'),
    CheckBoxModel(title: 'Umidade Paredes'),
    CheckBoxModel(title: 'Umidade Teto'),
    CheckBoxModel(title: 'Trincas/Fissuras/Rachaduras'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerPathology = TextEditingController();
  final unity =[
    CheckBoxModel(title: 'Andar'),
    CheckBoxModel(title: 'Apto de cobertura'),
    CheckBoxModel(title: 'Outro:'),
  ];
  TextEditingController _controllerUnity = TextEditingController();
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

  TextEditingController _controllerTerrainArea = TextEditingController();
  List<String> goal = ['Venda', 'Aluguel'];
  String? selectedGoal = 'Venda';
  List<String> infoOrigin = ['Oferta de Mercado', 'Transação Efetuada'];
  String? selectedInfo = 'Oferta de Mercado';
  List<String> pavType = ['SS+T+PAV', 'SS1+SS2+T+PAV', 'SS1+SS2+T+M+PAV'];
  String? selectedType = 'SS+T+PAV';
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
  List saveunity = [];
  List saveEdPosition = [];
  List saveView = [];
  List saveUnityPosition = [];
  List saveBlock = [];
  List savePathology = [];
  List saveChecklist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNSurvey();
    _getData();
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
                            onPressed: () => _savePhotoGallery(),
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
      body:_sending == true?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
                color: PaletteColors.primaryColor),
            TextCustom(
                text: 'Enviando foto...',
                color: PaletteColors.grey,
                fontWeight: FontWeight.normal,
                size: 16.0),

          ],
        ),
      ):Padding(
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
                                text: "Área do Terreno/Testada",
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
                              text: "Identificação dos Pavimentos da unidade",
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
                                items: pavType
                                    .map((pavType) => DropdownMenuItem<String>(
                                        value: pavType,
                                        child: TextCustom(
                                          text: pavType,
                                          color: PaletteColors.grey,
                                        )))
                                    .toList(),
                                value: selectedType,
                                onChanged: (pavType) =>
                                    setState(() => selectedType = pavType),
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
              SizedBox(height: height * 0.03),
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
                height: Unityroof.length * 50,
                child: ListView.builder(
                    itemCount: Unityroof.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: width * 0.45,
                            child: TextCustom(
                                text: Unityroof[index].title,
                                color: PaletteColors.grey,
                                fontWeight: FontWeight.normal),
                          ),
                          Spacer(),
                          Checkbox(
                              activeColor: PaletteColors.primaryColor,
                              checkColor: Colors.white,
                              value: Unityroof[index].value,
                              onChanged: (checked) => setState(() {
                                    Unityroof[index].value = checked!;
                                  })),
                        ],
                      );
                    }),
              ), //Situação
              InputRegister(
                  controller: _controllerUnityroof,
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
                text: "Unidade",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: height * 0.03),
              Container(
                height: unity.length * 50,
                child: ListView.builder(
                    itemCount: unity.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: width * 0.45,
                            child: TextCustom(
                                text: unity[index].title,
                                color: PaletteColors.grey,
                                fontWeight: FontWeight.normal),
                          ),
                          Spacer(),
                          Checkbox(
                              activeColor: PaletteColors.primaryColor,
                              checkColor: Colors.white,
                              value: unity[index].value,
                              onChanged: (checked) => setState(() {
                                unity[index].value = checked!;
                              })),
                        ],
                      );
                    }),
              ), //Situação
              InputRegister(
                  controller: _controllerUnity,
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
                text: "Bloco/ Prédio",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  TextCustom(
                    text: "Nº de pavimentos",
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
                          if (nPavs > 0) {
                            nPavs = nPavs - 1;
                            SPavs = "$nPavs";
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
                        text: SPavs,
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
                          if (nPavs >= 0) {
                            nPavs = nPavs + 1;

                            SPavs = "$nPavs";
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: width * 0.4,
                    child: TextCustom(
                      text: "Quantidade de elevadores",
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
                          if (nElevators > 0) {
                            nElevators = nElevators - 1;

                            SElevators = "$nElevators";
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
                        text: SElevators,
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
                          if (nElevators >= 0) {
                            nElevators = nElevators + 1;

                            SElevators = "$nElevators";
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextCustom(
                    text: "Idade estimada",
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
                          if (nAge > 0) {
                            nAge = nAge - 1;

                            SAge = "$nAge";
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
                        text: SAge,
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
                          if (nAge >= 0) {
                            nAge = nAge + 1;

                            SAge = "$nAge";
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextCustom(
                    text: "Nº de aptos/ pavtos",
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
                          if (nAptos > 0) {
                            nAptos = nAptos - 1;

                            SAptos = "$nAptos";
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
                        text: SAptos,
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
                          if (nAptos >= 0) {
                            nAptos = nAptos + 1;

                            SAptos = "$nAptos";
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: width * 0.4,
                    child: TextCustom(
                      text: "Nº de unidades no prédio",
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
                          if (nUnitys > 0) {
                            nUnitys = nUnitys - 1;

                            SUnitys = "$nUnitys";
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
                        text: SUnitys,
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
                          if (nUnitys >= 0) {
                            nUnitys = nUnitys + 1;

                            SUnitys = "$nUnitys";
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: PaletteColors.lightGrey,
              ),
              SizedBox(height: height * 0.03),
              TextCustom(
                text: "Vista Panorâmica",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: height * 0.03),
              Container(
                height: view.length * 50,
                child: ListView.builder(
                    itemCount: view.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: width * 0.45,
                            child: TextCustom(
                                text: view[index].title,
                                color: PaletteColors.grey,
                                fontWeight: FontWeight.normal),
                          ),
                          Spacer(),
                          Checkbox(
                              activeColor: PaletteColors.primaryColor,
                              checkColor: Colors.white,
                              value: view[index].value,
                              onChanged: (checked) => setState(() {
                                view[index].value = checked!;
                              })),
                        ],
                      );
                    }),
              ), //Situação
              InputRegister(
                  controller: _controllerView,
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
                text: "Posição da unidade no prédio",
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
              TextCustom(
                text: "Valor do Condomínio",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ), //Valor do Condomínio
              InputRegister(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(moeda: true)
                ],
                  controller: _controllerCondPrice,
                  hint: 'R\$ 000.00',
                  fonts: 14.0,
                  keyboardType: TextInputType.text,
                  width: width * 0.5,
                  sizeIcon: 0.0,
                  icons: Icons.height,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput),
              SizedBox(height: 5.0),
              TextCustom(
                text: "Administrador",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              InputRegister(
                  controller: _controllerAdmin,
                  hint: 'Nome do administrador',
                  fonts: 14.0,
                  keyboardType: TextInputType.text,
                  width: width * 0.9,
                  sizeIcon: 0.0,
                  icons: Icons.height,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput),
              SizedBox(height: 5.0),
              TextCustom(
                text: "Telefone",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              InputRegister(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ],
                  controller: _controllerPhone,
                  hint: '(00) 00000-0000',
                  fonts: 14.0,
                  keyboardType: TextInputType.text,
                  width: width * 0.5,
                  sizeIcon: 0.0,
                  icons: Icons.height,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput),
              SizedBox(height: 5.0),

              Divider(
                thickness: 1.0,
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
        )),
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
