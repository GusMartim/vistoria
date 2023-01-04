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
          width: width*0.5,
          height: height* 0.1,
          child: TextCustom(text: title,color: colorTextTitle,size: 18.0,fontWeight: FontWeight.bold,textAlign: TextAlign.center,maxLines: 2,)
      ),
      titleTextStyle: TextStyle(color: PaletteColors.primaryColor,fontSize: 18),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child:  Container(
                height: height* 0.025,
                width: width*0.5,
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
      actionsPadding: EdgeInsets.only(right:15.0,left: 15.0,bottom: 10.0),
    );
  }
}