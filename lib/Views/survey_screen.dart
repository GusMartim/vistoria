
import 'package:vistoria/Utils/exports.dart';


class Surveyscreen extends StatefulWidget {
  final text;
  final buttonText;
  final id;
   Surveyscreen({ required this.text,required this.buttonText,required this.id}) ;

  @override
  State<Surveyscreen> createState() => _SurveyscreenState();
}

class _SurveyscreenState extends State<Surveyscreen> {
  final TextEditingController _controllerAdress = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();
  final TextEditingController _controllerComplement = TextEditingController();
  final TextEditingController _controllerDistrict = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerCEP = TextEditingController();
  final TextEditingController _controllerLatG = TextEditingController();
  final TextEditingController _controllerLatMin = TextEditingController();
  final TextEditingController _controllerLatSeg = TextEditingController();
  final TextEditingController _controllerLongG = TextEditingController();
  final TextEditingController _controllerLongMin = TextEditingController();
  final TextEditingController _controllerLongSeg = TextEditingController();
  final TextEditingController _controllerUserCode = TextEditingController();
  var   controllerSurveyCode = TextEditingController();
  Map<String,dynamic>? data;
  int order = 0;
  List<String> states = ['SP', 'RJ', 'PR', 'MG'];
  String? selectedState = 'SP';
  List<String> type = [
    'Casa',
    'Apartamento',
    'Lote',
    'Obra',
    'Dados',
    'Infrutifera'
  ];
  String? selectedType = 'Casa';

  FirebaseFirestore db = FirebaseFirestore.instance;

  String _error = '';
  File? picture;
  bool _sending = false;
  String _urlPhoto = '';
  String selectedText = 'Imagens';
  FirebaseStorage storage = FirebaseStorage.instance;
  SurveyModel _surveyModel = SurveyModel();


  _saveData(SurveyModel surveyModel) async {
    db
        .collection('surveys')
        .doc(_surveyModel.idSurvey)
        .set(surveyModel.toMap(), SetOptions(merge: true))
        .then((_) => _surveyType(_surveyModel.idSurvey));
  }

  _createData() async {
    if (_controllerAdress.text.isNotEmpty) {
      if (_controllerNumber.text.isNotEmpty) {
        if (_controllerDistrict.text.isNotEmpty) {
          if (_controllerCity.text.isNotEmpty) {
            if (_controllerCEP.text.length==10) {
              setState(() {
                _error = '';
              });
              _createTable();
            }
           else {
            _error = 'CEP inválido!';
            showSnackBar(context, _error,);
          }
        } else {
          _error = 'Cidade inválida!';
          showSnackBar(context, _error, );
        }
      } else {
        _error = 'Bairro inválido!';
        showSnackBar(context, _error, );
      }
    } else {
      _error = 'Numero inválido!';
      showSnackBar(context, _error, );
    }
  }

  else {
  _error = 'Endereço inválido!';
  showSnackBar(context, _error, );
  }
}

