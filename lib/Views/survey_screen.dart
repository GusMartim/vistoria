import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';


class Surveyscreen extends StatefulWidget {
  const Surveyscreen({Key? key}) : super(key: key);

  @override
  State<Surveyscreen> createState() => _SurveyscreenState();
}

class _SurveyscreenState extends State<Surveyscreen> {

  final TextEditingController _controllerAdress = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();
  final TextEditingController _controllerComplement= TextEditingController();
  final TextEditingController _controllerDistrict = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerState = TextEditingController();
  final TextEditingController _controllerCEP = TextEditingController();
  final TextEditingController _controllerType= TextEditingController();
  final TextEditingController _controllerLatG = TextEditingController();
  final TextEditingController _controllerLatMin = TextEditingController();
  final TextEditingController _controllerLatSeg = TextEditingController();
  final TextEditingController _controllerLongG = TextEditingController();
  final TextEditingController _controllerLongMin = TextEditingController();
  final TextEditingController _controllerLongSeg = TextEditingController();


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaletteColors.white,
      appBar: AppBar(
        backgroundColor: PaletteColors.bgColor,
        iconTheme:  IconThemeData(
          color: PaletteColors.white,

        ),
        elevation: 0,
        title: TextCustom(
          text: 'NOVA VISTORIA',size: 20.0,color: PaletteColors.white,
          fontWeight: FontWeight.bold,textAlign: TextAlign.center,),

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,
                vertical: 3.0),
                  child: TextCustom(
                    text: "Endereço",
                    size: 14.0,
                    color:PaletteColors.grey,
                    fontWeight: FontWeight.bold,textAlign: TextAlign.left,

                  ),
                ),
                InputRegister(controller: _controllerAdress,
                    hint: 'Rua Antonio Lopes',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.8,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),

                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,
                vertical: 3.0),
                      child: TextCustom(
                        text: "Número",
                        size:14.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                    ),
                    InputRegister(
                      icons: Icons.height,
                      sizeIcon: 0.0,
                      width: width * 0.2,
                      controller: _controllerNumber,
                      hint: "325",
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,
                vertical: 3.0),
                    child: TextCustom(
                      text: "Complemento",
                      size:14.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                  ),
                    InputRegister(
                      icons: Icons.height,
                      sizeIcon: 0.0,
                      width: width * 0.53,
                      controller: _controllerComplement,
                      hint: "Ex. Casa",
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),

                  ],)
                ],),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,
                vertical: 3.0),
                child: TextCustom(
                  text: "Bairro",
                  size: 14.0,
                  color:PaletteColors.grey,
                  fontWeight: FontWeight.bold,textAlign: TextAlign.left,

                ),
              ),
              InputRegister(controller: _controllerDistrict,
                  hint: 'Vila Santa Isabel',
                  fonts: 14.0,
                  keyboardType: TextInputType.text,
                  width: width * 0.8,
                  sizeIcon: 0.0,
                  icons: Icons.height,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput),
              ],
            ),
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,
                vertical: 3.0),
                        child: TextCustom(
                          text: "Cidade",
                          size:14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                      ),
                      InputRegister(
                        icons: Icons.height,
                        sizeIcon: 0.0,
                        width: width * 0.53,
                        controller: _controllerCity,
                        hint: "São Paulo",
                        fonts: 14.0,
                        keyboardType: TextInputType.number,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput,
                      ),
                    ],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,
                vertical: 3.0),
                        child: TextCustom(
                          text: "Estado",
                          size:14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                      ),
                      InputRegister(
                        icons: Icons.height,
                        sizeIcon: 0.0,
                        width: width * 0.2,
                        controller: _controllerState,
                        hint: "SP",
                        fonts: 14.0,
                        keyboardType: TextInputType.number,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput,
                      ),

                    ],)
                ],),
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,
                            vertical: 3.0),
                        child: TextCustom(
                          text: "CEP",
                          size:14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                      ),
                      InputRegister(
                        icons: Icons.height,
                        sizeIcon: 0.0,
                        width: width * 0.28,
                        controller: _controllerCEP,
                        hint: "15000-000",
                        fonts: 14.0,
                        keyboardType: TextInputType.number,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput,
                      ),
                    ],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,
                            vertical: 3.0),
                        child: TextCustom(
                          text: "Tipo de imóvel",
                          size:14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                      ),
                      InputRegister(
                        icons: Icons.height,
                        sizeIcon: 0.0,
                        width: width * 0.45,
                        controller: _controllerState,
                        hint: "Casa",
                        fonts: 14.0,
                        keyboardType: TextInputType.number,
                        colorBorder: PaletteColors.greyInput,
                        background: PaletteColors.greyInput,
                      ),

                    ],)
                ],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextCustom(
                          text: "Coordenadas",
                          size:12.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextCustom(
                          text: "Graus",
                          size:12.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,
                            horizontal: 40.0),
                        child: TextCustom(
                          text: "Min",
                          size:12.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,
                        horizontal: 40.0),
                        child: TextCustom(
                          text: "Seg",
                          size:12.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                      ),

                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextCustom(
                            text: "Latitude",
                            size:12.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                        ),
                         InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.18,
                          controller: _controllerLatG,
                          hint: "-15,00",
                          fonts: 14.0,
                          keyboardType: TextInputType.number,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),
                        InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.18,
                          controller: _controllerLatMin,
                          hint: "46,00",
                          fonts: 14.0,
                          keyboardType: TextInputType.number,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),
                        InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.18,
                          controller: _controllerLatSeg,
                          hint: "28,37",
                          fonts: 14.0,
                          keyboardType: TextInputType.number,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),


                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextCustom(
                            text: "Longitude",
                            size:12.0,
                            color: PaletteColors.grey,
                            fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
                        ),
                        InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.18,
                          controller: _controllerLatG,
                          hint: "-48,00",
                          fonts: 14.0,
                          keyboardType: TextInputType.number,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),
                        InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.18,
                          controller: _controllerLatMin,
                          hint: "17,00",
                          fonts: 14.0,
                          keyboardType: TextInputType.number,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),
                        InputRegister(
                          icons: Icons.height,
                          sizeIcon: 0.0,
                          width: width * 0.18,
                          controller: _controllerLatSeg,
                          hint: "36,88",
                          fonts: 14.0,
                          keyboardType: TextInputType.number,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput,
                        ),


                      ],
                    ),
                  ],
                ),
                SizedBox(height: 3.0,width: 0.0,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ButtonCustom(
                    widthCustom: 0.80,
                    heightCustom: 0.055,
                    onPressed:() => Navigator.pushNamed(context, 'initial'),
                    text: "Prosseguir",
                    size: 14.0,
                    colorButton: PaletteColors.primaryColor,
                    colorText: PaletteColors.white,
                    colorBorder: PaletteColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
