import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Views/created_popup.dart';
import 'package:vistoria/Views/register_screen.dart';



class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings){
    //final args = settings.arguments;

    switch(settings.name){
      case "/splash":
        return MaterialPageRoute(
            builder: (_) => const SplashScreen()
        );
      case "/initial" :
        return MaterialPageRoute(
            builder: (_) =>const InitialScreen()
        );
      case "/register" :
        return MaterialPageRoute(
            builder: (_) =>const RegisterScreen()
        );
      case "/created":
        return MaterialPageRoute(
            builder: (_) =>const PopUp()
        );
      default :
        _erroRota();
    }
    return null;
  }
  static Route <dynamic> _erroRota(){
    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              title: const Text("Tela em desenvolvimento"),
            ),
            body: const Center(
              child: Text("Tela em desenvolvimento"),
            ),
          );
    });
  }
}