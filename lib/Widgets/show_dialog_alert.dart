import '../utils/exports.dart';

class ShowDialog extends StatelessWidget {

  final String title;
  final colorTextTitle;
  final colorTextContent;
  final String content;
  final listActions;

  ShowDialog({
    required this.title,
    required this.content,
    required this.listActions,
    this.colorTextTitle = Colors.red,
    this.colorTextContent = Colors.red,
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return AlertDialog(
      title: Container(
          width: width*0.2,
          child: TextCustom(text: title,color: colorTextTitle,size: 18.0,fontWeight: FontWeight.bold,textAlign: TextAlign.center,maxLines: 2,)
      ),
      titleTextStyle: TextStyle(color: PaletteColors.primaryColor,fontSize: 18),
      content: Row(
        children: [
          Expanded(
              child:  Container(
                width: width*0.25,
                child: TextCustom(
                  textAlign: TextAlign.center,
                  text: content,
                  color: colorTextContent,
                ),
              )
          ),
        ],
      ),
      actions: listActions,
      actionsPadding: EdgeInsets.only(right:8.0,left: 8.0,bottom: 24.0),
    );
  }
}