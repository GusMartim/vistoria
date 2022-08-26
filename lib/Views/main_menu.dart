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
              SizedBox(
                height: height * 0.2,
                width: width * 0.2,
                child: Image.asset("assets/image/TEIA.png"),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(2.5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 30,
                ),
                child: TextCustom(
                  text: "Olá,Lucas",
                  size: 14.0,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 1.5,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCard(
                      text: "Demandas",
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
              ),
              Container(
                alignment: Alignment.center,
                width: width * 1.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCard(
                      text: "Historico",
                      icon: Icons.window_outlined,
                      page: '/history',
                    ),
                    CustomCard(
                      text: "Tutorial",
                      icon: Icons.branding_watermark_rounded,
                      page: '/tutorial',
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 1.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCard(
                      text: "Enviar Feedback",
                      icon: Icons.comment_rounded,
                      page: '/feedback',
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