  _getOrder()async{

    DocumentSnapshot snapshot = await db
        .collection('surveyNumber')
        .doc('surveyNumber')
        .get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      order = data?["surveyNumber"]??0;

    });

  }
  _createTable() async {
    _surveyModel.adress = _controllerAdress.text;
    _surveyModel.number = _controllerNumber.text;
    _surveyModel.complement = _controllerComplement.text;
    _surveyModel.district = _controllerDistrict.text;
    _surveyModel.city = _controllerDistrict.text;
    _surveyModel.state = selectedState.toString();
    _surveyModel.type = selectedType.toString();
    _surveyModel.cep = _controllerCEP.text;
    _surveyModel.hourRequest = DateTime.now().toString();
    _surveyModel.idUser = FirebaseAuth.instance.currentUser!.uid;
    _surveyModel.Nsurvey = order + 1;



    _saveData(_surveyModel);

  }


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
        'idSurvey': _surveyModel.idSurvey
      };
      db
          .collection("surveys")
          .doc(_surveyModel.idSurvey)
          .set(dateUpdate,SetOptions(merge: true))
          .then((value) {
            setState(() {
              _sending = false;
            });
      });

  }

  @override
  void initState() {
    super.initState();
    _getOrder();
    if(widget.id=='') {
      _surveyModel = SurveyModel.createId();
    }
    if(widget.text =='Alterar vistoria'){

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
              onPressed: () => _savePhoto(),
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
              onPressed: () {},
            ),
          ),
          SizedBox(width: width * 0.04),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 6.0, top: 6.0, bottom: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: height * 0.05),
              Container(
                width: width * 0.9,
                child: Row(
                  children: [
                    SizedBox(width: width * 0.04),
                    TextCustom(
                      text: "Codigo Empresa",
                      size: 14.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
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
              SizedBox(height: height * 0.02),
              Column(
                children: [
                  Container(

                    width: width * 0.9,

                    child: Row(
                      children: [
                        SizedBox(width: width * 0.04),
                        TextCustom(
                          text: "Numero do Sistema: ",
                          size: 14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: width * 0.9,
                    child: Row(
                      children: [
                        SizedBox(width: width * 0.04),
                        Container(
                          color:PaletteColors.greyInput,
                          child: TextCustom(
                            text: "${order+1}",
                            size: 14.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Container(
                width: width * 0.9,
                child: Row(
                  children: [
                    SizedBox(width: width * 0.04),
                    TextCustom(
                      text: "Endereço",
                      size: 14.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Container(
                width: width * 0.9,
                child: InputRegister(
                    controller: _controllerAdress,
                    hint: 'Rua Antonio Lopes',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.83,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
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
                          text: "Número",
                          size: 14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: width * 0.25,
                        child: InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.17,
                          controller: _controllerNumber,
                          hint: "325",
                          fonts: 14.0,
                          keyboardType: TextInputType.number,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),
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
                              size: 14.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: width * 0.65,
                        child: InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.61,
                          controller: _controllerComplement,
                          hint: "Ex. Casa",
                          fonts: 14.0,
                          keyboardType: TextInputType.text,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),
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
                          size: 14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width * 0.9,
                    child: InputRegister(
                        controller: _controllerDistrict,
                        hint: 'Vila Santa Isabel',
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
                      Row(
                        children: [
                          SizedBox(width: width * 0.04),
                          Container(
                            width: width * 0.56,
                            child: TextCustom(
                              text: "Cidade",
                              size: 14.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: width * 0.56,
                        child: InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.63,
                          controller: _controllerCity,
                          hint: "São Paulo",
                          fonts: 14.0,
                          keyboardType: TextInputType.text,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),
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
                          SizedBox(width: width * 0.01),
                          Container(
                            width: width * 0.26,
                            child: TextCustom(
                              text: "Estado",
                              size: 14.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: width * 0.26,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                  )
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
                            width: width * 0.35,
                            child: TextCustom(
                              text: "CEP",
                              size: 14.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: width * 0.35,
                        child: InputRegister(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CepInputFormatter()
                          ],
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.28,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: width * 0.01),
                          Container(
                            width: width * 0.48,
                            child: TextCustom(
                              text: "Tipo de imóvel",
                              size: 14.0,
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: width * 0.48,
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
                  )
                ],
              ),
              SizedBox(height: height * 0.1),
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
                          text: "Coordenadas",
                          size: 14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: width * 0.23,
                        child: TextCustom(
                          text: "Graus",
                          size: 14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: width * 0.23,
                        child: TextCustom(
                          text: "Min",
                          size: 14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: width * 0.23,
                        child: TextCustom(
                          text: "Seg",
                          size: 14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
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
                            size: 14.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: width * 0.25,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.2,
                            controller: _controllerLatG,
                            hint: "-15,00",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                        Container(
                          width: width * 0.25,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.2,
                            controller: _controllerLatMin,
                            hint: "46,00",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                        Container(
                          width: width * 0.25,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.2,
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
                            size: 14.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: width * 0.25,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.18,
                            controller: _controllerLongG,
                            hint: "-48,00",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                        Container(
                          width: width * 0.25,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.18,
                            controller: _controllerLongMin,
                            hint: "17,00",
                            fonts: 14.0,
                            keyboardType: TextInputType.number,
                            colorBorder: PaletteColors.greyInput,
                            background: PaletteColors.greyInput,
                          ),
                        ),
                        Container(
                          width: width * 0.25,
                          child: InputRegister(
                            icons: Icons.height,
                            sizeIcon: 0.0,
                            width: width * 0.18,
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
              SizedBox(
                height: 3.0,
                width: 0.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ButtonCustom(
                  widthCustom: 0.80,
                  heightCustom: 0.070,
                  onPressed: () =>  _createTable(),
                  text: widget.buttonText,
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

  void _surveyType(String id) {
    if (selectedType == type[0]) {
      Navigator.pushNamed(context, '/check1',arguments: id );
    }
    if (selectedType == type[1]) {
      Navigator.pushNamed(context, '/checkapto1',arguments: id);
    }
    if (selectedType == type[2]) {
      Navigator.pushNamed(context, '/checklote1',arguments: id);
    }
    if (selectedType == type[3]) {
      Navigator.pushNamed(context, '/construction', arguments: id);
    }
    if (selectedType == type[4]) {
      Navigator.restorablePushNamed(context, '/data', arguments: id);
    }
    if (selectedType == type[5]) {
      Navigator.pushNamed(context, '/inviability', arguments: id);
    }
  }
}
