import 'package:vistoria/Utils/exports.dart';

void showSnackBar(BuildContext context, String text){
  final snackbar = SnackBar(
    backgroundColor: Colors.red,
    content: Row(
      children: [
        Icon(Icons.info_outline,color: Colors.white),
        SizedBox(width: 20),
        Expanded(
          child: Text(text,
            style: TextStyle(fontSize: 16),),
        ),
      ],
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
