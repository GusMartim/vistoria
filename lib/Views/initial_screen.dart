import 'package:vistoria/Utils/exports.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: PaletteColors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                height: height * 0.4,
                width: height * 0.4,
                child: Image.asset("assets/image/logo_light.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(9.5),
                child: ButtonCustom(
                  widthCustom: 0.78,
                  heightCustom: 0.070,
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, '/register'),
                  text: "Cadastrar",
                  size: 14,
                  colorButton: PaletteColors.primaryColor,
                  colorText: PaletteColors.white,
                  colorBorder: PaletteColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 2.0,
                width: 0.0,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: ButtonCustom(
                  widthCustom: 0.78,
                  heightCustom: 0.070,
                  onPressed: () => Navigator.popAndPushNamed(context, '/login'),
                  text: "Entrar",
                  size: 14,
                  colorButton: PaletteColors.white,
                  colorText: PaletteColors.primaryColor,
                  colorBorder: PaletteColors.primaryColor,
                ),
              )
            ],
          ),
        ));
  }
}
