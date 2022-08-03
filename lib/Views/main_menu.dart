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
              Container(margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 22.0
              ),
                height: height * 0.18,
                width: height * 0.24,
                child: Card(
                  elevation: 4,
                  color: PaletteColors.greyInput,
                  shadowColor: PaletteColors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Icon(Icons.add_location_rounded, color: PaletteColors.lightGrey,
                        size: 40.0,),
                      SizedBox(height: 3.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextCustom(
                            text:"Demandas",
                            color: PaletteColors.grey,
                            size: 14.0,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    ],
                  ),

                ),
              ),

              Container(
                margin: EdgeInsets.zero,
                height: height * 0.18,
                width: height * 0.24,
                child: Card(
                  elevation: 4,
                  color: PaletteColors.greyInput,
                  shadowColor: PaletteColors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Icon(Icons.list_alt_rounded, color: PaletteColors.lightGrey,
                        size: 40.0,),
                      SizedBox(height: 3.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextCustom(
                            text:"Nova Vistoria",
                            color: PaletteColors.grey,
                            size: 14.0,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    ],
                  ),

                ),
              ),

            ],
          ),
          Row(

            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 22.0
                ),

                height: height * 0.18,
                width: height * 0.24,
                child: Card(
                  elevation: 4,
                  color: PaletteColors.greyInput,
                  shadowColor: PaletteColors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Icon(Icons.window_outlined, color: PaletteColors.lightGrey,
                        size: 40.0,),
                      SizedBox(height: 3.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextCustom(
                            text:"Historico",
                            color: PaletteColors.grey,
                            size: 14.0,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    ],
                  ),

                ),
              ),
              Container(
                margin: EdgeInsets.zero,
                height: height * 0.18,
                width: height * 0.24,
                child: Card(
                  elevation: 4,
                  color: PaletteColors.greyInput,
                  shadowColor: PaletteColors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Icon(Icons.branding_watermark_rounded, color: PaletteColors.lightGrey,
                        size: 40.0,),
                      SizedBox(height: 3.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextCustom(
                            text:"Tutorial",
                            color: PaletteColors.grey,
                            size: 14.0,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    ],
                  ),

                ),
              ),

            ],
          ),

          Row(

            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 22.0
                ),
                height: height *0.18,
                width: height * 0.24,
                child: Card(
                  elevation: 4,
                  color: PaletteColors.greyInput,
                  shadowColor: PaletteColors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Icon(Icons.comment_rounded, color: PaletteColors.lightGrey,
                        size: 40.0,),
                      SizedBox(height: 3.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextCustom(
                            text:"Enviar Feedback",
                            color: PaletteColors.grey,
                            size: 14.0,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    ],
                  ),

                ),
              )
            ],

          )


        ]


      ),
      
      );
      



    
  }
}
