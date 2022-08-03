import 'package:vistoria/Widgets/inputPassword.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

import '../Utils/exports.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool visiblePassword = false;




  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: PaletteColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.03),
              SizedBox(
                height: height * 0.4,
                width: height * 0.4,
                child: Image.asset("assets/image/TEIA.png"),
              ),
              SizedBox(height: height * 0.2),
              Container(
                alignment: Alignment.centerLeft,
                width: width * 0.8,
                child: TextCustom(
                  text: "E-mail",
                  size: 14.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,),
              ),
              InputRegister(
                  controller: _controllerEmail,
                  hint: "E-mail",
                  fonts: 14.0,
                  keyboardType: TextInputType.text,
                  width: width * 0.8,
                  sizeIcon: 0.0,
                  icons: Icons.height,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput),
              SizedBox(height: height * 0.2),
              Container(
                alignment: Alignment.centerLeft,
                width: width * 0.8,
                child: TextCustom(
                  text: "Senha",
                  color: PaletteColors.grey,
                  size: 14.0,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,),
              ),
              InputPassword(
                  controller:_controllerPassword,
                  hint: "**********",
                  fonts: 14.0,
                  keyboardType: TextInputType.visiblePassword,
                  obscure: visiblePassword,
                  width: width * 0.8,
                  colorIcon: PaletteColors.primaryColor,
                  icons: Icons.height,
                  showPassword: visiblePassword,
                  onPressed: (){
                    setState(() {
                      if(visiblePassword==false){
                        visiblePassword=true;
                      }else{
                        visiblePassword=false;
                      }
                    });
                  },
              ),
              SizedBox(height: height*0.02,),
              Container(
                alignment: Alignment.centerRight,
                width: width * 0.05,
                child: TextCustom(
                  text: "Esqueci a senha/resetar",
                  color: PaletteColors.primaryColor,
                  size: 12.0,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height:  height * 0.04),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonCustom(
                    widthCustom: 0.75,
                    heightCustom: 0.07,
                    onPressed: ()=> Navigator.pushNamed(context, '/main'),
                    text: "Entrar",
                    size: 14.0,
                    colorButton: PaletteColors.primaryColor,
                    colorText: PaletteColors.white,
                    colorBorder: PaletteColors.primaryColor,
                  ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
