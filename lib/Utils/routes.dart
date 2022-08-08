import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Views/data_request_screen.dart';
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
      case "/main":
        return MaterialPageRoute(
            builder: (_) =>const MenuScreen()
        );
      case "/demandas":
        return MaterialPageRoute(
            builder: (_) =>const RequestScreen()
        );
      case "/demanda":
        return MaterialPageRoute(
            builder: (_) =>const DataRequest()
        );
      case "/vistoria":
        return MaterialPageRoute(
            builder: (_) =>const Surveyscreen()
        );
      case "/check1":
        return MaterialPageRoute(
            builder: (_) =>const CheckList1()
        );
      case "/check2":
        return MaterialPageRoute(
            builder: (_) =>const CheckList2()
        );
      case "/check3":
        return MaterialPageRoute(
            builder: (_) =>const CheckList3()
        );
      case "/check4":
        return MaterialPageRoute(
            builder: (_) =>const CheckList4()
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