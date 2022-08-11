

import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';


class CheckListLote1 extends StatefulWidget {
  const CheckListLote1({Key? key}) : super(key: key);

  @override
  State<CheckListLote1> createState() => _CheckListLote1State();
}

class _CheckListLote1State extends State<CheckListLote1> {


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







  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaletteColors.white,
      appBar: AppBar(
        backgroundColor: PaletteColors.bgColor,
        iconTheme:  IconThemeData(
          color: PaletteColors.white,

        ),
        elevation: 0,
        title: TextCustom(
          text: 'CheckList 1/4',size: 20.0,color: PaletteColors.white,
          fontWeight: FontWeight.bold,textAlign: TextAlign.center,),
        actions: <Widget>[
          Ink(
            decoration: ShapeDecoration(
              color:  PaletteColors.white,
              shape: CircleBorder(),



            ),
            child: IconButton(icon: Icon(
              Icons.camera_alt,
              color: PaletteColors.primaryColor,
            ),
              constraints: BoxConstraints(minHeight: 28,
                  minWidth: 28,
                  maxHeight: 28,
                  maxWidth: 28),
              iconSize: 24.0,
              padding: EdgeInsets.all(3.0),
              onPressed: () {},
            ),
          ),
        ],

      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical:24 ,horizontal:24 ),
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
                InputRegister(controller: _controllerType,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(thickness: 1.0,),
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
                InputRegister(controller: _controllerShape,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(thickness: 1.0,),
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
                InputRegister(controller: _controllerSituation,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(thickness: 1.0,),
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
                InputRegister(controller: _controllerTopography,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(thickness: 1.0,),
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
                InputRegister(controller: _controllerTerrain,
                    hint: 'Especificar',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                Divider(thickness: 1.0,),


                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:0.1 ,horizontal:26.0 ),
                      child: ButtonCustom(
                      widthCustom: 0.3,
                      heightCustom: 0.055,
                      onPressed:() => Navigator.pop(context),
                      text: "Voltar",
                      size: 14.0,
                      colorButton: PaletteColors.white,
                      colorText: PaletteColors.primaryColor,
                      colorBorder: PaletteColors.primaryColor,
                  ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:0.1 ,horizontal:26.0 ),
                      child: ButtonCustom(
                      widthCustom: 0.3,
                      heightCustom: 0.055,
                        onPressed:() => Navigator.pushNamed(context, '/checklote2'),
                      text: "Próximo",
                      size: 14.0,
                      colorButton: PaletteColors.primaryColor,
                      colorText: PaletteColors.white,
                      colorBorder: PaletteColors.primaryColor,
                  ),
                    ),],
                )
              ],
            ),


          ),
        ),
      ),
    );



            }
  Widget buildSingleCheckbox(CheckBoxModel checkBoxModel)=> CheckboxListTile(
    title: TextCustom(text:checkBoxModel.title,
    color: PaletteColors.grey,
      fontWeight: FontWeight.normal,size: 16.0),
    value: checkBoxModel.value,
    onChanged: (value) => setState(() =>
    checkBoxModel.value = value!),
    activeColor: PaletteColors.primaryColor,
    checkColor: PaletteColors.white,
  );






  }

