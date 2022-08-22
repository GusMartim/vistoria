import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class CheckListApto5 extends StatefulWidget {
  const CheckListApto5({Key? key}) : super(key: key);

  @override
  State<CheckListApto5> createState() => _CheckListApto5State();
}

class _CheckListApto5State extends State<CheckListApto5> {
  final block = [
    CheckBoxModel(title: 'Portaria/Guarita'),
    CheckBoxModel(title: 'Equipe de Segurança'),
    CheckBoxModel(title: 'Salão de Festas'),
    CheckBoxModel(title: 'PlayGround'),
    CheckBoxModel(title: 'Sauna/Ofurô'),
    CheckBoxModel(title: 'Quadra Poliesportiva'),
    CheckBoxModel(title: 'Quadra de Tênis'),
    CheckBoxModel(title: 'Mini Quadra'),
    CheckBoxModel(title: 'Piscina'),
    CheckBoxModel(title: 'Espaço com churrasqueira'),
    CheckBoxModel(title: 'Aquecimento Solar'),
    CheckBoxModel(title: 'Gerador'),
    CheckBoxModel(title: 'Campo de futebol/Mini Golf'),
    CheckBoxModel(title: 'Poço Artesiano'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerBlock = TextEditingController();

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
          text: 'CheckList 5/5',
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
          SizedBox(width: width * 0.04),
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
              TextCustom(
                text: "Unidade",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  TextCustom(
                    text: "Quartos",
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
              ), //Quartos
              Row(
                children: [
                  TextCustom(
                    text: "Banheiros sociais",
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
              ), //Banheiros sociais
              Row(
                children: [
                  TextCustom(
                    text: "Banheiros privativos",
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
              ), //Banheiros privativos
              Row(
                children: [
                  TextCustom(
                    text: "Lavabos",
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
              ), //Lavabos
              Row(
                children: [
                  TextCustom(
                    text: "Banheiro de serviço",
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
              ), //Banheiro de serviço
              Row(
                children: [
                  TextCustom(
                    text: "Quarto de empregada",
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
              ), //Quarto de empregada
              Row(
                children: [
                  TextCustom(
                    text: "Varanda/Sacada",
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
              ), //Varanda/sacada
              Row(
                children: [
                  Container(
                    width: width * 0.4,
                    child: TextCustom(
                      text: "Número de armários completos",
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
              ), //Numero de armarios completos
              Row(
                children: [
                  TextCustom(
                    text: "Cozinha",
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
              ), //Cozinha
              Row(
                children: [
                  TextCustom(
                    text: "Sala",
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
              ), //Sala
              Row(
                children: [
                  Container(
                    width: width * 0.4,
                    child: TextCustom(
                      text: "Área de serviço coberto",
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
              ), //Area de serviço coberto
              Row(
                children: [
                  Container(
                    width: width * 0.4,
                    child: TextCustom(
                      text: "Área de serviço descoberto",
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
              ), //Area de serviço descoberto
              Row(
                children: [
                  TextCustom(
                    text: "Garagem coberta",
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
              ), //Garagem Coberta
              Row(
                children: [
                  TextCustom(
                    text: "Garagem Descoberta",
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
              ), //Garagem Descoberta
              Row(
                children: [
                  TextCustom(
                    text: "Ar condicionado",
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
              ), //Ar condicionado
              Row(
                children: [
                  TextCustom(
                    text: "Piscina",
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
              ), //Piscina
              Divider(
                thickness: 1.0,
              ),
              TextCustom(
                text: "Condominio/Bloco",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...block.map(buildSingleCheckbox).toList(),
                ],
              ), //Revestimento do Banheiro
              InputRegister(
                  controller: _controllerBlock,
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
