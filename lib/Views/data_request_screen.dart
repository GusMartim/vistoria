import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class DataRequest extends StatefulWidget {
  const DataRequest({Key? key}) : super(key: key);

  @override
  State<DataRequest> createState() => _DataRequestState();
}

class _DataRequestState extends State<DataRequest> {

  String place ="";
  String type = "";
  String anex = "";
  final items = [
    'Local: Rua Washington Carvalho, 2541, Centro - São Paulo/SP\nTipo: Casa',
    'Anexos',
    'Ver mapa'

  ];
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
            text: 'DEMANDA',size: 20.0,color: PaletteColors.white,
            fontWeight: FontWeight.bold,textAlign: TextAlign.center,),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                Column(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Column(


                          children: <Widget>[

                            Padding(padding:
                            const EdgeInsets.symmetric(
                              horizontal: 2.0,
                              vertical: 2.0,
                            )),
                            ListTile(



                                title: Text(items[index])


                            ),
                            Divider(color: PaletteColors.grey,
                            ), //                           <-- Divider
                          ],
                        );

                      },
                    ),
                  ],
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,

                  children: [
                  Padding(padding: const EdgeInsets.all(8.0),
                    child: ButtonCustom(
                      widthCustom: 0.85,
                      heightCustom: 0.07,
                      onPressed: ()=> Navigator.pushNamed(context, '/main'),
                      text: "Vistoriar",
                      size: 14.0,
                      colorButton: PaletteColors.primaryColor,
                      colorText: PaletteColors.white,
                      colorBorder: PaletteColors.primaryColor,
                    ),),
                  Padding(padding: const EdgeInsets.all(8.0),
                    child: ButtonCustom(
                      widthCustom: 0.85,
                      heightCustom: 0.07,
                      onPressed: ()=> Navigator.pushNamed(context, '/main'),
                      text: "Recusar",
                      size: 14.0,
                      colorButton: PaletteColors.bgColor,
                      colorText: PaletteColors.white,
                      colorBorder: PaletteColors.bgColor,
                    ),)
                ],
                    

                    )
                  
                

                    ],
                  ),

                ),



            ),

          );


  }
}
