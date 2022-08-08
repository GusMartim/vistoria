

import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';


class CheckList3 extends StatefulWidget {
  const CheckList3({Key? key}) : super(key: key);

  @override
  State<CheckList3> createState() => _CheckList3State();
}

class _CheckList3State extends State<CheckList3> {


  final kitchen = [
    CheckBoxModel(title: 'Ceramico'),
    CheckBoxModel(title: 'Barra lisa'),
    CheckBoxModel(title: '1/2 altura'),
    CheckBoxModel(title: 'Piso a teto'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerKitchen = TextEditingController();

  final bathroom= [
    CheckBoxModel(title: 'Ceramico'),
    CheckBoxModel(title: 'Barra lisa'),
    CheckBoxModel(title: '1/2 altura'),
    CheckBoxModel(title: 'Piso a teto'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerBathroom = TextEditingController();

  final tank = [
    CheckBoxModel(title: 'Ceramico'),
    CheckBoxModel(title: 'Barra lisa'),
    CheckBoxModel(title: '1/2 altura'),
    CheckBoxModel(title: 'Piso a teto'),
    CheckBoxModel(title: 'Nenhum'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerTank = TextEditingController();

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
  final TextEditingController _controllerPattern = TextEditingController();

  final state = [
    CheckBoxModel(title: 'Novo'),
    CheckBoxModel(title: 'Bom'),
    CheckBoxModel(title: 'Regular'),
    CheckBoxModel(title: 'Reparos simples'),
    CheckBoxModel(title: 'Reparos importantes'),
    CheckBoxModel(title: 'Ruim'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerState = TextEditingController();

  final Unityroof = [
    CheckBoxModel(title: 'Forro PVC'),
    CheckBoxModel(title: 'Forro Gesso'),
    CheckBoxModel(title: 'Forro Paulista'),
    CheckBoxModel(title: 'Laje'),
    CheckBoxModel(title: 'Telhado aparente'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerUnityRoof = TextEditingController();







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
                  TextCustom(
                    text: "Revestimento da Cozinha",
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
                      ...kitchen.map(buildSingleCheckbox).toList(),
                    ],
                  ), //Revestimento da Cozinha
                  InputRegister(controller: _controllerKitchen,
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
                    text: "Revestimento do Banheiro",
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
                      ...bathroom.map(buildSingleCheckbox).toList(),
                    ],
                  ), //Revestimento do Banheiro
                  InputRegister(controller: _controllerBathroom,
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
                    text: "Revestimento do Tanque",
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
                      ...tank.map(buildSingleCheckbox).toList(),
                    ],
                  ), //Revestimento do Tanque
                  InputRegister(controller: _controllerTank,
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
                    text: "Padrão de Acabamento",
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
                      ...pattern.map(buildSingleCheckbox).toList(),
                    ],
                  ), //Padrão de Acabamento
                  InputRegister(controller: _controllerPattern,
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
                    text: "Estado de Conservação",
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
                      ...state.map(buildSingleCheckbox).toList(),
                    ],
                  ), //Estado de Conservação
                  InputRegister(controller: _controllerState,
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
                    text: "Teto da Unidade",
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
                      ...Unityroof.map(buildSingleCheckbox).toList(),
                    ],
                  ), //Teto da Unidade
                  InputRegister(controller: _controllerUnityRoof,
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
                          onPressed:() => Navigator.pushNamed(context, '/check2'),
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
                          onPressed:() => Navigator.pushNamed(context, 'initial'),
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

