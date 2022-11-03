import 'package:vistoria/Utils/exports.dart';

class ListTileCustom extends StatelessWidget {
  final onTap;
  bool showIcons;
  final text;
  final data;
  final id;

  ListTileCustom({
    required this.text,
    required this.onTap,
    this.showIcons = false,
    required this.data,
    required this.id,
});


  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    
    return Center(
      child: Column(
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
          showIcons==true?Padding(
            padding: const EdgeInsets.all(10.0),

            child: Row(
              children: [
                SizedBox(width: 10),
                Ink(
                  decoration: ShapeDecoration(
                    color:  PaletteColors.greyInput,
                    shape: CircleBorder(),


                  ),
                  child: IconButton(icon: Icon(
                    Icons.edit,
                    color: PaletteColors.primaryColor,
                  ),
                    constraints: BoxConstraints(minHeight: 46,
                        minWidth: 46,
                        maxHeight: 46,
                        maxWidth: 46),
                    iconSize: 32.0,
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
                SizedBox(width: 10),
                Ink(
                  decoration: ShapeDecoration(
                    color:  PaletteColors.greyInput,
                    shape: CircleBorder(),


                  ),
                  child: IconButton(icon: Icon(
                    Icons.sim_card_download,
                    color: PaletteColors.primaryColor,
                  ),
                    constraints: BoxConstraints(minHeight: 46,
                        minWidth: 46,
                        maxHeight: 46,
                        maxWidth: 46),
                    iconSize: 32.0,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 10),
                Ink(
                  decoration: ShapeDecoration(
                    color:  PaletteColors.greyInput,
                    shape: CircleBorder(),


                  ),
                  child: IconButton(icon: Icon(
                    Icons.shortcut_rounded,
                    color: PaletteColors.primaryColor,
                  ),
                    constraints: BoxConstraints(minHeight: 46,
                        minWidth: 46,
                        maxHeight: 46,
                        maxWidth: 46),
                    iconSize: 32.0,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 10),
                Ink(
                  decoration: ShapeDecoration(
                    color:  PaletteColors.greyInput,
                    shape: CircleBorder(),


                  ),
                  child: IconButton(icon: Icon(
                    Icons.delete_forever,
                    color: PaletteColors.grey,
                  ),
                    constraints: BoxConstraints(minHeight: 46,
                        minWidth: 46,
                        maxHeight: 46,
                        maxWidth: 46),
                    iconSize: 32.0,
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

            ),



          ):Divider(thickness: 1),
        ],

      )
    );
  }
}
