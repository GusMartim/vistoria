import 'package:url_launcher/url_launcher.dart';
import 'package:vistoria/Utils/exports.dart';

import '../Models/Check List Models/check_list_data_model.dart';

class CheckListData extends StatefulWidget {
  final String idSurvey;
  CheckListData({required this.idSurvey});

  @override
  State<CheckListData> createState() => _CheckListDataState();
}

class _CheckListDataState extends State<CheckListData> {
  int nRoom = 0;
  String SRoom = '0';
  TextEditingController _controllerDivisaoInterna = TextEditingController();
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
  TextEditingController _controllerServiceAreaUnRoofed = TextEditingController();
  int nOpenGarage = 0;
  String SOpenGarage = '0';
  TextEditingController _controllerOpenGarage= TextEditingController();
  int nClosedGarage = 0;
  String SClosedGarage = '0';
  TextEditingController _controllerClosedGarage = TextEditingController();
  int nAc = 0;
  String SAc = '0';
  TextEditingController _controllerSac= TextEditingController();
  int nPool = 0;
  String SPool = '0';
  TextEditingController _controllerPool = TextEditingController();
  List<String> goal = ['Venda', 'Aluguel'];
  String? selectedGoal = 'Venda';
  List<String> infoOrigin = ['Oferta de Mercado', 'Transação Efetuada'];
  String? selectedInfo = 'Oferta de Mercado';
  DataModel _dataModel = DataModel();
  FirebaseStorage storage = FirebaseStorage.instance;
  final Map<String, dynamic> data = HashMap();
  int order = 0;
  String title = '';
  int nsurvey = 0;


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

  String selectedText = 'Imagens';
  FirebaseFirestore db = FirebaseFirestore.instance;
  File? picture;
  List<XFile>? imageFileList = [];

  String _urlPhoto = '';
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

  _saveData(DataModel dataModel) async {
    db
        .collection('surveys')
        .doc(widget.idSurvey)
        .update(dataModel.toMap())
        .then((_) => Navigator.pushNamed(context, '/finishedExtra',
            arguments: widget.idSurvey));
  }

