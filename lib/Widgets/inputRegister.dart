import 'package:flutter/services.dart';

import '../Utils/exports.dart';

class InputRegister extends StatelessWidget {
  final controller;
  final hint;
  final fonts;
  final keyboardType;
  final width;
  List<TextInputFormatter>? inputFormatters = [];
  final sizeIcon;
  final icons;
  final colorBorder;
  final background;
  final onchanged;
  int? maxline = 1;

  InputRegister({
    required this.controller,
    required this.hint,
    required this.fonts,
    required this.keyboardType,
    required this.width,
    this.inputFormatters,
    this.maxline,
    this.onchanged,
    required this.sizeIcon,
    required this.icons,
    required this.colorBorder,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.topLeft,
      width: this.width,
      height: 42,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      margin: EdgeInsets.only( top: 4, bottom: 4, right: 24),
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: colorBorder)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onFieldSubmitted: onchanged,
              controller: this.controller,
              textAlign: TextAlign.start,
              keyboardType: this.keyboardType,
              textAlignVertical: TextAlignVertical.center,
              maxLines: maxline,
              style: TextStyle(
                color: Colors.black54,
                fontSize: this.fonts,
              ),
              inputFormatters: this.inputFormatters,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: this.hint,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: this.fonts,
                ),
              ),
            ),
          ),
          Icon(icons, size: sizeIcon),
        ],
      ),
    );
  }
}