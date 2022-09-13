import '../../Utils/exports.dart';

class CheckBoxWater extends StatefulWidget {
  bool  satisfactory;
  bool precary;
  bool notAvaiable;

  CheckBoxWater(
      {
        this.satisfactory = false,
        this.precary = false,
        this.notAvaiable = false
      });




  @override
  _CheckBoxWaterState createState() => _CheckBoxWaterState();
}

class _CheckBoxWaterState extends State<CheckBoxWater> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Container(
          width: width * 0.35,
          child: TextCustom(
              text: 'Água',
              color: PaletteColors.grey,
              fontWeight: FontWeight.normal),
        ),
        Spacer(),
        Checkbox(
          value: widget.satisfactory,
          onChanged: (checked) =>
              setState(() => widget.satisfactory = checked!,
              )
        ),
        Checkbox(
          value: widget.precary,
          onChanged: (checked) =>
              setState(() => widget.precary = checked!),
        ),
        Checkbox(
          value: widget.notAvaiable,
          onChanged: (checked) =>
              setState(() => widget.notAvaiable = checked!),
        ),
      ],
    );
  }
}
