import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class DataRequest extends StatefulWidget {
  const DataRequest({Key? key}) : super(key: key);

  @override
  State<DataRequest> createState() => _DataRequestState();
}

class _DataRequestState extends State<DataRequest> {
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
          text: 'DEMANDA',
          size: 20.0,
          color: PaletteColors.white,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextCustom(
                  text: "Local:  ",
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
                TextCustom(
                  text: "Rua Washington Carvalho, 2541, Centro",
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.start,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextCustom(
                      text: " - São Paulo/SP",
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextCustom(
                      text: "Tipo:",
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    TextCustom(
                      text: "Casa",
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextCustom(
                      text: "Anexos",
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'arquivo123.pdf ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: PaletteColors.grey,
                          decorationColor: PaletteColors.grey,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'imagem2546212.jpg',
                      style: TextStyle(
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        decorationColor: PaletteColors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Divider(
                  thickness: 1,
                ),
                Row(
                  children: [
                    TextCustom(
                      text: "Ver Mapa",
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(width: 6),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.greyInput,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.location_on,
                          color: PaletteColors.primaryColor,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 45,
                            minWidth: 45,
                            maxHeight: 45,
                            maxWidth: 45),
                        iconSize: 35.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 180),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ButtonCustom(
                    widthCustom: 0.85,
                    heightCustom: 0.055,
                    onPressed: () => Navigator.pushNamed(context, '/main'),
                    text: "Vistoriar",
                    size: 14.0,
                    colorButton: PaletteColors.primaryColor,
                    colorText: PaletteColors.white,
                    colorBorder: PaletteColors.primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ButtonCustom(
                    widthCustom: 0.85,
                    heightCustom: 0.055,
                    onPressed: () => Navigator.pushNamed(context, '/main'),
                    text: "Recusar",
                    size: 14.0,
                    colorButton: PaletteColors.bgColor,
                    colorText: PaletteColors.white,
                    colorBorder: PaletteColors.bgColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
