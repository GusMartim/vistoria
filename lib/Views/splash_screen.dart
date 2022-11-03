import 'package:permission_handler/permission_handler.dart';
import 'package:vistoria/Utils/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _mockCheckForSession()async{
    if(FirebaseAuth.instance.currentUser!=null){
      await Future.delayed(Duration(seconds: 3),(){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: ( BuildContext context) => MenuScreen()
            )
        );
      });
    }else{
      await Future.delayed(Duration(seconds: 3),(){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: ( BuildContext context) => InitialScreen()
            )
        );
      });
    }
  }
  permissoes() async {
    var galeriaStatus = await Permission.accessMediaLocation.status;
    var notificacao = await Permission.notification.status;
    var imagem = await Permission.storage.status;
    var internet = await Permission.photos.status;
    var localizacao = await Permission.location.status;
    if (!galeriaStatus.isGranted)
      await Permission.accessMediaLocation.request();
    if (!notificacao.isGranted) await Permission.notification.request();
    if (!imagem.isGranted) await Permission.storage.request();
    if (!internet.isGranted) await Permission.photos.request();
    if (!localizacao.isGranted) await Permission.location.request();
  }

  @override
  void initState() {
    super.initState();
    permissoes();
    _mockCheckForSession();



  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaletteColors.bgColor,
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          height: height * 0.4,
          width: height * 0.4,
          child: Image.asset("assets/image/logo_dark.png"),
        ),
      ),
    );
  }
}
