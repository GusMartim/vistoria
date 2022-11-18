import 'package:vistoria/Utils/exports.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: PaletteColors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                height: height * 0.4,
                width: height * 0.4,
                child: Image.asset("assets/image/logo_light.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(9.5),
                child: ButtonCustom(
                  widthCustom: 0.78,
                  heightCustom: 0.070,
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, '/register'),
                  text: "Cadastrar",
                  size: 14,
                  colorButton: PaletteColors.primaryColor,
                  colorText: PaletteColors.white,
                  colorBorder: PaletteColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 2.0,
                width: 0.0,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: ButtonCustom(
                  widthCustom: 0.78,
                  heightCustom: 0.070,
                  onPressed: () => Navigator.popAndPushNamed(context, '/login'),
                  text: "Entrar",
                  size: 14,
                  colorButton: PaletteColors.white,
                  colorText: PaletteColors.primaryColor,
                  colorBorder: PaletteColors.primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    GestureDetector(
                      onTap: (){
                        // AlertModel().alert(
                        //     'Resetar senha',
                        //     'Insira o e-mail para resetar a senha',
                        //     PaletteColors.primaryColor,
                        //     PaletteColors.grey,
                        //     context,[
                        //   Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Row(
                        //
                        //         children: [
                        //           SizedBox(width: width * 0.04),
                        //           Container(
                        //
                        //             width: width * 0.65,
                        //
                        //             child: TextFormField(
                        //               controller: _controllerEmail,
                        //
                        //               keyboardType: TextInputType.text,
                        //               textAlignVertical: TextAlignVertical.bottom,
                        //               style: TextStyle(
                        //                   color: PaletteColors.grey
                        //               ),
                        //               decoration: InputDecoration(
                        //                 border: InputBorder.none,
                        //                 hintText: 'E-mail',
                        //                 hintStyle: TextStyle(
                        //                     color: PaletteColors.lightGrey,
                        //                     fontSize: 16.0
                        //                 ),
                        //
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                      //
                      //         ),
                      //         Row(
                      //           children: [
                      //             SizedBox(width: width * 0.04),
                      //             Padding(
                      //               padding: const EdgeInsets.only(bottom: 15.0),
                      //               child: Container(
                      //                 width: width * 0.6,
                      //                 child: ButtonCustom(
                      //                   widthCustom: 0.5,
                      //                   heightCustom: 0.085,
                      //                   onPressed: () {
                      //                     _auth
                      //                         .sendPasswordResetEmail(email: _controllerEmail.text)
                      //                         .then((value){
                      //                       Navigator.of(context).pop();
                      //                       showSnackBar(context, 'E-mail de redefinição de senha enviado', Colors.green);
                      //                     });
                      //
                      //                   },
                      //                   text: "Enviar",
                      //                   size: 14.0,
                      //                   colorButton: PaletteColors.primaryColor,
                      //                   colorText: PaletteColors.white,
                      //                   colorBorder: PaletteColors.primaryColor,
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //
                      //   ]
                      //   );
                       },
                      child: Container(

                        alignment: Alignment.center,
                        width: width * 0.7,
                        child: TextCustom(
                          text: "Aprenda a usar o aplicativo \n",
                          color: PaletteColors.primaryColor,
                          size: 12.0,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                          underscore: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
