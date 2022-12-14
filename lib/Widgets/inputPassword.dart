import 'package:flutter/services.dart';
import 'package:vistoria/Utils/exports.dart';

class InputPassword extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final double fonts;
  final TextInputType keyboardType;
  final bool obscure;
  final double width;
  List<TextInputFormatter>? inputFormatters=[];
  Color colorIcon;
  IconData icons;
  bool showPassword;
  VoidCallback onPressed;

  InputPassword({
    required this.controller,
    required this.hint,
    required this.fonts,
    required this.keyboardType,
    required this.obscure,
    required this.width,
    this.inputFormatters,
    required this.colorIcon,
    required this.icons,
    required this.showPassword,
    required this.onPressed,
});

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topCenter,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin:  EdgeInsets.only( top: 6, bottom: 6, right: 24),
      decoration: BoxDecoration(
        color: PaletteColors.greyInput,
        // border: Border.all(
        //   color: Colors.black26, //                   <--- border color
        //   width: 2.0,
        // ),
        borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              obscureText: this.obscure,
              controller: this.controller,
              textAlign: TextAlign.start,
              keyboardType: this.keyboardType,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: this.fonts,
              ),
              inputFormatters:this.inputFormatters,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: this.hint,
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: this.fonts,
                  )
              ),
            ),
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: PaletteColors.greyInput,
                shadowColor: Colors.white,
                elevation: 0
              ),
              onPressed: onPressed,
              icon: showPassword
                  ?Icon(Icons.visibility_off,color: PaletteColors.primaryColor)
                  :Icon(Icons.visibility,color: PaletteColors.primaryColor),
              label: Text('')
          )
        ],
      ),
    );
  }
}
