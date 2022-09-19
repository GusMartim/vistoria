import '../Utils/exports.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;


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
                height: height * 0.15,
                width: width * 0.15,
                child: Image.asset("assets/image/logo_light.png"),
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
                  text: 'Olá, ' +
                      FirebaseAuth.instance.currentUser!.displayName! +
                      '!',
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
                        screen: RequestScreen()),
                    CustomCard(
                      text: "Nova Vistoria",
                      icon: Icons.list_rounded,
                      screen: Surveyscreen(
                          text: 'Nova Vistoria',
                          buttonText: 'Prosseguir',
                          id: ''),

                    )
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
                        screen: HistoryScreen(idSurvey: ''),
                        ),
                    CustomCard(
                        text: "Tutorial",
                        icon: Icons.branding_watermark_rounded,
                        screen: TutorialScreen(),
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
                        screen: FeedbackScreen(),
                       ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
