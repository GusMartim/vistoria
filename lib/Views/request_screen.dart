import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final items = [
    'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
    'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
    'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
    'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
    'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
    'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
    'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
    'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',
    'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',];
  final TextEditingController _controllerAdress = TextEditingController();

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
            text: 'DEMANDAS',size: 20.0,color: PaletteColors.white,
            fontWeight: FontWeight.bold,textAlign: TextAlign.center,),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
                  child: InputRegister(

                      controller: _controllerAdress,
                      hint: "Pesquisar",
                      fonts: 14.0,
                      keyboardType: TextInputType.text,
                      width: width *2.0,
                      sizeIcon: 35.0,
                      icons: Icons.search,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput),
                ),
                SizedBox(height: 22),
                SingleChildScrollView(
                    child: Column(

                      children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: ()=> Navigator.pushNamed(context, '/demanda'),
                             child: Column(


                              children: <Widget>[
                                ListTile(
                                    title:
                                    TextCustom(
                                      text:items[index],
                                      color: PaletteColors.grey,
                                      fontWeight: FontWeight.normal,
                                      size: 14.0,
                                    )
                                ),
                                Divider(thickness: 1), //                           <-- Divider
                              ],
                            )
                            );

                          },
                        ),
                      ],
                    )

                ),
              ],
            ),

          ),
        )
    );
  }
}
