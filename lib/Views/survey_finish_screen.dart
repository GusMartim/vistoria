import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class SurveyFinishScreen extends StatefulWidget {
  const SurveyFinishScreen({Key? key}) : super(key: key);

  @override
  State<SurveyFinishScreen> createState() => _SurveyFinishScreenState();
}

class _SurveyFinishScreenState extends State<SurveyFinishScreen> {
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
          text: 'VISTORIA FINALIZADA',
          size: 20.0,
          color: PaletteColors.white,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              TextCustom(
                text: "Unidade",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(child: Image.asset('assets/image/Casa1.png')),
                    SizedBox(width: 10),
                    Container(child: Image.asset('assets/image/Cozinha1.png')),
                    SizedBox(width: 10),
                    Container(child: Image.asset('assets/image/telhado1.png')),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(child: Image.asset('assets/image/Banheiro1.png')),
                    SizedBox(width: 10),
                    Container(
                        child: Image.asset('assets/image/Lavanderia1.png')),
                    SizedBox(width: 10),
                    Container(child: Image.asset('assets/image/piscina1.png')),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.greyInput,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.sim_card_download,
                        color: PaletteColors.primaryColor,
                      ),
                      constraints: BoxConstraints(
                          minHeight: 46,
                          minWidth: 46,
                          maxHeight: 46,
                          maxWidth: 46),
                      iconSize: 32.0,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextCustom(
                    text: "Salvar Documento",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: PaletteColors.greyInput,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.shortcut_rounded,
                        color: PaletteColors.primaryColor,
                      ),
                      constraints: BoxConstraints(
                          minHeight: 46,
                          minWidth: 46,
                          maxHeight: 46,
                          maxWidth: 46),
                      iconSize: 32.0,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextCustom(
                    text: "Compartilhar",
                    size: 16.0,
                    color: PaletteColors.grey,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.1, horizontal: 26.0),
                child: ButtonCustom(
                  widthCustom: 0.8,
                  heightCustom: 0.070,
                  onPressed: () => Navigator.popAndPushNamed(context, '/main'),
                  text: "Finalizar",
                  size: 14.0,
                  colorButton: PaletteColors.primaryColor,
                  colorText: PaletteColors.white,
                  colorBorder: PaletteColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
