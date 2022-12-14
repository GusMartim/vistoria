import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Views/check_list_extra.dart';
import 'package:vistoria/Views/checklist_apto_1.dart';
import 'package:vistoria/Views/checklist_lote_1.dart';
import 'package:vistoria/Views/construction_step.dart';
import 'package:vistoria/Views/data_request_screen.dart';
import 'package:vistoria/Views/finish_apt.dart';
import 'package:vistoria/Views/finish_lote.dart';
import 'package:vistoria/Views/finish_obra.dart';
import 'package:vistoria/Views/history_screen.dart';
import 'package:vistoria/Views/login_screen.dart';
import 'package:vistoria/Views/main_menu.dart';

import 'package:vistoria/Views/register_screen.dart';
import 'package:vistoria/Views/request_screen.dart';
import 'package:vistoria/Views/survey_finish_screen.dart';
import 'package:vistoria/Views/survey_screen.dart';

import '../Views/finish_extra.dart';




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
            builder: (_) =>MenuScreen()
        );

      case "/demanda":
        return MaterialPageRoute(
            builder: (_) =>DataRequest(id:  args as String)
        );case "/request":
        return MaterialPageRoute(
            builder: (_) =>RequestScreen()
        );
      case "/check1":
        return MaterialPageRoute(
            builder: (_) =>CheckList1(idSurvey: args as String)
        );
      case "/checkapto1":
        return MaterialPageRoute(
            builder: (_) => CheckListApto1(idSurvey: args as String)
        );
      case "/checklote1":
        return MaterialPageRoute(
            builder: (_) => CheckListLote1(idSurvey: args as String)
        );
      case "/construction":
        return MaterialPageRoute(
            builder: (_) => ConstructionStep(idSurvey: args as String)
        );
      case "/extra":
        return MaterialPageRoute(
            builder: (_) => CheckListExtra(idSurvey: args as String)
        );
      case "/finished":
        return MaterialPageRoute(
            builder: (_) => SurveyFinishScreen(idSurvey: args as String)
        );
        case "/finishedAPT":
        return MaterialPageRoute(
            builder: (_) => SurveyFinishScreenApt(idSurvey: args as String)
        );case "/finishedExtra":
        return MaterialPageRoute(
            builder: (_) => SurveyFinishScreenExtra(idSurvey: args as String)
        );case "/finishedObra":
        return MaterialPageRoute(
            builder: (_) => SurveyFinishScreenObra(idSurvey: args as String)
        );case "/finishedLote":
        return MaterialPageRoute(
            builder: (_) => SurveyFinishScreenLote(idSurvey: args as String)
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