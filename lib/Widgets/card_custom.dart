import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final IconData icon;

  final screen;
  //final double vertical;
  //final double horizontal;

  const CustomCard(
  {Key? key,
    required this.text,
    required this.icon,

    required this.screen
    //required this.vertical,
    //required this.horizontal,
}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
       /* margin: EdgeInsets.symmetric(
            vertical: vertical,
            horizontal: horizontal,
        ),*/
        margin: EdgeInsets.all(8.0) ,
        height: height * 0.15,
        width: width * 0.35,

        child: GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(
                  builder: (_) => screen
              )
          ),
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
                Icon(icon, color: PaletteColors.lightGrey,
                  size: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextCustom(
                      text:text,
                      color: PaletteColors.grey,
                      size: 12.0,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
