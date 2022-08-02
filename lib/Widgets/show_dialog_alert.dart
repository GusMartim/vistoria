import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/text_custom.dart';
import 'package:vistoria/Utils/colors.dart';

class ShowDialogAlert extends StatelessWidget {

  final String title;
  final colorTextTitle;
  final colorTextContent;
  final String content;
  final listActions;

  const ShowDialogAlert({
    required this.title,
    required this.content,
    required this.listActions,
    this.colorTextTitle = PaletteColors.white,
    this.colorTextContent = PaletteColors.white,
});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return AlertDialog(

      backgroundColor: PaletteColors.bgColor,

      title: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: width*0.2,
            height: height*0.15,

            child: TextCustom(text: title,color: colorTextTitle,size: 50.0,fontWeight: FontWeight.bold,)
          ),
        ],
      ),
      titleTextStyle: TextStyle(color: PaletteColors.white,fontSize: 20.0),
      content: Column(


        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            width: width*0.1,
            height: height*0.1,

            child: TextCustom(
              textAlign: TextAlign.center,
              text: content,
              color: colorTextContent,
              maxLines: 4,
              size: 66.0,
            ),
          ),
          Column(

            mainAxisSize: MainAxisSize.min,
            children: listActions,
          )
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      // actions: listActions,
    );
  }
}
