
import 'package:intl/intl.dart';

import 'package:vistoria/Utils/exports.dart';

class Surveyscreen extends StatefulWidget {
  final text;
  final buttonText;
  final id;
  Surveyscreen(
      {required this.text, required this.buttonText, required this.id,});

  @override
  State<Surveyscreen> createState() => _SurveyscreenState();
}

class _SurveyscreenState extends State<Surveyscreen> {
  TextEditingController _controllerAdress = TextEditingController();
  TextEditingController _controllerNumber = TextEditingController();
  TextEditingController _controllerComplement = TextEditingController();
  TextEditingController _controllerDistrict = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController _controllerCEP = TextEditingController();
  TextEditingController _controllerLat = TextEditingController();
  TextEditingController _controllerLng = TextEditingController();
  TextEditingController _controllerUserCode = TextEditingController();
  String pdf = '';
  var controllerSurveyCode = TextEditingController();
  var offName;
  var offIdUser;
  final PrefService _prefService = PrefService();
  Map<String, dynamic>? data;
  String Status= '';
  int order = 0;
  int nsurvey= 0;
  List<String> states = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];
  String? selectedState = 'GO';
  List<String> type = [
    'Casa',
    'Apartamento',
    'Lote',
    'Obra',
    'Dados',
    'Infrutifera'
  ];
  String? selectedType = 'Casa';
  List<XFile>? imageFileList = [];
  Position? position;
  double? lat = 0;
  double? lon = 0;
  double? h= 0;
  FirebaseFirestore db = FirebaseFirestore.instance;
  String _urlPhoto = '';
  String name = '';
  String idUser = '';
  String selectedText = 'Imagens';
  FirebaseStorage storage = FirebaseStorage.instance;
  SurveyModel _surveyModel = SurveyModel();
  var format = DateFormat('dd/MM/yyyy  kk:mm');
  String _error = '';
  File? picture;
  String title = '';
  List <Uint8List> images = [];
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location services are disabled');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Permanently deniad');
    }
    return await Geolocator.getCurrentPosition();
  }
  _local() async {
    position = await _determinePosition();
    lat = position!.latitude;
    lon = position!.longitude;
    h = position!.altitude;
    print('lat :$lat');
    print('lon :$lon');

    setState(() {
      _controllerLat = TextEditingController(text:'$lat' );
      _controllerLng = TextEditingController(text:'$lon' );
    });
  }
  _getUser()async{
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      print("offline getUser entrou");
      DocumentSnapshot snapshot = await db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      setState(() {
        idUser = data?["idUser"];
        name = data?["name"];
      });
    }else{
      print("offline");
    }

  }
  _saveData(SurveyModel surveyModel) async {
    print("offline SaveData Entrou");
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      db
          .collection('surveys')
          .doc(widget.id != "" ? widget.id : _surveyModel.idSurvey)
          .set(surveyModel.toMap(), SetOptions(merge: true))
          .then((_) =>
          _surveyType(widget.id != "" ? widget.id : _surveyModel.idSurvey));
    } else {
      db
          .collection('surveys')
          .doc(widget.id != "" ? widget.id : _surveyModel.idSurvey)
          .set(surveyModel.toMap(), SetOptions(merge: true));

      _surveyType(widget.id != "" ? widget.id : _surveyModel.idSurvey);
    }


  }
  getNSurvey()async{
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      print("offline getNSurvey entrou");
      DocumentSnapshot snapshot = await db
          .collection('surveys')
          .doc(widget.id)
          .get();
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      setState(() {
        nsurvey = data?["Nsurvey"] ?? 0;
        title = '$nsurvey';
      });

    }else{
      setState(() {
        nsurvey = order;
        title = '$nsurvey';
      });
    }

  }
  getOrder()async{
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      print("offline getNSurvey entrou");
      DocumentSnapshot snapshot = await db
          .collection('surveyNumber')
          .doc('surveyNumber')
          .get();
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      setState(() {
        order = data?["surveyNumber"] ?? 0;
        title = '${order + 1}';
        if(widget.text =='Vistoriar Demanda'){
          nsurvey = order;
        }
      });
    }else{
      print("entrou no get order");
      setState(() {
        _prefService.readCacheOrder('Order').then((value) {
          order = int.parse(value);
          print(order);
          title = '${order + 1}';
        });

        if(widget.text =='Vistoriar Demanda'){
          nsurvey = order;
        }

      });
    }


  }
  _createTable() async {
    print("entrou createTable offline");
    _surveyModel.adress = _controllerAdress.text;
    _surveyModel.adress = _controllerAdress.text;
    _surveyModel.number = _controllerNumber.text;
    _surveyModel.complement = _controllerComplement.text;
    _surveyModel.district = _controllerDistrict.text;
    _surveyModel.city = _controllerCity.text;
    _surveyModel.estado = selectedState.toString();
    _surveyModel.typesurvey = selectedType.toString();
    _surveyModel.userCode =_controllerUserCode.text;
    _surveyModel.cep = _controllerCEP.text;
    bool result = await InternetConnectionChecker().hasConnection;
    if(result == true) {
      _surveyModel.idUser = idUser;
      _surveyModel.userName = name;
    }else{
      _surveyModel.idUser = offIdUser;
      _surveyModel.userName = offName;
    }

    _surveyModel.lng = _controllerLat.text;
    _surveyModel.lat = _controllerLng.text;
    _surveyModel.pdf = pdf;
    _surveyModel.nsurvey = nsurvey;
    _surveyModel.status = Status !=""?Status:'';

    if (widget.id != '') {
      _surveyModel.idSurvey = widget.id;
    }
    _saveData(_surveyModel);
  }

  Future _savePhotoGallery() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 30);
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
  Future _savePhotoCamera() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.camera, imageQuality: 30);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.picture = imageTemporary;
      });

      setState(() {
        Navigator.of(context).pop();
      });

      _uploadImage();
    } on PlatformException catch (e) {
      print('Error : $e');
    }
  }
  Future _uploadImage() async {
    Uint8List? archive = await picture?.readAsBytes();
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz
        .child("surveys")
        .child(selectedText + "_" + DateTime.now().toString() + ".jpg");
    await arquivo.putData(archive!,SettableMetadata(contentType:'application/octet-stream')).then((value) async{
      value.ref.getDownloadURL().then((value) {
        setState(() {
          _urlPhoto = value;
        });
        _urlImageFirestore(value);
      });
    });
  }
  Future selectImages() async{
    int i = 0;
    final List<XFile>? selectedImages = await ImagePicker().pickMultiImage(imageQuality: 30);
    if(selectedImages!.isNotEmpty){
      imageFileList!.addAll(selectedImages);
    }
    setState(() {

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
          .child(selectedText + "_" + DateTime.now().toString()+'.png');
      await arquivo.putData(archive,SettableMetadata(contentType:'application/octet-stream')).then((upload) async {
        upload.ref.getDownloadURL().then((value) {
          Map<String, dynamic> dateUpdate = {
            'photoUrl': FieldValue.arrayUnion([value.toString()]),
            'idSurvey': widget.id != '' ?widget.id :_surveyModel.idSurvey
          };
          db
              .collection("surveys")
              .doc(widget.id != '' ?widget.id :_surveyModel.idSurvey)
              .set(dateUpdate, SetOptions(merge: true));
        });
      });
    }
  }

  _urlImageFirestore(String url) {
    Map<String, dynamic> dateUpdate = {
      'photoUrl': FieldValue.arrayUnion([url]),
      'idSurvey': widget.id != '' ?widget.id :_surveyModel.idSurvey
    };
    db
        .collection("surveys")
        .doc(widget.id != '' ?widget.id :_surveyModel.idSurvey)
        .set(dateUpdate, SetOptions(merge: true))
        .then((value) {
      setState(() {
      });
      Future.delayed(const Duration(seconds: 5));
    });
  }
  _getData() async {
    DocumentSnapshot snapshot =
    await db.collection("surveys").doc(widget.id).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      _controllerAdress = TextEditingController(text: data?["adress"]??'');
      _controllerNumber = TextEditingController(text: data?["number"]??'');
      _controllerComplement = TextEditingController(text: data?["complement"]??'');
      _controllerDistrict = TextEditingController(text: data?["district"]??'');
      _controllerCity = TextEditingController(text: data?["city"]??'');
      selectedState = data?["estado"]?? selectedState;
      _controllerCEP = TextEditingController(text: data?["cep"]??'');
      selectedType = data?["typesurvey"]??selectedType;
      _controllerLat = TextEditingController(text:data?["lat"]??'' );
      _controllerLng = TextEditingController(text:data?["lng"]??'' );
      _controllerUserCode = TextEditingController(text:data?["userCode"]??'');

      Status = data?["status"]??'';
      pdf = data?["savedPdf"]??'';
    });

  }

  @override
  void initState(){
    super.initState();
    _prefService.readCacheContador('Order').then((value) => print(value));
    _prefService.readCacheNome('nome').then((value) => offName=value);
    _prefService.readCacheIdUser('idUser').then((value) => offIdUser =value);
      _getUser();
      if (widget.text == 'Editar Vistoria') {
        getNSurvey();
        _getData();
      }
      if(widget.text == 'Vistoriar Demanda'){
        getOrder();
        _getData();
      }

    if (widget.id == '') {
      _surveyModel = SurveyModel.createId();
      getOrder();
    }
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
          text: widget.text,
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
                padding: EdgeInsets.all(2.0),
                onPressed: () => AlertModel().alert(
                    'Selecionar foto  da:','',
                    PaletteColors.primaryColor,
                    PaletteColors.primaryColor,
                    context,[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: width * 0.03),
                      Container(
                        width: width * 0.5,
                        child: ButtonCustom(
                          widthCustom: 0.65,
                          heightCustom: 0.095,
                          onPressed: () => _savePhotoCamera(),
                          text: "C??mera",
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
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: width * 0.03),
                        Container(
                          width: width * 0.5,
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
          SizedBox(width: width * 0.02),
          Ink(
            decoration: ShapeDecoration(
              color: PaletteColors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.location_on,
                color: PaletteColors.primaryColor,
              ),
              constraints: BoxConstraints(
                  minHeight: 28, minWidth: 28, maxHeight: 28, maxWidth: 28),
              iconSize: 24.0,
              padding: EdgeInsets.all(2.0),
              onPressed: () {
                _local();
              },
            ),
          ),
          SizedBox(width: width * 0.04),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 6.0,bottom: 6.0,top: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: width * 0.9,
                child: Row(
                  children: [
                    SizedBox(width: width * 0.04),
                    Container(
                      width: width * 0.35,
                      child: TextCustom(
                        text: "Tipo de Vistoria:",
                        size: 12.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(width: width * 0.15),
                    TextCustom(
                      text: "N?? do Sistema:",
                      size: 12.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      child: TextCustom(
                        text: title,
                        size: 12.0,
                        color: PaletteColors.bgColor,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,

                      ),
                    ),

                  ],
                ),
              ),

              Row(
                children: [
                  SizedBox(width: width * 0.04),
                  widget.text == 'Editar Vistoria' || widget.text == 'Vistoriar Demanda'?Container(
                    child: TextCustom(
                      text: selectedType,
                      size: 12.0,
                      color: PaletteColors.bgColor,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ):Container(
                    width: width * 0.45,
                    height: 40,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: PaletteColors.greyInput),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: type
                            .map((type) => DropdownMenuItem<String>(
                            value: type,
                            child: TextCustom(
                              text: type,
                              color: PaletteColors.grey,
                            )))
                            .toList(),
                        value: selectedType,
                        onChanged: (type) =>
                            setState(() => selectedType = type),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.04),

                  Container(
                    child: TextCustom(
                      text: "N?? O.S",
                      size: 12.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.04),
                  Container(
                    width: width * 0.9,
                    child: InputRegister(
                        controller: _controllerUserCode,
                        hint: '',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.83,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                  ),
                ],
              ),
              Container(
                width: width * 0.9,
                child: Row(
                  children: [
                    SizedBox(width: width * 0.04),
                    TextCustom(
                      text: "Endere??o",
                      size: 12.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.04),
                  Container(
                    width: width * 0.9,
                    child: InputRegister(
                        controller: _controllerAdress,
                        hint: 'Rua x',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.83,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: width * 0.25,
                        child: TextCustom(
                          text: "N??mero",
                          size: 12.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: width * 0.04),
                          Container(
                            width: width * 0.25,
                            child: InputRegister(
                              icons: Icons.height,
                              sizeIcon: 0.0,
                              width: width * 0.17,
                              controller: _controllerNumber,
                              hint: "01",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: width * 0.04),
                          Container(
                            width: width * 0.65,
                            child: TextCustom(
                              text: "Complemento",
                              size: 12.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: width * 0.04),
                          Container(
                            width: width * 0.61,
                            child: InputRegister(
                              icons: Icons.height,
                              sizeIcon: 0.0,
                              width: width * 0.61,
                              controller: _controllerComplement,
                              hint: "Quadra,Lote,N?? AP",
                              fonts: 14.0,
                              keyboardType: TextInputType.text,
                              colorBorder: PaletteColors.greyInput,
                              background: PaletteColors.greyInput,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SizedBox(width: width * 0.04),
                      Container(
                        width: width * 0.86,
                        child: TextCustom(
                          text: "Bairro",
                          size: 12.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width * 0.04),
                      Container(
                        width: width * 0.9,
                        child: InputRegister(
                            controller: _controllerDistrict,
                            hint: 'x, y, z',
                            fonts: 14.0,
                            keyboardType: TextInputType.text,
                            width: width * 0.83,
                            sizeIcon: 0.0,
                            icons: Icons.height,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: width * 0.04),
                          Container(
                            width: width * 0.9,
                            child: TextCustom(
                              text: "Cidade",
                              size: 12.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: width * 0.04),
                          Container(
                            width: width * 0.9,
                            child: InputRegister(
                              icons: Icons.height,
                              sizeIcon: 0.0,
                              width: width * 0.9,
                              controller: _controllerCity,
                              hint: "S??o Paulo",
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

                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: width * 0.01),
                          Container(
                            width: width * 0.35,
                            child: TextCustom(
                              text: "Estado",
                              size: 12.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: width * 0.35,
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 14.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: PaletteColors.greyInput),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                items: states
                                    .map((states) => DropdownMenuItem<String>(
                                    value: states,
                                    child: TextCustom(
                                      text: states,
                                      color: PaletteColors.grey,
                                    )))
                                    .toList(),
                                value: selectedState,
                                onChanged: (states) =>
                                    setState(() => selectedState = states),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: width * 0.1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Row(
                        children: [
                          SizedBox(width: width * 0.04),
                          Container(
                            width: width * 0.4,
                            child: TextCustom(
                              text: "CEP",
                              size: 12.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: width * 0.04),
                          Container(
                            width: width * 0.4,
                            child: InputRegister(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CepInputFormatter()
                              ],
                              icons: Icons.height,
                              sizeIcon: 0.0,
                              width: width * 0.4,
                              controller: _controllerCEP,
                              hint: "15.000-000",
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
              Divider(
                color: PaletteColors.lightGrey,
                thickness: 0,
              ),
              Row(children: [
                SizedBox(width: width * 0.04),
                Container(
                  width: width * 0.3,
                  child: TextCustom(
                    text: "Latitude",
                    size: 12.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  width: width * 0.56,
                  child: InputRegister(
                    icons: Icons.height,
                    sizeIcon: 0.0,
                    width: width * 0.63,
                    controller: _controllerLat,
                    hint: "",
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput,
                  ),
                ),

              ],),
              Row(children: [
                SizedBox(width: width * 0.04),
                Container(
                  width: width * 0.3,
                  child: TextCustom(
                    text: "Longitude",
                    size: 12.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  width: width * 0.56,
                  child: InputRegister(
                    icons: Icons.height,
                    sizeIcon: 0.0,
                    width: width * 0.63,
                    controller: _controllerLng,
                    hint: "",
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput,
                  ),
                ),

              ],),
              /*
          Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: width * 0.27,
                        child: TextCustom(
                          text: "Coordenadas:",
                          size: 12.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: width * 0.26,
                        child: TextCustom(
                          text: "Graus",
                          size: 12.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: width * 0.25,
                        child: TextCustom(
                          text: "Min",
                          size: 12.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: width * 0.20,
                        child: TextCustom(
                          text: "Seg",
                          size: 12.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.24,
                          child: TextCustom(
                            text: " Latitude",
                            size: 12.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: width * 0.025),
                        Container(
                          width: width * 0.26,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.26,
                            controller: _controllerLatG,
                            hint: "-15,00",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                        Container(
                          width: width * 0.26,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.26,
                            controller: _controllerLatMin,
                            hint: "46,00",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                        Container(
                          width: width * 0.26,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.26,
                            controller: _controllerLatSeg,
                            hint: "28,37",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.24,
                          child: TextCustom(
                            text: " Longitude",
                            size: 12.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: width * 0.029),
                        Container(
                          width: width * 0.26,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.26,
                            controller: _controllerLongG,
                            hint: "-48,00",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                        Container(
                          width: width * 0.26,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.26,
                            controller: _controllerLongMin,
                            hint: "17,00",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                        Container(
                          width: width * 0.26,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.26,
                            controller: _controllerLongSeg,
                            hint: "36,88",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                        SizedBox(width: 4),
                      ],
                    ),
                  ),
                ],
              ),
              */

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ButtonCustom(
                  widthCustom: 0.80,
                  heightCustom: 0.070,
                  onPressed: () => _createTable(),
                  text: widget.buttonText,
                  size: 12.0,
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

  void _surveyType(String id) {
    if (selectedType == 'Casa') {
      Navigator.pushNamed(context, '/check1', arguments: id);
    }
    if (selectedType == 'Apartamento') {
      Navigator.pushNamed(context, '/checkapto1', arguments: id);
    }
    if (selectedType == 'Lote') {
      Navigator.pushNamed(context, '/checklote1', arguments: id);
    }
    if (selectedType == 'Obra') {
      Navigator.pushNamed(context, '/construction', arguments: id);
    }
    if (selectedType == 'Dados' || selectedType == 'Infrutifera') {
      Navigator.restorablePushNamed(context, '/extra', arguments: id);
    }

  }
}