import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Views/initial_screen.dart';
import 'package:vistoria/Views/splash_screen.dart';


class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case "/splash":
        return MaterialPageRoute(
            builder: (_) => SplashScreen()
        );
      case "/initial" :
        return MaterialPageRoute(
            builder: (_) =>InitialScreen()
        );
      default :
        _erroRota();
    }
  }
  static Route <dynamic> _erroRota(){
    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(
              title: Text("Tela em desenvolvimento"),
            ),
            body: Center(
              child: Text("Tela em desenvolvimento"),
            ),
          );
    });
  }
}