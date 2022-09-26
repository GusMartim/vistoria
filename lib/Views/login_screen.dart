import '../Utils/exports.dart';
import '../Widgets/snackBars.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  bool visiblePassword = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _error =  "";

  _signFirebase()async{
    if (_controllerEmail.text.isNotEmpty) {
      setState(() {
        _error = "";
      });

      try{
        await _auth.signInWithEmailAndPassword(
            email: _controllerEmail.text.trim(),
            password: _controllerPassword.text.trim()
        ).then((auth)async{
          Navigator.popAndPushNamed(context, "/main");
        });
      }on FirebaseAuthException catch (e) {
        if(e.code =="unknown"){
          setState(() {
            _error = "A senha está vazia!";
            showSnackBar(context, _error,);
          });
        }else if(e.code =="invalid-email"){
          setState(() {
            _error = "Digite um e-mail válido!";
            showSnackBar(context, _error,);
          });
        }else{
          setState(() {
            _error = e.code;
            showSnackBar(context, _error,);
          });
        }
      }
    } else {
      setState(() {
        _error = "Preencha seu email";
        showSnackBar(context, _error,);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(

      backgroundColor: PaletteColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.01),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  height: height * 0.25,
                  width: height * 0.25,
                  child: Image.asset("assets/image/logo_light.png"),
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  SizedBox(width: width * 0.1),
                  Container(

                    width: width * 0.8,
                    child: TextCustom(
                      text: "E-mail",
                      size: 14.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.1),
                  Container(

                    child: InputRegister(
                        controller: _controllerEmail,
                        hint: "E-mail",
                        fonts: 14.0,
                        keyboardType: TextInputType.text,
                        width: width * 0.8,
                        sizeIcon: 0.0,
                        icons: Icons.height,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  SizedBox(width: width * 0.1),
                  Container(

                    width: width * 0.8,
                    child: TextCustom(
                      text: "Senha",
                      color: PaletteColors.grey,
                      size: 14.0,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(

                children: [
                  SizedBox(width: width * 0.1),
                  Container(
                    child: InputPassword(
                      controller: _controllerPassword,
                      hint: "**********",
                      fonts: 14.0,
                      keyboardType: TextInputType.visiblePassword,
                      obscure: visiblePassword,
                      width: width * 0.8,
                      colorIcon: PaletteColors.primaryColor,
                      icons: Icons.height,
                      showPassword: visiblePassword,
                      onPressed: () {
                        setState(() {
                          if (visiblePassword == false) {
                            visiblePassword = true;
                          } else {
                            visiblePassword = false;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  SizedBox(width: width * 0.2),
                  Container(
                    alignment: Alignment.topRight,
                    width: width * 0.7,
                    child: TextCustom(
                      text: "    Esqueci a senha/resetar",
                      color: PaletteColors.primaryColor,
                      size: 12.0,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    alignment: Alignment.center,
                    child: ButtonCustom(
                      widthCustom: 0.8,
                      heightCustom: 0.085,
                      onPressed: () =>_signFirebase(),
                      text: "Entrar",
                      size: 14.0,
                      colorButton: PaletteColors.primaryColor,
                      colorText: PaletteColors.white,
                      colorBorder: PaletteColors.primaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
