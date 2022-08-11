import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputPassword.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {



  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail= TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPasswordConfirm = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool visiblePassword = false;


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: PaletteColors.white,
      appBar: AppBar(
        backgroundColor: PaletteColors.bgColor,
        iconTheme:  IconThemeData(
          color: PaletteColors.white,
          ),
          elevation: 0,
          title: TextCustom(
            text: 'CADASTRO',size: 20.0,color: PaletteColors.white,
            fontWeight: FontWeight.bold,textAlign: TextAlign.center,),
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
                      color:PaletteColors.grey,
                      fontWeight: FontWeight.bold,textAlign: TextAlign.left,

                  ),
                ),
                SizedBox(height:40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical:4.2),
                  child: TextCustom(
                    text: "Nome",
                    size: 14.0,
                    color: PaletteColors.primaryColor,
                    fontWeight: FontWeight.normal,textAlign: TextAlign.center,),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical:4.2),
                  child: TextCustom(
                    text: "E-mail",
                    size: 14.0,
                    color: PaletteColors.primaryColor,
                    fontWeight: FontWeight.normal,textAlign: TextAlign.center,),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical:4.2),
                  child: TextCustom(
                    text: "Telefone",
                    size:14.0,
                    color: PaletteColors.primaryColor,
                    fontWeight: FontWeight.normal,textAlign: TextAlign.center,),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical:4.2),
                  child: TextCustom(
                    text: "Senha",
                    size: 14.0,
                    color: PaletteColors.primaryColor,
                    fontWeight: FontWeight.normal,textAlign: TextAlign.center,
                    ),
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
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical:4.2),
                  child: TextCustom(
                    text: "Confirmar Senha",
                    size: 14.0,
                    color: PaletteColors.primaryColor,
                    fontWeight: FontWeight.normal,textAlign: TextAlign.center,),
                ),
                InputPassword(
                  controller:_controllerPasswordConfirm,
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
                SizedBox(height:22),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                child: ButtonCustom(
                  widthCustom: 0.80,
                  heightCustom: 0.055,
                  onPressed:() { AlertModel().alert(
                      'Conta cadastrada \n   com sucesso!  ',
                      '',
                      PaletteColors.white,
                      PaletteColors.white,
                      context,
                  [

                  ]
                  );
                    Future.delayed(Duration(seconds: 3),(){
                      Navigator.popAndPushNamed(context, '/login');
                    });
                    },
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
