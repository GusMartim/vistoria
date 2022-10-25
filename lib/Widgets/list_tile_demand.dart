import 'package:vistoria/Utils/exports.dart';

class ListTileDemand extends StatelessWidget {
  final onTap;
  final text;
  final id;

  ListTileDemand({
    required this.text,
    required this.onTap,
    
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


            ),
          ),
        ],

      )
    );
  }
}
