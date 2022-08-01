import 'package:vistoria/Utils/colors.dart';
import 'package:vistoria/Utils/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaletteColors.bgColor,
      body: Center(
        child: SizedBox(
          height: height*0.5,
          width: height * 0.5,
          child: Image.asset("assets/image/TEIA.png"),
        ),
      ),
    );
  }
}
