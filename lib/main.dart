//--no-sound-null-safety
//flutter run --no-sound-null-safety
import 'package:vistoria/Utils/exports.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  String route = '/splash';
  initializeDateFormatting();
  Intl.defaultLocale = 'pt_BR';

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: Surveyscreen(),
    initialRoute: route,
    onGenerateRoute: Routes.generateRoute,
  ));
}