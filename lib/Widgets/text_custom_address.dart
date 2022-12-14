import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Utils/colors.dart';

class TextCustomAddress extends StatelessWidget {

  final address;
  final type;
  final width;

  TextCustomAddress({required this.address,required this.type,required this.width});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(text: '$type - ',style: TextStyle(fontSize: 14,color:PaletteColors.grey,fontWeight: FontWeight.bold,fontFamily: 'Nunito')),
            TextSpan(text: address, style: const TextStyle(fontSize: 14,color:PaletteColors.grey,fontFamily: 'Nunito')),
          ],
        ),
      ),
    );
  }
}
