import 'package:vistoria/Utils/exports.dart';

import 'Views/initial_screen.dart';
import 'Views/splash_screen.dart';

void main ()async{
  //String route = '/splash';

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InitialScreen(),
  ),);


}