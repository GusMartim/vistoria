import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class CheckListLote2 extends StatefulWidget {
  const CheckListLote2({Key? key}) : super(key: key);

  @override
  State<CheckListLote2> createState() => _CheckListLote2State();
}

class _CheckListLote2State extends State<CheckListLote2> {
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
          text: 'CheckList 2/4',
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
          SizedBox(width: width * 0.04)
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
                            Navigator.pushNamed(context, '/checklote3'),
                        text: "Próximo",
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
