import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class CheckListLote3 extends StatefulWidget {
  const CheckListLote3({Key? key}) : super(key: key);

  @override
  State<CheckListLote3> createState() => _CheckListLote3State();
}

class _CheckListLote3State extends State<CheckListLote3> {
  bool checkBoxvalue = false;

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
            text: 'CheckList 3/4',
            size: 20.0,
            color: PaletteColors.white,
            fontWeight: FontWeight.normal,
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
            SizedBox(width: width* 0.04)
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
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
                  Row(
                    children: [
                      SizedBox(width: width *0.10),
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
                      SizedBox(width: width * 0.10),
                      Container(
                        width: width * 0.35,
                        child: ButtonCustom(
                          widthCustom: 0.3,
                          heightCustom: 0.070,
                          onPressed: () =>
                              Navigator.pushNamed(context, '/checklote4'),
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
        ));
  }
}
