import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Views/login_screen.dart';
import 'package:vistoria/Views/main_menu.dart';

import 'package:vistoria/Views/register_screen.dart';
import 'package:vistoria/Views/request_screen.dart';
import 'package:vistoria/Views/survey_screen.dart';
import 'package:vistoria/Views/teste.dart';



class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings){
    final args = settings.arguments;

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
            builder: (_) => RegisterScreen()
        );
      case "/login":
        return MaterialPageRoute(
            builder: (_) =>const LoginScreen()
        );
      case "/demandas":
        return MaterialPageRoute(
            builder: (_) =>const RequestScreen()
        );
      case "/vistoria":
        return MaterialPageRoute(
            builder: (_) =>const Surveyscreen()
        );
      case "/historico":
        return MaterialPageRoute(
            builder: (_) =>const MenuScreen()
        );
      case "/tutorial":
        return MaterialPageRoute(
            builder: (_) =>const MenuScreen()
        );
      case "/feedback":
        return MaterialPageRoute(
            builder: (_) =>const MenuScreen()
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