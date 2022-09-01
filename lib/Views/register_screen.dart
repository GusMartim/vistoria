import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputPassword.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/snackBars.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordConfirm = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  UserModel _userModel= UserModel();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool visiblePassword = false;
  String _error='';
  var result;
  
  _saveData(UserModel userModel){
    db.collection('users').doc(userModel.idUser).set(_userModel.toMap()).then((_)=>
    Navigator.pushReplacementNamed(context, '/login'));
  }

  _createUser()async {
    if (_controllerName.text.isNotEmpty) {
      if (_controllerEmail.text.isNotEmpty) {
        if (_controllerPhone.text.isNotEmpty) {
          if (_controllerPassword.text == _controllerPasswordConfirm.text &&
              _controllerPassword.text.isNotEmpty) {
            setState(() {
              _error = '';
            });

            try {
              await _auth.createUserWithEmailAndPassword(
                  email: _controllerEmail.text,
                  password: _controllerPassword.text
              ).then((auth) async {
                User user = FirebaseAuth.instance.currentUser!;
                user.updateDisplayName(_controllerName.text);

                _userModel.idUser = user.uid;
                _userModel.name = _controllerName.text;
                _userModel.phone = _controllerPhone.text;
                _userModel.email = _controllerEmail.text;
                _userModel.password = _controllerPassword.text;
                _userModel.confirmPassword = _controllerPasswordConfirm.text;
                _saveData(_userModel);
              });
            } on FirebaseAuthException catch (e) {
              if (e.code == "weak-password") {
                setState(() {
                  _error = "Digite uma senha mais forte!";
                  showSnackBar(context, _error, _scaffoldKey);
                });
              } else if (e.code == "unknown") {
                setState(() {
                  _error = "A senha está vazia";
                  showSnackBar(context, _error, _scaffoldKey);
                });
              } else if (e.code == "invalid-email") {
                setState(() {
                  _error = "Digite um e-mail válido";
                  showSnackBar(context, _error, _scaffoldKey);
                });
              } else if (e.code == "email-already-in-use") {
                setState(() {
                  _error = "Esse e-mail já está cadastrado!";
                  showSnackBar(context, _error, _scaffoldKey);
                });
              } else {
                setState(() {
                  _error = e.code;
                });
              }
            }
          } else {
            setState(() {
              _error = 'Senhas diferentes';
              showSnackBar(context, _error, _scaffoldKey);
            });
          }
        } else {
          setState(() {
            _error = 'Confira o número do telefone';
            showSnackBar(context, _error, _scaffoldKey);
          });
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: PaletteColors.white,
      appBar: AppBar(
        backgroundColor: PaletteColors.bgColor,
        iconTheme: IconThemeData(
          color: PaletteColors.white,
        ),
        elevation: 0,
        title: TextCustom(
          text: 'CADASTRO',
          size: 20.0,
          color: PaletteColors.white,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextCustom(
                text: "Olá, crie sua conta!",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4.2),
              child: TextCustom(
                text: "Nome",
                size: 14.0,
                color: PaletteColors.primaryColor,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
            ),
            InputRegister(
              icons: Icons.height,
              sizeIcon: 0.0,
              width: width * 0.8,
              controller: _controllerName,
              hint: 'Nome Completo',
              fonts: 14.0,
              keyboardType: TextInputType.text,
              colorBorder: PaletteColors.greyInput,
              background: PaletteColors.greyInput,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4.2),
              child: TextCustom(
                text: "E-mail",
                size: 14.0,
                color: PaletteColors.primaryColor,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
            ),
            InputRegister(
              icons: Icons.height,
              sizeIcon: 0.0,
              width: width * 0.8,
              controller: _controllerEmail,
              hint: "E-mail",
              fonts: 14.0,
              keyboardType: TextInputType.text,
              colorBorder: PaletteColors.greyInput,
              background: PaletteColors.greyInput,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4.2),
              child: TextCustom(
                text: "Telefone",
                size: 14.0,
                color: PaletteColors.primaryColor,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
            ),
            InputRegister(
              icons: Icons.height,
              sizeIcon: 0.0,
              width: width * 0.8,
              controller: _controllerPhone,
              hint: "(XX) XXXXX-XXXX",
              fonts: 14.0,
              keyboardType: TextInputType.number,
              colorBorder: PaletteColors.greyInput,
              background: PaletteColors.greyInput,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4.2),
              child: TextCustom(
                text: "Senha",
                size: 14.0,
                color: PaletteColors.primaryColor,
                fontWeight: FontWeight.normal,
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4.2),
              child: TextCustom(
                text: "Confirmar Senha",
                size: 14.0,
                color: PaletteColors.primaryColor,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.center,
              ),
            ),
            InputPassword(
              controller: _controllerPasswordConfirm,
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
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
              child: ButtonCustom(
                widthCustom: 0.80,
                heightCustom: 0.070,
                onPressed: () => _createUser(),
                text: "Crie sua conta",
                size: 14.0,
                colorButton: PaletteColors.primaryColor,
                colorText: PaletteColors.white,
                colorBorder: PaletteColors.primaryColor,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
