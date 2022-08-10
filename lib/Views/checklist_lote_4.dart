import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';


class CheckListLote4 extends StatefulWidget {
  const CheckListLote4({Key? key}) : super(key: key);

  @override
  State<CheckListLote4> createState() => _CheckListLote4State();
}

class _CheckListLote4State extends State<CheckListLote4> {


  final natural = [
    CheckBoxModel(title: 'Risco de deslizamento'),
    CheckBoxModel(title: 'Risco de alagamento'),
    CheckBoxModel(title: 'Risco de Erosão'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerNatural = TextEditingController();
  final social = [
    CheckBoxModel(title: 'Favela'),
    CheckBoxModel(title: 'Penitenciária'),
    CheckBoxModel(title: 'Indústria poluente'),
    CheckBoxModel(title: 'Usina de lixo'),
    CheckBoxModel(title: 'Matadouro'),
    CheckBoxModel(title: 'Via expressa'),
    CheckBoxModel(title: 'Viaduto'),
    CheckBoxModel(title: 'Cemitério'),
    CheckBoxModel(title: 'Hospital'),
    CheckBoxModel(title: 'Clube noturno'),
    CheckBoxModel(title: 'Feira livre'),
    CheckBoxModel(title: 'Oficinas'),
    CheckBoxModel(title: 'Outro:'),
  ];
  final TextEditingController _controllerSocial = TextEditingController();

  final TextEditingController _controllerPrice = TextEditingController();
  final TextEditingController _controllerBlock = TextEditingController();


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: PaletteColors.white,
      appBar: AppBar(
        backgroundColor: PaletteColors.bgColor,
        iconTheme:  IconThemeData(

          color: PaletteColors.white,

        ),
        elevation: 0,
        title: TextCustom(
          text: 'CheckList 4/4',size: 20.0,color: PaletteColors.white,
          fontWeight: FontWeight.bold,textAlign: TextAlign.center,),
        actions: <Widget>[
          Ink(
            decoration: ShapeDecoration(
              color:  PaletteColors.white,
              shape: CircleBorder(),



            ),
            child: IconButton(icon: Icon(
              Icons.camera_alt,
              color: PaletteColors.primaryColor,
            ),
              constraints: BoxConstraints(minHeight: 28,
                  minWidth: 28,
                  maxHeight: 28,
                  maxWidth: 28),
              iconSize: 24.0,
              padding: EdgeInsets.all(3.0),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:24 ,horizontal:24 ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextCustom(
                text: "Fatores desvalorizantes na região",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,

              ),
              Container(
                child: TextCustom(
                  text: "Há no entorno da unidade atividades e/ou características incompatíveis com o uso ou que possam provocar risco ou situação de insalubridade nas edificações, com consequente comprometimento do retorno da operação? Em caso afirmativo assinale abaixo:",
                  size: 16.0,
                  maxLines: 7,
                  color: PaletteColors.grey,
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.start,

                ),
              ),
              TextCustom(
                text: "Fatores Naturais",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,

              ),
              ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,



                children: [

                  ...natural.map(buildSingleCheckbox).toList(),
                ],
              ),
              InputRegister(controller: _controllerNatural,
                  hint: 'Especificar',
                  fonts: 14.0,
                  keyboardType: TextInputType.text,
                  width: width * 0.5,
                  sizeIcon: 0.0,
                  icons: Icons.height,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput),

              SizedBox(height: 12),

              ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,



                children: [

                  ...social.map(buildSingleCheckbox).toList(),
                ],
              ),
              InputRegister(controller: _controllerSocial,
                  hint: 'Especificar',
                  fonts: 14.0,
                  keyboardType: TextInputType.text,
                  width: width * 0.5,
                  sizeIcon: 0.0,
                  icons: Icons.height,
                  colorBorder: PaletteColors.greyInput,
                  background: PaletteColors.greyInput),
              Divider(thickness: 1),
              TextCustom(
            text: "Valor",
            size:14.0,
            color: PaletteColors.grey,
            fontWeight: FontWeight.bold,textAlign: TextAlign.left,),
              InputRegister(
          icons: Icons.height,
          sizeIcon: 0.0,
          width: width * 0.53,
          controller: _controllerPrice,
          hint: 'R\$000.000.00',
          fonts: 14.0,
          keyboardType: TextInputType.number,
          colorBorder: PaletteColors.greyInput,
          background: PaletteColors.greyInput,
        ),
              SizedBox(height: 6),
              TextCustom(
                text: "Observações",
                size: 16.0,
                color: PaletteColors.grey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.start,

              ),
              SizedBox(
                height: height * 0.16,
                width:  width * 0.9,
                child:
                InputRegister(controller: _controllerBlock,
                    hint: 'Nulla Lorem mollit cupidatat irure.\n Laborum magna \n nulla duis ullamco cillum dolor. \n Voluptate exercitation\n incididunt aliquip deserunt reprehenderit elit laborum. ',
                    fonts: 14.0,
                    keyboardType: TextInputType.text,
                    width: width * 0.5,
                    sizeIcon: 0.0,
                    icons: Icons.height,
                    colorBorder: PaletteColors.greyInput,
                    background: PaletteColors.greyInput),),




              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:12 ,horizontal:26.0 ),
                    child: ButtonCustom(
                      widthCustom: 0.3,
                      heightCustom: 0.055,
                      onPressed:() =>  Navigator.pop(context),
                      text: "Voltar",
                      size: 14.0,
                      colorButton: PaletteColors.white,
                      colorText: PaletteColors.primaryColor,
                      colorBorder: PaletteColors.primaryColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:12 ,horizontal:26.0 ),
                    child: ButtonCustom(
                      widthCustom: 0.3,
                      heightCustom: 0.055,
                      onPressed:() => Navigator.pushNamed(context, '/finished'),
                      text: "Concluir",
                      size: 14.0,
                      colorButton: PaletteColors.primaryColor,
                      colorText: PaletteColors.white,
                      colorBorder: PaletteColors.primaryColor,
                    ),
                  ),],
              )
            ],
          ),



        ),
      ),

    );
  }
  Widget buildSingleCheckbox(CheckBoxModel checkBoxModel)=> CheckboxListTile(
    title: TextCustom(text:checkBoxModel.title,
        color: PaletteColors.grey,
        fontWeight: FontWeight.normal,size: 16.0),
    value: checkBoxModel.value,
    onChanged: (value) => setState(() =>
    checkBoxModel.value = value!),
    activeColor: PaletteColors.primaryColor,
    checkColor: PaletteColors.white,
  );
}
