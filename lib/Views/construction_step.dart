import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class ConstructionStep extends StatefulWidget {
  const ConstructionStep({Key? key}) : super(key: key);

  @override
  State<ConstructionStep> createState() => _ConstructionStepState();
}

class _ConstructionStepState extends State<ConstructionStep> {
  final TextEditingController _controllerNumber = TextEditingController();

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
          text: 'ETAPA DE OBRA',
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
          SizedBox(width: width * 0.04,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  TextCustom(
                    text: "Serviços",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  TextCustom(
                    text: "%",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(width: width * 0.15),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: width * 0.4,
                    child: TextCustom(
                      text: "Serviços Preliminares e Gerais",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Spacer(),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Serviços Preliminares e Gerais
              Row(
                children: [
                  TextCustom(
                    text: "Infraestrutura",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Infraestrutura
              Row(
                children: [
                  TextCustom(
                    text: "Supra estrutura",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Supra estrutura
              Row(
                children: [
                  TextCustom(
                    text: "Paredes e painéis",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Paredes e painéis
              Row(
                children: [
                  TextCustom(
                    text: "Esquadrias",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Esquadrias
              Row(
                children: [
                  TextCustom(
                    text: "Vidros e plásticos",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Vidros e plásticos
              Row(
                children: [
                  TextCustom(
                    text: "Coberturas",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Coberturas
              Row(
                children: [
                  TextCustom(
                    text: "Impermeabilizações",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Impermeabilizações
              Row(
                children: [
                  Container(
                    width: width * 0.4,
                    child: TextCustom(
                      text: "Revestimentos Internos",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Spacer(),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Revestimentos Internos
              Row(
                children: [
                  TextCustom(
                    text: "Forros",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Forros
              Row(
                children: [
                  Container(
                    width: width*0.4,
                    child: TextCustom(
                      text: "Revestimentos externos",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Spacer(),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Revestimentos externos
              Row(
                children: [
                  TextCustom(
                    text: "Pintura",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Pintura
              Row(
                children: [
                  TextCustom(
                    text: "Pisos",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Pisos
              Row(
                children: [
                  TextCustom(
                    text: "Acabamentos",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Acabamentos
              Row(
                children: [
                  Container(
                    width: width * 0.4,
                    child: TextCustom(
                      text: "Inst. elétricas e telefônicas",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Spacer(),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Inst. elétricas e telefônicas
              Row(
                children: [
                  TextCustom(
                    text: "Inst. hidráulicas",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Inst. hidráulicas
              Row(
                children: [
                  Container(
                    width: width * 0.4,
                    child: TextCustom(
                      text: "Inst. esgoto e águas pluviais",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Spacer(),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Inst. esgoto e águas pluviais
              Row(
                children: [
                  TextCustom(
                    text: "Louças e metais",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Louças e metais
              Row(
                children: [
                  TextCustom(
                    text: "Complementos",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Complementos
              Row(
                children: [
                  TextCustom(
                    text: "Outros serviços",
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
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      height: 40,
                      width: width * 0.18,
                    child: InputRegister(
                      controller: _controllerNumber,
                      hint: '01',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      width: width * 0.09,
                      sizeIcon: 0.0,
                      icons: Icons.height,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.midGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ), //Outros serviços
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
