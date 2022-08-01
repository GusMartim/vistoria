import 'package:vistoria/Utils/exports.dart';



void main ()async{
  String route = '/splash';

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: SplashScreen(),
    initialRoute:route,
    onGenerateRoute: Routes.generateRoute,

  ));


}