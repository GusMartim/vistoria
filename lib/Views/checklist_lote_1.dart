import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class CheckListLote1 extends StatefulWidget {
  const CheckListLote1({Key? key}) : super(key: key);

  @override
  State<CheckListLote1> createState() => _CheckListLote1State();
}

class _CheckListLote1State extends State<CheckListLote1> {
  bool checkBoxvalue = false;
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
  final natural = [
    CheckBoxModel(title: 'Risco de deslizamento'),
    CheckBoxModel(title: 'Risco de alagamento'),
    CheckBoxModel(title: 'Risco de Erosão'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerNatural = TextEditingController();
  final social = [
    CheckBoxModel(title: 'Favela'),
    CheckBoxModel(title: 'Penitenciária'),
    CheckBoxModel(title: 'Indústria poluente'),
    CheckBoxModel(title: 'Usina de lixo'),
    CheckBoxModel(title: 'Matadouro'),
    CheckBoxModel(title: 'Via expressa'),
    CheckBoxModel(title: 'Viaduto'),
    CheckBoxModel(title: 'Cemitério'),
    CheckBoxModel(title: 'Hospital'),
    CheckBoxModel(title: 'Clube noturno'),
    CheckBoxModel(title: 'Feira livre'),
    CheckBoxModel(title: 'Oficinas'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerSocial = TextEditingController();

  final TextEditingController _controllerPrice = TextEditingController();
  final TextEditingController _controllerBlock = TextEditingController();

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
          text: 'LOTE',
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
              onPressed: () {},
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
                        SizedBox(
                          width: 27,
                        ),
                        RotatedBox(
                          quarterTurns: 3,
                          child: TextCustom(
                            text: 'Não necessario',
                            color: PaletteColors.grey,
                            size: 14.0,
                          ),
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Água',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Esgoto',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Energia elétrica',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Iluminação Pública',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Telefone',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Pavimentação',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Águas pluviais',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Guias e sarjetas',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Abast. de gás',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Coleta de lixo',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Escola',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Creche',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Saúde Pública',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Comercio',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Segurança Pública',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.35,
                          child: TextCustom(
                              text: 'Lazer',
                              color: PaletteColors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                        Checkbox(
                          value: checkBoxvalue,
                          onChanged: (checkBoxvalue) =>
                              setState(() => checkBoxvalue = checkBoxvalue!),
                        ),
                      ],
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
                        "Há no entorno da unidade atividades e/ou características incompatíveis com o uso ou que possam provocar risco ou situação de insalubridade nas edificações, com consequente comprometimento do retorno da operação? Em caso afirmativo assinale abaixo:",
                        size: 16.0,
                        maxLines: 7,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextCustom(
                        text: "Fatores Naturais",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...natural.map(buildSingleCheckbox).toList(),
                      ],
                    ),
                    InputRegister(
                        controller: _controllerNatural,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.5,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextCustom(
                        text: "Fatores ambientais e sociais",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        ...social.map(buildSingleCheckbox).toList(),
                      ],
                    ),
                    InputRegister(
                        controller: _controllerSocial,
                        hint: 'Especificar',
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.5,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                    Divider(thickness: 1),
                    TextCustom(
                      text: "Valor",
                      size: 14.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                    ),
                    InputRegister(
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
                    SizedBox(height: 6),
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
                          controller: _controllerBlock,
                          hint: '''
                      \n Nulla Lorem mollit cupidatat irure.
                      \n Laborum magna 
                      \n nulla duis ullamco cillum dolor. 
                       ''',
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
                            onPressed: () => Navigator.pop(context),
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
                            onPressed: () =>
                                Navigator.pushNamed(context, '/finished'),
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
