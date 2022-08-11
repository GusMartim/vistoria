

import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';


class CheckListApto4 extends StatefulWidget {
  const CheckListApto4({Key? key}) : super(key: key);

  @override
  State<CheckListApto4> createState() => _CheckListApto4State();
}

class _CheckListApto4State extends State<CheckListApto4> {


  final unity = [
    CheckBoxModel(title: 'Andar'),
    CheckBoxModel(title: 'Apto de cobertura'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerUnity = TextEditingController();


  final edPosition = [
    CheckBoxModel(title: 'Isolado/ Frente do terreno'),
    CheckBoxModel(title: 'Isolado/ Centro do terreno'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerEdPosition = TextEditingController();
  final view = [
    CheckBoxModel(title: 'Favorável'),
    CheckBoxModel(title: 'Desfavorável'),
    CheckBoxModel(title: 'Sem influência'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerView = TextEditingController();
  final position = [
    CheckBoxModel(title: 'Frente/ Canto'),
    CheckBoxModel(title: 'Frente/ Meio'),
    CheckBoxModel(title: 'Fundo/ Canto'),
    CheckBoxModel(title: 'Fundo/ Meio'),
    CheckBoxModel(title: 'Lateral'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerPosition = TextEditingController();




  final TextEditingController _controllerPrice = TextEditingController();
  final TextEditingController _controllerAdminName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();






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
          text: 'CheckList 4/5',size: 20.0,color: PaletteColors.white,
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
                TextCustom(
                  text: "Unidade",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,

                ),//Unidade
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  children: [
                    ...unity.map(buildSingleCheckbox).toList(),
                  ],
                ),
                InputRegister(controller: _controllerUnity,
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
                        color:  PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft:Radius.circular(10) )),


                      ),
                      child: IconButton(icon: Icon(
                        Icons.remove,
                        color: PaletteColors.grey,
                      ),
                        constraints: BoxConstraints(minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(

                      height: 38,
                      child: InputRegister(controller: _controllerNumber,
                        hint: '01',
                        fonts: 14.0,
                        keyboardType: TextInputType.number,
                        width: width * 0.09,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput,),
                    ),

                    Ink(
                      decoration: ShapeDecoration(
                        color:  PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight:Radius.circular(10) )),


                      ),
                      child: IconButton(icon: Icon(
                        Icons.add,
                        color: PaletteColors.grey,
                      ),
                        constraints: BoxConstraints(minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ),

                  ],
                ),
                Row(

                  children: [
                    TextCustom(
                      text: "Quantidade de elevadores",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,

                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color:  PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft:Radius.circular(10) )),


                      ),
                      child: IconButton(icon: Icon(
                        Icons.remove,
                        color: PaletteColors.grey,
                      ),
                        constraints: BoxConstraints(minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(

                      height: 38,
                      child: InputRegister(controller: _controllerNumber,
                        hint: '01',
                        fonts: 14.0,
                        keyboardType: TextInputType.number,
                        width: width * 0.09,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput,),
                    ),

                    Ink(
                      decoration: ShapeDecoration(
                        color:  PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight:Radius.circular(10) )),


                      ),
                      child: IconButton(icon: Icon(
                        Icons.add,
                        color: PaletteColors.grey,
                      ),
                        constraints: BoxConstraints(minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
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
                        color:  PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft:Radius.circular(10) )),


                      ),
                      child: IconButton(icon: Icon(
                        Icons.remove,
                        color: PaletteColors.grey,
                      ),
                        constraints: BoxConstraints(minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(

                      height: 38,
                      child: InputRegister(controller: _controllerNumber,
                        hint: '01',
                        fonts: 14.0,
                        keyboardType: TextInputType.number,
                        width: width * 0.09,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput,),
                    ),

                    Ink(
                      decoration: ShapeDecoration(
                        color:  PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight:Radius.circular(10) )),


                      ),
                      child: IconButton(icon: Icon(
                        Icons.add,
                        color: PaletteColors.grey,
                      ),
                        constraints: BoxConstraints(minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
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
                        color:  PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft:Radius.circular(10) )),


                      ),
                      child: IconButton(icon: Icon(
                        Icons.remove,
                        color: PaletteColors.grey,
                      ),
                        constraints: BoxConstraints(minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(

                      height: 38,
                      child: InputRegister(controller: _controllerNumber,
                        hint: '01',
                        fonts: 14.0,
                        keyboardType: TextInputType.number,
                        width: width * 0.09,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput,),
                    ),

                    Ink(
                      decoration: ShapeDecoration(
                        color:  PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight:Radius.circular(10) )),


                      ),
                      child: IconButton(icon: Icon(
                        Icons.add,
                        color: PaletteColors.grey,
                      ),
                        constraints: BoxConstraints(minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ),

                  ],
                ),
                Row(

                  children: [
                    TextCustom(
                      text: "Nº de unidades no prédio",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,

                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color:  PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft:Radius.circular(10) )),


                      ),
                      child: IconButton(icon: Icon(
                        Icons.remove,
                        color: PaletteColors.grey,
                      ),
                        constraints: BoxConstraints(minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(

                      height: 38,
                      child: InputRegister(controller: _controllerNumber,
                        hint: '01',
                        fonts: 14.0,
                        keyboardType: TextInputType.number,
                        width: width * 0.09,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput,),
                    ),

                    Ink(
                      decoration: ShapeDecoration(
                        color:  PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight:Radius.circular(10) )),


                      ),
                      child: IconButton(icon: Icon(
                        Icons.add,
                        color: PaletteColors.grey,
                      ),
                        constraints: BoxConstraints(minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ),

                  ],
                ),
                Divider(thickness: 1.0,),
                TextCustom(
                  text: "Posição da Edificação",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,

                ),//Posição da Edificação
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  children: [
                    ...edPosition.map(buildSingleCheckbox).toList(),
                  ],
                ),
                InputRegister(controller: _controllerEdPosition,
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
                  text: "Vista Panorâmica",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,

                ),//Vista Panorâmica
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  children: [
                    ...view.map(buildSingleCheckbox).toList(),
                  ],
                ),
                InputRegister(controller: _controllerView,
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
                  text: "Posição da unidade no prédio",
                  size: 16.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,

                ),//Posição da unidade no prédio
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  children: [
                    ...position.map(buildSingleCheckbox).toList(),
                  ],
                ),
                InputRegister(controller: _controllerPosition,
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextCustom(
                    text: "Valor do Condomínio",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,

                  ),
                ),//Valor do Condomínio
                InputRegister(controller: _controllerPrice,
                    hint: 'R\$ 000.00',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextCustom(
                    text: "Administrador",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,

                  ),
                ),
                InputRegister(controller: _controllerPrice,
                    hint: 'Nome do administrador',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.9,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextCustom(
                    text: "Telefone",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,

                  ),
                ),
                InputRegister(controller: _controllerPrice,
                    hint: '(00) 00000-0000',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),
                SizedBox(height: 5.0),

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
                        onPressed:() => Navigator.pushNamed(context, '/checkapto5'),
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

