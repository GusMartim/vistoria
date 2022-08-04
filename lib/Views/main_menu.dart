import 'package:vistoria/Widgets/text_custom.dart';


import '../Utils/exports.dart';





class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: PaletteColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextCustom(
                text: "TEIA",
                color: PaletteColors.primaryColor,
                size: 24.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
            ),
          ],
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 26,
              ),
            child: TextCustom(
              text: "Olá,Lucas",
              size: 14.0,
              color: PaletteColors.grey,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height:  height * 0.03),
          Row(
            children: [
              CustomCard(
                text:"Demandas",
                icon: Icons.add_location_rounded,
                page: '/demandas',
              ),
              CustomCard(
                text: "Nova Vistoria",
                icon: Icons.list_rounded,
                page: '/vistoria',
              ),
            ],
          ),
          Row(
            children: [
              CustomCard(
                text: "Historico",
                icon: Icons.window_outlined,
                page: '',
              ),
              CustomCard(
                text: "Tutorial",
                icon: Icons.branding_watermark_rounded,
                page: '',
              ),
            ],
          ),
          Row(
            children: [
              CustomCard(
                text: "Enviar Feedback",
                icon: Icons.comment_rounded,
                page: '',
              ),
            ],
          )
        ]
      ),
   );
  }
}
