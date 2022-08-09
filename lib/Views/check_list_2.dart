

import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';


class CheckList2 extends StatefulWidget {
  const CheckList2({Key? key}) : super(key: key);

  @override
  State<CheckList2> createState() => _CheckList2State();
}

class _CheckList2State extends State<CheckList2> {

  final TextEditingController _controllerAge= TextEditingController();
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
            text: 'CheckList 2/4',size: 20.0,color: PaletteColors.white,
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
                  Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,
                              vertical: 3.0),
                          child: TextCustom(
                            text: "Idade",
                            size:14.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                        ),
                        InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.2,
                          controller: _controllerAge,
                          hint: "00",
                          fonts: 14.0,
                          keyboardType: TextInputType.number,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),
                      ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,
                              vertical: 3.0),
                          child: TextCustom(
                            text: "Valor",
                            size:14.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                        ),
                        InputRegister(
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

                      ],)
                  ],),
                  TextCustom(
                    text: "Portas Externas",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,

                  ), //Portas Externas
                  ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    children: [
                      ...extern.map(buildSingleCheckbox).toList(),
                    ],
                  ),
                  InputRegister(controller: _controllerExtern,
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
                    text: "Piso",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,

                  ), //Piso
                  ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    children: [
                      ...floor.map(buildSingleCheckbox).toList(),
                    ],
                  ),
                  InputRegister(controller: _controllerFloor,
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
                    text: "Portas Internas",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,

                  ), //Portas Internas
                  ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    children: [
                      ...Intern.map(buildSingleCheckbox).toList(),
                    ],
                  ),
                  InputRegister(controller: _controllerIntern,
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
                    text: "Janelas",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,

                  ), //Janelas
                  ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    children: [
                      ...Windows.map(buildSingleCheckbox).toList(),
                    ],
                  ),
                  InputRegister(controller: _controllerWindows,
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
                    text: "Pintura Interna",
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
                      ...InternPaint.map(buildSingleCheckbox).toList(),
                    ],
                  ), // Posição da Unidade
                  InputRegister(controller: _controllerInternPaint,
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
                    text: "Bancada",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,

                  ), //Bancada
                  ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    children: [
                      ...balcony.map(buildSingleCheckbox).toList(),
                    ],
                  ),
                  InputRegister(controller: _controllerBalcony,
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
                    text: "Quadro Elétrico",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,

                  ), //Quadro Elétrico
                  ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    children: [
                      ...switchboard.map(buildSingleCheckbox).toList(),
                    ],
                  ),
                  InputRegister(controller: _controllerSwitchBoard,
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
                          onPressed:() => Navigator.pushNamed(context, '/check3'),
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
        )
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

