import 'package:vistoria/Utils/exports.dart';



class PopUp extends StatefulWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaletteColors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
                child: ButtonCustom(
                  widthCustom: 0.75,
                  heightCustom: 0.07,
                  onPressed: () =>Navigator.pushNamed(context, '/login'),
                  text: 'Conta cadastrada\n com sucesso!',
                  size: 20.0,
                  colorButton: PaletteColors.bgColor,
                  colorText: PaletteColors.white,
                  colorBorder: PaletteColors.bgColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
