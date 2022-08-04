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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 8.0,
                ),
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
                  background: PaletteColors.greyInput)
            ],
          ),
        ),
      ),
    );
  }
}
