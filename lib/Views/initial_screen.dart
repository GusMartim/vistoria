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
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height * 0.4,
              width: height * 0.4,
              child: Image.asset("assets/image/TEIA.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonCustom(
                widthCustom:0.75,
                heightCustom: 0.07,
                onPressed: ()=> Navigator.pushNamed(context, '/definition'),
                text:"Cadastrar",
                size: 14,
                colorButton: PaletteColors.primaryColor,
                colorText: PaletteColors.white,
                colorBorder:PaletteColors.primaryColor,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonCustom(
                  widthCustom: 0.75,
                  heightCustom: 0.07,
                  onPressed: ()=> Navigator.pushNamed(context,'/login'),
                  text: "Entrar",
                  size: 14,
                  colorButton: PaletteColors.white,
                  colorText: PaletteColors.primaryColor,
                  colorBorder: PaletteColors.primaryColor,
                ),
            )
          ],
        ),
      )
    );
  }
}
