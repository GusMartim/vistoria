import 'package:url_launcher/url_launcher.dart';
import 'package:vistoria/Utils/exports.dart';

class ListTileCustom extends StatelessWidget {
  final onTap;
  final onTapPdf;
  bool showIcons;
  final text;
  final data;
  final id;
  final pdf;

  ListTileCustom({
    required this.text,
    required this.onTap,
    required this.onTapPdf,
    this.showIcons = false,
    required this.data,
    required this.id,
    this.pdf = '',
});


  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: ListTile(
              title: TextCustom(
                text: text, color: PaletteColors.grey,
                size: 14.0,
                fontWeight: FontWeight.normal,
              ),
              subtitle: TextCustom(
                text: data, color: PaletteColors.grey,
                size: 12.0,
                fontWeight: FontWeight.bold,
              ),

            ),
          ),
          showIcons==true?Row(
            children: [
              SizedBox(width: 15),
              Ink(
                decoration: ShapeDecoration(
                  color:  PaletteColors.greyInput,
                  shape: CircleBorder(),


                ),
                child: IconButton(icon: Icon(
                  Icons.edit,
                  color: PaletteColors.primaryColor,
                ),
                  constraints: BoxConstraints(minHeight: 30,
                      minWidth: 30,
                      maxHeight: 30,
                      maxWidth: 30),
                  iconSize: 20.0,
                  padding: EdgeInsets.zero,
                  onPressed: () =>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Surveyscreen(
                                  text: 'Editar Vistoria',
                                  buttonText: 'Continuar',
                                  id: id
                              )
                          )

                      ),
                ),
              ),
              SizedBox(width: 15),
              Ink(
                decoration: ShapeDecoration(
                  color:  PaletteColors.greyInput,
                  shape: CircleBorder(),


                ),
                child: IconButton(icon: Icon(
                  Icons.sim_card_download,
                  color: PaletteColors.primaryColor,
                ),
                  constraints: BoxConstraints(minHeight: 30,
                      minWidth: 30,
                      maxHeight: 30,
                      maxWidth: 30),
                  iconSize: 20.0,
                  padding: EdgeInsets.zero,
                  onPressed: onTapPdf
                ),
              ),
              SizedBox(width: 15),
              Ink(
                decoration: ShapeDecoration(
                  color:  PaletteColors.greyInput,
                  shape: CircleBorder(),


                ),
                child: IconButton(icon: Icon(
                  Icons.delete_forever,
                  color: PaletteColors.grey,
                ),
                  constraints: BoxConstraints(minHeight: 30,
                      minWidth: 30,
                      maxHeight: 30,
                      maxWidth: 30),
                  iconSize: 20.0,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                  db
                      .collection('surveys')
                      .doc(id)
                      .delete().then((value) => Navigator.pushReplacement(context,
                      MaterialPageRoute(
                          builder: (_) => HistoryScreen()
                      )
                  )
                  );
                  },
                ),
              ),



            ],

          ):Divider(),
        ],

      )
    );
  }
}
