import 'package:vistoria/Utils/exports.dart';
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


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      //key: _scaffoldKey,
      backgroundColor: PaletteColors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: PaletteColors.bgColor,
          ),
          elevation: 0,
          title: TextCustom(
            text: 'Cadastro',size: 20,color: PaletteColors.white,
            fontWeight: FontWeight.bold,textAlign: TextAlign.center,),
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                    ),
                    child: TextCustom(
                        text: "Olá,crie sua conta!",
                        size: 14,
                        color:PaletteColors.grey,
                        fontWeight: FontWeight.bold,textAlign: TextAlign.center,

                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10),
                  child: TextCustom(
                    text: "Nome",
                    size: 14,
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
                      horizontal: 10),
                  child: TextCustom(
                    text: "E-mail",
                    size: 14,
                    color: PaletteColors.primaryColor,
                    fontWeight: FontWeight.normal,textAlign: TextAlign.center,),
                ),
                InputRegister(
                  icons: Icons.height,
                  sizeIcon: 0.0,
                  width: width * 0.8,
                  controller: _controllerEmail,
                  hint: "email@email.com",
                  fonts: 14,
                  keyboardType: TextInputType.text,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput,

                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10),
                  child: TextCustom(
                    text: "Telefone",
                    size:14,
                    color: PaletteColors.primaryColor,
                    fontWeight: FontWeight.normal,textAlign: TextAlign.center,),
                ),
                InputRegister(
                  icons: Icons.height,
                  sizeIcon: 0.0,
                  width: width * 0.8,
                  controller: _controllerPhone,
                  hint: "(XX) XXXXX-XXXX",
                  fonts: 14,
                  keyboardType: TextInputType.number,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10),
                  child: TextCustom(
                    text: "Senha",
                    size: 14,
                    color: PaletteColors.primaryColor,
                    fontWeight: FontWeight.normal,textAlign: TextAlign.center,
                    ),
                ),
                InputRegister(
                  icons: Icons.height,
                  sizeIcon: 0.0,
                  width: width * 0.8,
                  controller: _controllerPassword,
                  hint: "**********",
                  fonts: 14,
                  keyboardType: TextInputType.text,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10),
                  child: TextCustom(
                    text: "Confirmar Senha",
                    size: 14,
                    color: PaletteColors.primaryColor,
                    fontWeight: FontWeight.normal,textAlign: TextAlign.center,),
                ),
                InputRegister(
                  icons: Icons.height,
                  sizeIcon: 0.0,
                  width: width * 0.8,
                  controller: _controllerPasswordConfirm,
                  hint: "**********",
                  fonts: 14,
                  keyboardType: TextInputType.text,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                child: ButtonCustom(
                  widthCustom: 0.8,
                  heightCustom: 0.07,
                  onPressed: () =>Navigator.pushNamed(context, '/created'),
                  text: "Crie sua conta",
                  size: 14,
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
