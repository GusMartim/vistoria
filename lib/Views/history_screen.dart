import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {


  int selectedText = 0;
  List <ListTileModel>items = [
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),
    ListTileModel(text: 'Rua Washington Carvalho, 2541, Centro - São Paulo/SP',data: '20/04/2022  16:00', iconShow: false),



  ];
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
            text: 'HISTORICO',size: 20.0,color: PaletteColors.white,
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
                  padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                  child: InputRegister(

                      controller: _controllerAdress,
                      hint: "Pesquisar",
                      fonts: 14.0,
                      keyboardType: TextInputType.text,
                      width: width *2.0,
                      sizeIcon: 25.0,
                      icons: (Icons.search_rounded),

                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput),
                ),
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
                            return ListTileCustom(text: (items[index].text),
                                data: (items[index].data),
                                showIcons: items[index].iconShow,

                                onTap: (){
                                  setState(() {
                                    if(selectedText==0){
                                      selectedText= selectedText +1;
                                      items[index].iconShow = true;
                                    }
                                    else{
                                      selectedText= selectedText-1;
                                      items[index].iconShow = false;

                                    }


                                  });
                                }
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