  _UnitysTable() async {
    _dataModel.Goal = selectedGoal.toString();
    _dataModel.Origin = selectedInfo.toString();
    _dataModel.rooms = _controllerRoom.text;
    _dataModel.divisaointerna = _controllerDivisaoInterna.text;
    _dataModel.socialbathrooms = _controllerSocialBathroom.text;
    _dataModel.privatebathrooms = _controllerPrivateBathroom.text;
    _dataModel.lavs = _controllerLavabos.text;
    _dataModel.servicebathrooms = _controllerServiceBathroom.text;
    _dataModel.maidrooms = _controllerMaidRoom.text;
    _dataModel.balconys = _controllerBalconys.text;
    _dataModel.completecontainers = _controllerCompleteCabinets.text;
    _dataModel.kitchens = _controllerKitchens.text;
    _dataModel.restrooms = _controllerRestRoom.text;
    _dataModel.servicearearoofed = _controllerServiceAreaRoofed.text;
    _dataModel.serviceareaunroofed = _controllerServiceAreaUnRoofed.text;
    _dataModel.garageroofed = _controllerClosedGarage.text;
    _dataModel.garageunroofed = _controllerOpenGarage.text;
    _dataModel.acs = _controllerSac.text;
    _dataModel.pools = _controllerPool.text;
    _dataModel.age = _controllerAge.text;
    _dataModel.price = _controllerPrice.text;
    _dataModel.obs = _controllerObs.text;
    _dataModel.TotalArea = _controllerTotalArea.text;
    _dataModel.OpenArea = _controllerOpenArea.text;
    _dataModel.ClosedArea = _controllerClosedArea.text;
    _dataModel.TerrainArea = _controllerTerrainArea.text;
    _dataModel.infra = _controllerInfra.text;
    _dataModel.situation = _controllerSituation.text;
    _dataModel.quota = _controllerQuota.text;
    _dataModel.unPosition = _controllerPosition.text;
    _dataModel.roof = _controllerRoof.text;
    _dataModel.wall = _controllerWall.text;
    _dataModel.internPaint = _controllerInternPaint.text;
    _dataModel.externPaint = _controllerPaint.text;
    _dataModel.windowns = _controllerWindows.text;
    _dataModel.pattern = _controllerPattern.text;
    _dataModel.state = _controllerState.text;
    _dataModel.phone = _controllerPhone.text;
    _dataModel.completeAdress = _controllerAdress.text;
    _dataModel.contact = _controllerContact.text;

    _saveData(_dataModel);
  }
  List saveChecklist = [];
  _getData() async {
    DocumentSnapshot snapshot =
    await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    setState(() {
      saveChecklist = data?["checklist"]??[];
    });
    if(saveChecklist.length != 0){
      infra.clear();
      for (int i = 0; i <= 8; i++) {
        var splitted = saveChecklist[i].replaceAll("1", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        infra.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
      situation.clear();
      for (int i = 9; i <= 12; i++) {
        var splitted = saveChecklist[i].replaceAll("2", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        situation.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
      quota.clear();
      for (int i = 13; i <= 16; i++) {
        var splitted = saveChecklist[i].replaceAll("3", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        quota.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
      position.clear();
      for (int i = 17; i <= 22; i++) {
        var splitted = saveChecklist[i].replaceAll("4", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        position.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
      roof.clear();
      for (int i = 23; i <= 27; i++) {
        var splitted = saveChecklist[i].replaceAll("5", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        roof.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
      wall.clear();
      for (int i = 28; i <= 31; i++) {
        var splitted = saveChecklist[i].replaceAll("6", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        wall.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
      paint.clear();
      for (int i = 32; i <= 37; i++) {
        var splitted = saveChecklist[i].replaceAll("7", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        paint.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
      InternPaint.clear();
      for (int i = 38; i <= 43; i++) {
        var splitted = saveChecklist[i].replaceAll("8", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        InternPaint.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
      Windows.clear();
      for (int i = 44; i <= 47; i++) {
        var splitted = saveChecklist[i].replaceAll("9", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        Windows.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
      state.clear();
      for (int i = 48; i <= 54; i++) {
        var splitted = saveChecklist[i].replaceAll("10", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        state.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
      pattern.clear();
      for (int i = 55; i <= 62; i++) {
        var splitted = saveChecklist[i].replaceAll("11", '').split('#');
        var title = splitted[0];
        var check = splitted[1];
        pattern.add(
            CheckBoxModel(title: title, value: check == 'true' ? true : false));
      }
    }

    setState(() {
      _controllerAge = TextEditingController(text: data?["age"]??'');
      _controllerOpenArea = TextEditingController(text: data?["OpenArea"]??'');
      _controllerDivisaoInterna = TextEditingController(text:data?["divisaointerna"]??'');
      _controllerClosedArea = TextEditingController(text: data?["ClosedArea"]??'');
      _controllerTerrainArea =TextEditingController(text: data?["TerrainArea"]??'');
      _controllerTotalArea =TextEditingController(text: data?["TotalArea"]??'');
      _controllerPrice = TextEditingController(text: data?["price"]??'');
      _controllerInfra = TextEditingController(text: data?["infra"]??'');
      _controllerSituation = TextEditingController(text: data?["situation"]??'');
      _controllerQuota = TextEditingController(text: data?["quota"]??'');
      _controllerPosition = TextEditingController(text: data?["unPosition"]??'');
      _controllerRoof = TextEditingController(text: data?["roof"]??'');
      _controllerWall = TextEditingController(text: data?["wall"]??'');
      _controllerInternPaint = TextEditingController(text: data?["internPaint"]??'');
      _controllerPaint = TextEditingController(text: data?["externPaint"]??'');
      _controllerWindows = TextEditingController(text: data?["windowns"]??'');
      _controllerPattern = TextEditingController(text: data?["pattern"]??'');
      _controllerState = TextEditingController(text: data?["state"]??'');
      _controllerObs = TextEditingController(text: data?["obs"]??'');
      selectedGoal = data?["Goal"]??selectedGoal;
      selectedInfo = data?["Origin"]??selectedInfo;
      _controllerRoom = TextEditingController(text: data?["rooms"]??'');
      _controllerSocialBathroom = TextEditingController(text: data?["socialbathrooms"]??'');
      _controllerPrivateBathroom = TextEditingController(text: data?["privatebathrooms"]??'');
      _controllerServiceBathroom = TextEditingController(text: data?["servicebathrooms"]??'');
      _controllerLavabos = TextEditingController(text: data?["lavs"]??'');
      _controllerMaidRoom = TextEditingController(text: data?["maidrooms"]??'');
      _controllerBalconys = TextEditingController(text: data?["balconys"]??'');
      _controllerCompleteCabinets = TextEditingController(text: data?["completecontainers"]??'');
      _controllerKitchens = TextEditingController(text: data?["kitchens"]??'');
      _controllerRestRoom = TextEditingController(text: data?["restrooms"]??'');
      _controllerServiceAreaRoofed = TextEditingController(text: data?["servicearearoofed"]??'');
      _controllerServiceAreaUnRoofed = TextEditingController(text: data?["serviceareaunroofed"]??'');
      _controllerClosedGarage = TextEditingController(text: data?["garageroofed"]??'');
      _controllerOpenGarage = TextEditingController(text: data?["garageunroofed"]??'');
      _controllerSac = TextEditingController(text: data?["acs"]??'');
      _controllerPool = TextEditingController(text: data?["pools"]??'');
      nRoom = int.parse(_controllerRoom.text.isNotEmpty?_controllerRoom.text: '0');
      nSocialBathroom = int.parse(_controllerSocialBathroom.text.isNotEmpty?_controllerSocialBathroom.text: '0');
      nPrivateBathroom = int.parse(_controllerPrivateBathroom.text.isNotEmpty?_controllerPrivateBathroom.text: '0');
      nLav = int.parse(_controllerLavabos.text.isNotEmpty?_controllerLavabos.text:'0');
      nServiceBathroom = int.parse(_controllerServiceBathroom.text.isNotEmpty?_controllerServiceBathroom.text:'0');
      nMaidRoom = int.parse(_controllerMaidRoom.text.isNotEmpty?_controllerMaidRoom.text:'0');
      nBalcony = int.parse(_controllerBalconys.text.isNotEmpty?_controllerBalconys.text:'0');
      nCompleteCabinets = int.parse(_controllerCompleteCabinets.text.isNotEmpty?_controllerCompleteCabinets.text:'0');
      nKitchen = int.parse(_controllerKitchens.text.isNotEmpty?_controllerKitchens.text:'0');
      nRestRoom = int.parse(_controllerRestRoom.text.isNotEmpty?_controllerRestRoom.text:'0');
      nServiceAreaRoofed = int.parse(_controllerServiceAreaRoofed.text.isNotEmpty?_controllerServiceAreaRoofed.text:'0');
      nServiceAreaUnroofed = int.parse(_controllerServiceAreaUnRoofed.text.isNotEmpty?_controllerServiceAreaUnRoofed.text:'0');
      nClosedGarage = int.parse(_controllerClosedGarage.text.isNotEmpty?_controllerClosedGarage.text:'0');
      nOpenGarage = int.parse(_controllerOpenGarage.text.isNotEmpty?_controllerOpenGarage.text:'0');
      nAc = int.parse(_controllerSac.text.isNotEmpty?_controllerSac.text:'0');
      nPool = int.parse(_controllerPool.text.isNotEmpty?_controllerPool.text:'0');
      _controllerAdress = TextEditingController(text: data?["completeAdress"]??'');
      _controllerContact = TextEditingController(text: data?["contato"]??'');
      _controllerPhone = TextEditingController(text: data?["telefone"]??'');
    });
  }
  _saveCheckList() async {
    saveChecklist.clear();
    for (var i = 0; i < infra.length; i++) {
      saveChecklist.add(infra[i].title + '1' + '#' + infra[i].value.toString());
    }
    for (var i = 0; i < situation.length; i++) {
      saveChecklist
          .add(situation[i].title + '2' + '#' + situation[i].value.toString());
    }

    for (var i = 0; i < quota.length; i++) {
      saveChecklist.add(quota[i].title + '3' + '#' + quota[i].value.toString());
    }
    for (var i = 0; i < position.length; i++) {
      saveChecklist
          .add(position[i].title + '4' + '#' + position[i].value.toString());
    }

    for (var i = 0; i < roof.length; i++) {
      saveChecklist.add(roof[i].title + '5' + '#' + roof[i].value.toString());
    }

    for (var i = 0; i < wall.length; i++) {
      saveChecklist.add(wall[i].title + '6' + '#' + wall[i].value.toString());
    }

    for (var i = 0; i < paint.length; i++) {
      saveChecklist.add(paint[i].title + '7' + '#' + paint[i].value.toString());
    }
    for (var i = 0; i < InternPaint.length; i++) {
      saveChecklist.add(
          InternPaint[i].title + '8' + '#' + InternPaint[i].value.toString());
    }

    for (var i = 0; i < Windows.length; i++) {
      saveChecklist
          .add(Windows[i].title + '9' + '#' + Windows[i].value.toString());
    }
    for (var i = 0; i < state.length; i++) {
      saveChecklist
          .add(state[i].title + '10' + '#' + state[i].value.toString());
    }
    for (var i = 0; i < pattern.length; i++) {
      saveChecklist
          .add(pattern[i].title + '11' + '#' + pattern[i].value.toString());
    }


    db.collection('surveys').doc(widget.idSurvey).update({
      "checklist": saveChecklist.toSet().toList(),
    });
    _UnitysTable();
  }

  TextEditingController _controllerObs = TextEditingController();
  TextEditingController _controllerAdress = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerContact = TextEditingController();

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
  TextEditingController _controllerAge = TextEditingController();
  TextEditingController _controllerPrice = TextEditingController();

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

  final infra = [
    CheckBoxModel(title: 'Rede de Água'),
    CheckBoxModel(title: 'Iluminação Pública'),
    CheckBoxModel(title: 'Pavimentação'),
    CheckBoxModel(title: 'Rede de Água Pluvial'),
    CheckBoxModel(title: 'Rede de Esgoto'),
    CheckBoxModel(title: 'Fossa Séptica'),
    CheckBoxModel(title: 'Sumidouro'),
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

  TextEditingController _controllerOpenArea = TextEditingController();
  TextEditingController _controllerClosedArea = TextEditingController();
  TextEditingController _controllerTerrainArea = TextEditingController();
  TextEditingController _controllerTotalArea = TextEditingController();

  List savePattern = [];
  List saveState = [];
  List saveWindowns = [];
  List saveInternPaint = [];
  List saveInfra = [];
  List saveSituation = [];
  List saveQuota = [];
  List savePosition = [];
  List saveRoof = [];
  List saveWall = [];
  List savePaint = [];
  List saveCheckList = [];
  @override
  void initState() {
    // TODO: implement initState
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
                alignment: Alignment.center,
                padding: EdgeInsets.all(0.0),
                onPressed: () => AlertModel().alert(
                    'Selecionar foto  da:',
                    '',
                    PaletteColors.primaryColor,
                    PaletteColors.primaryColor,
                    context, [
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
                ])),
          ),
          SizedBox(width: width * 0.01),
          Ink(
            decoration: ShapeDecoration(
              color: PaletteColors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
                icon: Icon(
                  Icons.phone,
                  color: PaletteColors.primaryColor,
                ),
                constraints: BoxConstraints(
                    minHeight: 28, minWidth: 28, maxHeight: 28, maxWidth: 28),
                iconSize: 24.0,
                alignment: Alignment.center,
                padding: EdgeInsets.all(0.0),
                onPressed: ()async{
                  if(_controllerPhone.text.isNotEmpty){
                    var splitted = _controllerPhone.text.replaceAll('-','').replaceAll('(','').replaceAll(')','').trim();
                    var url ="tel:+55$splitted";
                    await launchUrl(Uri.parse(url));
                  }else{
                    showSnackBar(context, 'Preencha o campo Telefone',Colors.red);
                  }
                }

            ),
          ),
          SizedBox(width: width * 0.03),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Center(
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
                            hint: "  00  ",
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
                            
                            Container(
                              width: width * 0.45,
                              child: TextCustom(
                                  text: "Valor Proposto",
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
                                  text: "Área Coberta/Fechada",
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
                            onchanged: (String value){
                              setState(() {
                                if(_controllerOpenArea.text.isNotEmpty && _controllerClosedArea.text.isNotEmpty){
                                  int area = int.parse(_controllerOpenArea.text)+int.parse(value);
                                  _controllerTotalArea.text = '$area';
                                }
                              });
                            },
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
                                  text: "Área Coberta/Aberta",
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
                            onchanged: (String value){
                              setState(() {
                                if(_controllerOpenArea.text.isNotEmpty && _controllerClosedArea.text.isNotEmpty){
                                  int area = int.parse(value)+int.parse(_controllerClosedArea.text);
                                  _controllerTotalArea.text = '$area';
                                }

                              });
                            },
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width * 0.8,
                              child: TextCustom(
                                  text: "Área Total",
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
                            controller: _controllerTotalArea,
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
                Divider(),
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
                              width: width * 0.85,
                              child: TextCustom(
                                  text: "Endereço Completo",
                                  size: 14.0,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          width: width * 0.85,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.2,
                            controller: _controllerAdress,
                            hint: " Rua Fulano, Bairro Teste, Nª404  ",
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
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
                            
                            Container(
                              width: width * 0.85,
                              child: TextCustom(
                                  text: "Contato",
                                  size: 14.0,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          width: width * 0.85,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.2,
                            controller: _controllerContact,
                            hint: " Fulano de Tal ",
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
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
                            
                            Container(
                              width: width * 0.85,
                              child: TextCustom(
                                  text: "Telefone",
                                  size: 14.0,
                                  color: PaletteColors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          width: width * 0.85,
                          child: InputRegister(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter()
                            ],
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.2,
                            controller: _controllerPhone,
                            hint: "(11) 11111-1111 ",
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
                Divider(),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            
                            Container(
                              width: width * 0.78,
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
                            
                            Container(
                              height: 50,
                              width: width * 0.78,
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
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            
                            Container(
                              width: width * 0.78,
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
                            
                            Container(
                              width: width * 0.78,
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
                SizedBox(height: height * 0.01),
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextCustom(
                      text: "Divisão Interna",
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerRoom.text = SRoom;
                                }
                              });
                            },
                          ),
                        ),
                        Container(

                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SRoom = value;
                                SRoom != ''?nRoom = int.parse(SRoom):nRoom = 0;
                                _controllerRoom.text = '$nRoom';
                              });
                            },

                            controller: _controllerRoom,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nRoom >= 0 && nRoom < 999 ) {
                                  nRoom = nRoom + 1;
                                  SRoom = "$nRoom";
                                  _controllerRoom.text = SRoom;
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
                          text: "Banheiros Sociais",
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerSocialBathroom.text = SSocialBathroom;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SSocialBathroom = value;
                                SSocialBathroom != ''?nSocialBathroom = int.parse(SSocialBathroom):nSocialBathroom = 0;
                                _controllerSocialBathroom.text = '$nSocialBathroom';
                              });
                            },
                            controller: _controllerSocialBathroom,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nSocialBathroom >= 0 && nSocialBathroom < 999) {
                                  nSocialBathroom = nSocialBathroom + 1;
                                  SSocialBathroom = "$nSocialBathroom";
                                  _controllerSocialBathroom.text = SSocialBathroom;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Banheiros Privativos",
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerPrivateBathroom.text = SPrivateBathroom;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SPrivateBathroom = value;
                                SPrivateBathroom != ''?nPrivateBathroom = int.parse(SPrivateBathroom):nPrivateBathroom = 0;
                                _controllerPrivateBathroom.text = '$nPrivateBathroom';
                              });
                            },
                            controller: _controllerPrivateBathroom,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nPrivateBathroom >= 0 && nPrivateBathroom < 999) {
                                  nPrivateBathroom = nPrivateBathroom + 1;
                                  SPrivateBathroom = "$nPrivateBathroom";
                                  _controllerPrivateBathroom.text = SPrivateBathroom;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Banheiro de Serviço",
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  SServiceBathroom = "$nServiceBathroom";
                                  _controllerServiceBathroom.text = SServiceBathroom;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SServiceBathroom = value;
                                SServiceBathroom != ''?nServiceBathroom = int.parse(SServiceBathroom):nServiceBathroom = 0;
                                _controllerServiceBathroom.text = '$nServiceBathroom';
                              });
                            },
                            controller: _controllerServiceBathroom,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nServiceBathroom >= 0 && nServiceBathroom < 999) {
                                  nServiceBathroom = nServiceBathroom + 1;
                                  SServiceBathroom = "$nServiceBathroom";
                                  _controllerServiceBathroom.text = SServiceBathroom;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerLavabos.text = SLav;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SLav = value;
                                SLav != ''?nLav = int.parse(SLav):nLav = 0;
                                _controllerLavabos.text = '$nLav';
                              });
                            },
                            controller: _controllerLavabos,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nLav >= 0 && nLav < 999) {
                                  nLav = nLav + 1;
                                  SLav = "$nLav";
                                  _controllerLavabos.text = SLav;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Quarto de Empregada",
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerMaidRoom.text = SMaidRoom;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SMaidRoom = value;
                                SMaidRoom != ''?nMaidRoom = int.parse(SMaidRoom):nMaidRoom = 0;
                                _controllerMaidRoom.text = '$nMaidRoom';
                              });
                            },
                            controller: _controllerMaidRoom,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nMaidRoom >= 0 && nMaidRoom < 999) {
                                  nMaidRoom = nMaidRoom + 1;
                                  SMaidRoom = "$nMaidRoom";
                                  _controllerMaidRoom.text = SMaidRoom;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Varanda / Sacada",
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerBalconys.text = SBalcony;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SBalcony = value;
                                SBalcony != ''?nBalcony = int.parse(SBalcony):nBalcony = 0;
                                _controllerBalconys.text = '$nBalcony';
                              });
                            },
                            controller: _controllerBalconys,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nBalcony >= 0 && nBalcony < 999) {
                                  nBalcony = nBalcony + 1;
                                  SBalcony = "$nBalcony";
                                  _controllerBalconys.text = SBalcony;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Nº Armários Completos",
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerCompleteCabinets.text = SCompleteCabinets;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SCompleteCabinets = value;
                                SCompleteCabinets != ''?nCompleteCabinets = int.parse(SCompleteCabinets):nCompleteCabinets = 0;
                                _controllerCompleteCabinets.text = '$nCompleteCabinets';
                              });
                            },
                            controller: _controllerCompleteCabinets,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nCompleteCabinets >= 0 && nCompleteCabinets < 999) {
                                  nCompleteCabinets = nCompleteCabinets + 1;
                                  SCompleteCabinets = "$nCompleteCabinets";
                                  _controllerCompleteCabinets.text = SCompleteCabinets;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerKitchens.text = SKitchen;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SKitchen = value;
                                SKitchen != ''?nKitchen = int.parse(SKitchen):nKitchen = 0;
                                _controllerKitchens.text = '$nKitchen';
                              });
                            },
                            controller: _controllerKitchens,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nKitchen >= 0 && nKitchen < 999) {
                                  nKitchen = nKitchen + 1;
                                  SKitchen = "$nKitchen";
                                  _controllerKitchens.text = SKitchen;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerRestRoom.text = SRestRoom;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SRestRoom = value;
                                SRestRoom != ''?nRestRoom = int.parse(SRestRoom):nRestRoom = 0;
                                _controllerRestRoom.text = '$nRestRoom';
                              });
                            },
                            controller: _controllerRestRoom,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nKitchen >= 0 && nKitchen < 999) {
                                  nRestRoom = nRestRoom + 1;
                                  SRestRoom = "$nRestRoom";
                                  _controllerRestRoom.text = SRestRoom;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Área de Serviço\nCoberta",
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
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerServiceAreaRoofed.text = SServiceAreaRoofed;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SServiceAreaRoofed = value;
                                SServiceAreaRoofed != ''?nServiceAreaRoofed = int.parse(SServiceAreaRoofed):nServiceAreaRoofed = 0;
                                _controllerRestRoom.text = '$nServiceAreaRoofed';
                              });
                            },
                            controller: _controllerServiceAreaRoofed,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nServiceAreaRoofed >= 0 && nServiceAreaRoofed < 999) {
                                  nServiceAreaRoofed = nServiceAreaRoofed + 1;
                                  SServiceAreaRoofed = "$nServiceAreaRoofed";
                                  _controllerServiceAreaRoofed.text = SServiceAreaRoofed;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Área de Serviço\nDescoberta",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  nServiceAreaUnroofed = nServiceAreaUnroofed - 1;
                                  SServiceAreaUnroofed = "$nServiceAreaUnroofed";
                                  _controllerServiceAreaUnRoofed.text = SServiceAreaUnroofed;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SServiceAreaUnroofed = value;
                                SServiceAreaUnroofed != ''?nServiceAreaUnroofed = int.parse(SServiceAreaUnroofed):nServiceAreaUnroofed = 0;
                                _controllerServiceAreaUnRoofed.text = '$nServiceAreaUnroofed';
                              });
                            },
                            controller: _controllerServiceAreaUnRoofed,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nServiceAreaUnroofed >= 0 && nServiceAreaUnroofed < 999) {
                                  nServiceAreaUnroofed = nServiceAreaUnroofed + 1;
                                  SServiceAreaUnroofed = "$nServiceAreaUnroofed";
                                  _controllerServiceAreaUnRoofed.text = SServiceAreaUnroofed;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Garagem Coberta",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerOpenGarage.text = SOpenGarage;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SOpenGarage = value;
                                SOpenGarage != ''?nOpenGarage = int.parse(SOpenGarage):nOpenGarage = 0;
                                _controllerOpenGarage.text = '$nOpenGarage';
                              });
                            },
                            controller: _controllerOpenGarage,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nOpenGarage >= 0 && nOpenGarage < 999) {
                                  nOpenGarage = nOpenGarage + 1;
                                  SOpenGarage = "$nOpenGarage";
                                  _controllerOpenGarage.text = SOpenGarage;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Garagem Descoberta",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerClosedGarage.text = SClosedGarage;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SClosedGarage = value;
                                SClosedGarage != ''?nClosedGarage = int.parse(SClosedGarage):nClosedGarage = 0;
                                _controllerClosedGarage.text = '$nClosedGarage';
                              });
                            },
                            controller: _controllerClosedGarage,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nClosedGarage >= 0 && nClosedGarage < 999) {
                                  nClosedGarage = nClosedGarage + 1;
                                  SClosedGarage = "$nClosedGarage";
                                  _controllerClosedGarage.text = SClosedGarage;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Ar condicionado",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerSac.text = SAc;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SAc = value;
                                SAc != ''?nAc = int.parse(SAc):nAc = 0;
                                _controllerSac.text = '$nAc';
                              });
                            },
                            controller: _controllerSac,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nAc >= 0 && nAc < 999) {
                                  nAc = nAc + 1;
                                  SAc = "$nAc";
                                  _controllerSac.text = SAc;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      children: [
                        TextCustom(
                          text: "Piscina",
                          size: 16.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                        Spacer(),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
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
                                  _controllerPool.text = SPool;
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          color: PaletteColors.greyInput,
                          height: 28,
                          width: width * 0.1,
                          child: TextFormField(
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            onFieldSubmitted: (String value) {
                              setState(() {
                                SPool = value;
                                SPool != ''?nPool = int.parse(SPool):nPool = 0;
                                _controllerPool.text = '$nPool';
                              });
                            },
                            controller: _controllerPool,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,

                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: PaletteColors.midGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
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
                                if (nPool >= 0 && nPool < 999) {
                                  nPool = nPool + 1;
                                  SPool = "$nPool";
                                  _controllerPool.text = SPool;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.4,
                          child: TextCustom(
                              text: "Outro:",
                              size: 14.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),

                      ],
                    ),
                    Row(children: [
                      Container(
                        width: width * 0.7,
                        child: InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 2.0,
                          controller: _controllerDivisaoInterna,
                          hint: '',
                          fonts: 14.0,
                          keyboardType: TextInputType.text,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: height * 0.03,
                    ),
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
                      width: width * 0.78,
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
                            onPressed: () =>

                                Navigator.pop(context),
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
