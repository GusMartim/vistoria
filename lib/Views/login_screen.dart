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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool visiblePassword = false;
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
          Navigator.pushReplacementNamed(context, "/main");
        });
      }on FirebaseAuthException catch (e) {
        if(e.code =="unknown"){
          setState(() {
            _error = "A senha está vazia!";
            showSnackBar(context, _error,_scaffoldKey);
          });
        }else if(e.code =="invalid-email"){
          setState(() {
            _error = "Digite um e-mail válido!";
            showSnackBar(context, _error,_scaffoldKey);
          });
        }else{
          setState(() {
            _error = e.code;
            showSnackBar(context, _error,_scaffoldKey);
          });
        }
      }
    } else {
      setState(() {
        _error = "Preencha seu email";
        showSnackBar(context, _error,_scaffoldKey);
      });
    }
  }


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
              SizedBox(height: height * 0.01),
              SizedBox(
                height: height * 0.25,
                width: height * 0.25,
                child: Image.asset("assets/image/TEIA.png"),
              ),
              SizedBox(height: height * 0.02),
              Container(
                alignment: Alignment.centerLeft,
                width: width * 0.8,
                child: TextCustom(
                  text: "E-mail",
                  size: 14.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
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
              SizedBox(height: height * 0.02),
              Container(
                alignment: Alignment.centerLeft,
                width: width * 0.8,
                child: TextCustom(
                  text: "Senha",
                  color: PaletteColors.grey,
                  size: 14.0,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
              InputPassword(
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
              SizedBox(
                height: height * 0.01,
              ),
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
              SizedBox(height: height * 0.03),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonCustom(
                  widthCustom: 0.75,
                  heightCustom: 0.070,
                  onPressed: () =>_signFirebase(),
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
