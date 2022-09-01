import 'dart:collection';

import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/snackBars.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class Surveyscreen extends StatefulWidget {
  const Surveyscreen({Key? key}) : super(key: key);

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
  List<String> states = ['SP', 'RJ', 'PR', 'MG'];
  String? selectedState = 'SP';
  List<String> type = ['Casa', 'Apartamento', 'Lote', 'Obra'];
  String? selectedType = 'Casa';
  FirebaseFirestore db = FirebaseFirestore.instance;
  final Map<String, dynamic> data = HashMap();
  SurveyModel _surveyModel = SurveyModel();
  String _error = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _saveData(SurveyModel surveyModel) async {
    db
        .collection('surveys')
        .doc(_surveyModel.idSurvey)
        .set(surveyModel.toMap())
        .then((_) => _surveyType(_surveyModel.idSurvey));
  }

  _createData() async {
    if (_controllerAdress.text.isNotEmpty) {
      if (_controllerNumber.text.isNotEmpty) {
        if (_controllerDistrict.text.isNotEmpty) {
          if (_controllerCity.text.isNotEmpty) {
            if (_controllerCEP.text.isNotEmpty) {
              if (_controllerLatG.text.isNotEmpty) {
                if (_controllerLatMin.text.isNotEmpty) {
                  if (_controllerLatSeg.text.isNotEmpty) {
                    if (_controllerLongG.text.isNotEmpty) {
                      if (_controllerLongMin.text.isNotEmpty) {
                        if (_controllerLongSeg.text.isNotEmpty) {
                          setState(() {
                            _error = '';
                          });
                          _createTable();
                        } else {
                          _error = 'Confira os dados de Longitude';
                          showSnackBar(context, _error, _scaffoldKey);
                        }
                      } else {
                        _error = 'Confira os dados de Longitude';
                        showSnackBar(context, _error, _scaffoldKey);
                      }
                    } else {
                      _error = 'Confira os dados de Longitude';
                      showSnackBar(context, _error, _scaffoldKey);
                    }
                  } else {
                    _error = 'Confira os dados de Latitude';
                    showSnackBar(context, _error, _scaffoldKey);
                  }
                } else {
                  _error = 'Confira os dados de Latitude';
                  showSnackBar(context, _error, _scaffoldKey);
                }
              } else {
                _error = 'Confira os dados de Latitude';
                showSnackBar(context, _error, _scaffoldKey);
              }
            } else {
              _error = 'CEP inválido!';
              showSnackBar(context, _error, _scaffoldKey);
            }
          } else {
            _error = 'Cidade inválida!';
            showSnackBar(context, _error, _scaffoldKey);
          }
        } else {
          _error = 'Bairro inválido!';
          showSnackBar(context, _error, _scaffoldKey);
        }
      } else {
        _error = 'Numero inválido!';
        showSnackBar(context, _error, _scaffoldKey);
      }
    } else {
      _error = 'Endereço inválido!';
      showSnackBar(context, _error, _scaffoldKey);
    }
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
    _surveyModel.latG = _controllerLatG.text;
    _surveyModel.latMin = _controllerLatMin.text;
    _surveyModel.latSeg = _controllerLatSeg.text;
    _surveyModel.longG = _controllerLongG.text;
    _surveyModel.longMin = _controllerLongMin.text;
    _surveyModel.longSeg = _controllerLongSeg.text;
    _surveyModel.hourRequest = DateTime.now().toString();
    _surveyModel.idUser = FirebaseAuth.instance.currentUser!.uid;
    _saveData(_surveyModel);
  }

  @override
  void initState() {
    super.initState();
    _surveyModel = SurveyModel.createId();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: PaletteColors.white,
      appBar: AppBar(
        backgroundColor: PaletteColors.bgColor,
        iconTheme: IconThemeData(
          color: PaletteColors.white,
        ),
        elevation: 0,
        title: TextCustom(
          text: 'NOVA VISTORIA',
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
              onPressed: () {},
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
                          keyboardType: TextInputType.number,
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
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.28,
                          controller: _controllerCEP,
                          hint: "15000-000",
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
                  onPressed: () => _createData(),
                  text: "Prosseguir",
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
      Navigator.pushNamed(context, '/checkapto1');
    }
    if (selectedType == type[2]) {
      Navigator.pushNamed(context, '/checklote1');
    }
    if (selectedType == type[3]) {
      Navigator.pushNamed(context, '/construction');
    }
  }
}
