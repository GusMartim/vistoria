import 'package:vistoria/Utils/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<bool> _mockCheckForSession()
  async{
    await Future.delayed(const Duration
      (milliseconds: 5000),(){});

          return true;
  }
  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status){
      if(status){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder:(BuildContext context) => const InitialScreen()

        )
        );
      }
    }
    );
  }


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaletteColors.bgColor,
      body: Center(
        child: SizedBox(
          height: height*0.4,
          width: height * 0.4,
          child: Image.asset("assets/image/TEIA.png"),
        ),
      ),
    );
  }
}
