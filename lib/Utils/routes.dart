import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Views/checklist_apto_1.dart';
import 'package:vistoria/Views/checklist_apto_2.dart';
import 'package:vistoria/Views/checklist_apto_3.dart';
import 'package:vistoria/Views/checklist_apto_4.dart';
import 'package:vistoria/Views/checklist_apto_5.dart';
import 'package:vistoria/Views/checklist_lote_1.dart';
import 'package:vistoria/Views/checklist_lote_2.dart';
import 'package:vistoria/Views/checklist_lote_3.dart';
import 'package:vistoria/Views/data_request_screen.dart';
import 'package:vistoria/Views/history_screen.dart';
import 'package:vistoria/Views/login_screen.dart';
import 'package:vistoria/Views/main_menu.dart';

import 'package:vistoria/Views/register_screen.dart';
import 'package:vistoria/Views/request_screen.dart';
import 'package:vistoria/Views/survey_finish_screen.dart';
import 'package:vistoria/Views/survey_screen.dart';




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
      case "/checkapto1":
        return MaterialPageRoute(
            builder: (_) =>const CheckListApto1()
        );
      case "/checkapto2":
        return MaterialPageRoute(
            builder: (_) =>const CheckListApto2()
        );
      case "/checkapto3":
        return MaterialPageRoute(
            builder: (_) =>const CheckListApto3()
        );
      case "/checkapto4":
        return MaterialPageRoute(
            builder: (_) =>const CheckListApto4()
        );
      case "/checkapto5":
        return MaterialPageRoute(
            builder: (_) =>const CheckListApto5()
        );
      case "/checklote1":
        return MaterialPageRoute(
            builder: (_) =>const CheckListLote1()
        );
      case "/checklote2":
        return MaterialPageRoute(
            builder: (_) =>const CheckListLote2()
        );
      case "/checklote3":
        return MaterialPageRoute(
            builder: (_) =>const CheckListLote3()
        );
      case "/checklote4":
        return MaterialPageRoute(
            builder: (_) =>const CheckListLote1()
        );

      case "/finished":
        return MaterialPageRoute(
            builder: (_) =>const SurveyFinishScreen()
        );
      case "/history":
        return MaterialPageRoute(
            builder: (_) =>const HistoryScreen()
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