import 'package:vistoria/Utils/exports.dart';

class InputHome extends StatelessWidget {

  final widget;

  const InputHome({required this.widget});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: width*0.8,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white60,
          border: Border.all(
            color: Colors.black26, //                   <--- border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5)
      ),
      child:widget,
    );
  }
}
