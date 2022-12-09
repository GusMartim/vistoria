import 'package:url_launcher/url_launcher.dart';
import 'package:vistoria/Utils/exports.dart';
import 'package:vistoria/Widgets/inputRegister.dart';
import 'package:vistoria/Widgets/text_custom.dart';

class ConstructionStep extends StatefulWidget {
  final String idSurvey;
  ConstructionStep({required this.idSurvey}) ;

  @override
  State<ConstructionStep> createState() => _ConstructionStepState();
}

class _ConstructionStepState extends State<ConstructionStep> {

  int nServices = 0;
  String SServices = '0';
  int nInfra = 0;
  String SInfra = '0';
  int nSupra = 0;
  String SSupra = '0';
  int nWalls = 0;
  String SWalls = '0';
  int nFrames = 0;
  String SFrames = '0';
  int nGlasses = 0;
  String SGlasses = '0';
  int nCeiling = 0;
  String SCeiling = '0';
  int nWaterProof = 0;
  String SWaterProof = '0';
  int nIntern = 0;
  String SIntern = '0';
  int nLinings = 0;
  String SLinings = '0';
  int nExtern = 0;
  String SExtern = '0';
  int nPaint = 0;
  String SPaint = '0';
  int nFloors = 0;
  String SFloors = '0';
  int nFinishes = 0;
  String SFinishes = '0';
  int nEletric = 0;
  String SEletric = '0';
  int nHidro = 0;
  String SHidro = '0';
  int nSewer = 0;
  String SSewer = '0';
  int nSlabs = 0;
  String SSlabs = '0';
  int nComplements = 0;
  String SComplements = '0';
  int nOthers = 0;
  String SOthers = '0';
  TextEditingController _controllerObs = TextEditingController();
  TextEditingController _controllerContato = TextEditingController();
  TextEditingController _controllerTelefoneContato = TextEditingController();
  File? picture;

  String _urlPhoto = '';
  String selectedText = 'Imagens';
  FirebaseStorage storage = FirebaseStorage.instance;
  final Map<String, dynamic> data = HashMap();


  List<XFile>? imageFileList = [];
  Future selectImages() async{
    int i = 0;
    final List<XFile>? selectedImages = await ImagePicker().pickMultiImage(imageQuality: 30);
    if(selectedImages!.isNotEmpty){
      imageFileList!.addAll(selectedImages);
    }
    setState(() {
      Navigator.of(context).pop();

    });
    for (int i = 0; i <imageFileList!.length; i++) {
      _uploadImages(imageFileList![i]);
    }
  }
  Future<void> _uploadImages(XFile file) async{
    print('chegou');
    int i = 0;
    Uint8List archive = await file.readAsBytes();
    if(archive!.isNotEmpty){
      Reference pastaRaiz = storage.ref();
      Reference arquivo = pastaRaiz
          .child("surveys")
          .child(selectedText + "_" + DateTime.now().toString() + ".jpg");
      await arquivo.putData(archive,SettableMetadata(contentType:'application/octet-stream')).then((upload) async {
        upload.ref.getDownloadURL().then((value) {
          Map<String, dynamic> dateUpdate = {
            'photoUrl': FieldValue.arrayUnion([value.toString()]),
            'idSurvey': widget.idSurvey
          };
          db
              .collection("surveys")
              .doc(widget.idSurvey)
              .set(dateUpdate, SetOptions(merge: true));
        });
      });


    }

  }
  Future _savePhotoCamera() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 30);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.picture = imageTemporary;
        setState(() {

          Navigator.of(context).pop();
        });
        _uploadImage();
      });
    } on PlatformException catch (e) {
      print('Error : $e');
    }
  }
  Future _uploadImage() async {
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz
        .child("surveys")
        .child(selectedText + "_" + DateTime.now().toString() + ".jpg");

    await arquivo.putFile(picture!,SettableMetadata(contentType:'application/octet-stream')).then((value) async{
      value.ref.getDownloadURL().then((value) {
        setState(() {
          _urlPhoto = value;
        });
        _urlImageFirestore(value);

      });


    }


    );




  }
  _urlImageFirestore(String url){

    Map<String , dynamic> dateUpdate = {
      'photoUrl' : FieldValue.arrayUnion([url]),
      'idSurvey': widget.idSurvey
    };
    db
        .collection("surveys")
        .doc(widget.idSurvey)
        .set(dateUpdate,SetOptions(merge: true))
        .then((value) {
      setState(() {

      });
    });

  }

  _saveConstruction(ConstructionModel constructionModel) async{
    db
        .collection('surveys')
        .doc(widget.idSurvey)
        .update(constructionModel.toMap())
        .then((_) => Navigator.pushNamed(context, '/finishedObra',arguments: widget.idSurvey));
  }
  _tableConstruction() async{
    _constructionModel.services = SServices;
    _constructionModel.infra = SInfra;
    _constructionModel.Contato = _controllerContato.text;
    _constructionModel.Telefone = _controllerTelefoneContato.text;
    _constructionModel.supra = SSupra;
    _constructionModel.walls = SWalls;
    _constructionModel.frames = SFrames;
    _constructionModel.glasses = SGlasses;
    _constructionModel.ceiling = SCeiling;
    _constructionModel.waterproof = SWaterProof;
    _constructionModel.intern = SIntern;
    _constructionModel.linings = SLinings;
    _constructionModel.extern = SExtern;
    _constructionModel.paints = SPaint;
    _constructionModel.floors = SFloors;
    _constructionModel.finishes = SFinishes;
    _constructionModel.electric = SEletric;
    _constructionModel.hidro = SHidro;
    _constructionModel.sewer = SSewer;
    _constructionModel.slabs = SSlabs;
    _constructionModel.complements = SComplements;
    _constructionModel.others = SOthers;
    _constructionModel.obs = _controllerObs.text;

    _saveConstruction(_constructionModel);

  }

  ConstructionModel _constructionModel = ConstructionModel();
  FirebaseFirestore db = FirebaseFirestore.instance;

  int order = 0;
  int nsurvey=0;
  String title = '';
  _getData() async{
    DocumentSnapshot snapshot =
    await db.collection("surveys").doc(widget.idSurvey).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      SServices = data?["services"]??'';
      SInfra = data?["infra"]??'';
      SSupra = data?["supra"]??'';
      SWalls = data?["walls"]??'';
      SFrames = data?["frames"]??'';
      SGlasses = data?["glasses"]??'';
      SCeiling = data?["ceiling"]??'';
      SWaterProof = data?["waterproof"]??'';
      SIntern = data?["intern"]??'';
      SLinings = data?["linings"]??'';
      SExtern = data?["extern"]??'';
      SPaint = data?["paints"]??'';
      SFloors = data?["floors"]??'';
      SFinishes = data?["finishes"]??'';
      SEletric = data?["electric"]??'';
      SHidro = data?["hidro"]??'';
      SSewer = data?["sewer"]??'';
      SSlabs = data?["slabs"]??'';
      SComplements = data?["complements"]??'';
      SOthers = data?["others"]??'';
      _controllerObs = TextEditingController(text: data?["obs"]??'');
      _controllerContato = TextEditingController(text: data?["contato"]??'');
      _controllerTelefoneContato = TextEditingController(text: data?["telefone"]??'');

    });
  }
  getOrder()async{
    DocumentSnapshot snapshot = await db
        .collection('surveyNumber')
        .doc('surveyNumber')
        .get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      order = data?["surveyNumber"] ?? 0;
      title = '${order + 1}';

    });

  }
  getNSurvey()async{
    DocumentSnapshot snapshot = await db
        .collection('surveys')
        .doc(widget.idSurvey)
        .get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    setState(() {
      nsurvey = data?["Nsurvey"] ?? 0;
    });
    if(nsurvey== 0){
      getOrder();
    }else{
      setState(() {

        title = '$nsurvey';
      });

    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNSurvey();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: PaletteColors.white,
        appBar: AppBar(
          backgroundColor: PaletteColors.bgColor,
          iconTheme: IconThemeData(
            color: PaletteColors.white,
          ),
          elevation: 0,
          title: TextCustom(
            text: 'Vistoria Nª ${title}',
            size: 20.0,
            color: PaletteColors.white,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Ink(
              decoration: ShapeDecoration(
                color: PaletteColors.white,
                shape: CircleBorder(),
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: PaletteColors.primaryColor,
                  ),
                  constraints: BoxConstraints(
                      minHeight: 28, minWidth: 28, maxHeight: 28, maxWidth: 28),
                  iconSize: 24.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(0.0),
                  onPressed: () => AlertModel().alert(
                      'Selecionar foto  da:',
                      '',
                      PaletteColors.primaryColor,
                      PaletteColors.primaryColor,
                      context, [
                    Row(
                      children: [
                        SizedBox(width: width * 0.03),
                        Container(
                          width: width * 0.65,
                          child: ButtonCustom(
                            widthCustom: 0.65,
                            heightCustom: 0.095,
                            onPressed: () => _savePhotoCamera(),
                            text: "Câmera",
                            size: 20.0,
                            colorButton: PaletteColors.primaryColor,
                            colorText: PaletteColors.white,
                            colorBorder: PaletteColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.055),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 75.0),
                      child: Row(
                        children: [
                          SizedBox(width: width * 0.03),
                          Container(
                            width: width * 0.65,
                            child: ButtonCustom(
                              widthCustom: 0.65,
                              heightCustom: 0.095,
                              onPressed: () => selectImages(),
                              text: "Galeria",
                              size: 20.0,
                              colorButton: PaletteColors.primaryColor,
                              colorText: PaletteColors.white,
                              colorBorder: PaletteColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
            ),
            SizedBox(width: width * 0.01),
            Ink(
              decoration: ShapeDecoration(
                color: PaletteColors.white,
                shape: CircleBorder(),
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: PaletteColors.primaryColor,
                  ),
                  constraints: BoxConstraints(
                      minHeight: 28, minWidth: 28, maxHeight: 28, maxWidth: 28),
                  iconSize: 24.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(0.0),
                  onPressed: ()async{
                    if(_controllerTelefoneContato.text.isNotEmpty){

                      var splitted = _controllerTelefoneContato.text.replaceAll('-','').replaceAll('(','').replaceAll(')','').trim();
                      var url ="tel:+55$splitted";
                      await launchUrl(Uri.parse(url));
                    }else{
                      showSnackBar(context, 'Preencha o campo Telefone',Colors.red);
                    }
                  }

              ),
            ),
            SizedBox(width: width * 0.03),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: width * 0.5,
                      child: TextCustom(
                        text: "Contato",
                        size: 14.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
                Row(children: [
                  Container(
                    child: InputRegister(
                      icons: Icons.height,
                      sizeIcon: 0.0,
                      width: width * 0.75,
                      controller: _controllerContato,
                      hint: "",
                      fonts: 14.0,
                      keyboardType: TextInputType.text,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),

                ]),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: TextCustom(
                          text: "Telefone",
                          size: 14.0,
                          color: PaletteColors.grey,
                          fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
                Row(children: [
                  Container(
                    child: InputRegister(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                      icons: Icons.height,
                      sizeIcon: 0.0,
                      width: width * 0.4,
                      controller: _controllerTelefoneContato,
                      hint: '',
                      fonts: 14.0,
                      keyboardType: TextInputType.number,
                      colorBorder: PaletteColors.greyInput,
                      background: PaletteColors.greyInput,
                    ),
                  ),
                ]),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    TextCustom(
                      text: "Serviços",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    TextCustom(
                      text: "%",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(width: width * 0.12),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: TextCustom(
                        text: "Serviços Preliminares e Gerais",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nServices > 0) {
                              nServices = nServices - 5;
                              SServices = "$nServices";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SServices,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )
                    ),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nServices >= 0 && nServices <= 75) {
                              nServices = nServices + 25;
                              SServices = "$nServices";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    TextCustom(
                      text: "Infraestrutura",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nInfra > 0) {
                              nInfra = nInfra - 5;
                              SInfra = "$nInfra";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SInfra,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nInfra >= 0 && nInfra <= 75) {
                              nInfra = nInfra + 25;

                              SInfra = "$nInfra";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    TextCustom(
                      text: "Supra-estrutura",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nSupra > 0) {
                              nSupra = nSupra - 5;
                              SSupra = "$nSupra";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SSupra,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nSupra >= 0 && nSupra  <= 75) {
                              nSupra = nSupra + 25;
                              SSupra = "$nSupra";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    TextCustom(
                      text: "Paredes e painéis",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nWalls > 0) {
                              nWalls = nWalls - 5;
                              SWalls = '$nWalls';
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SWalls,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nWalls >= 0 && nWalls <= 75) {
                              nWalls = nWalls + 25;
                              SWalls = '$nWalls';
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    TextCustom(
                      text: "Esquadrias",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nFrames > 0) {
                              nFrames = nFrames - 5;
                              SFrames = "$nFrames";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SFrames,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nFrames >= 0 && nFrames  <= 75) {
                              nFrames = nFrames + 25;
                              SFrames = '$nFrames';
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    TextCustom(
                      text: "Vidros e plásticos",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nGlasses > 0) {
                              nGlasses = nGlasses - 5;
                              SGlasses = "$nGlasses";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SGlasses,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nGlasses >= 0 && nGlasses  <= 75) {
                              nGlasses = nGlasses + 25;
                              SGlasses = "$nGlasses";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(

                      child: TextCustom(
                        text: "Coberturas",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nCeiling > 0) {
                              nCeiling = nCeiling - 5;
                              SCeiling = "$nCeiling";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SCeiling,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nCeiling >= 0 && nCeiling  <= 75) {
                              nCeiling = nCeiling + 25;
                              SCeiling = "$nCeiling";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    TextCustom(
                      text: "Impermeabilizações",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nWaterProof > 0) {
                              nWaterProof = nWaterProof - 5;
                              SWaterProof = "$nWaterProof";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SWaterProof,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nWaterProof >= 0 && nWaterProof <= 75) {
                              nWaterProof = nWaterProof + 25;
                              SWaterProof = "$nWaterProof";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: TextCustom(
                        text: "Revestimentos Internos",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),

                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nIntern > 0) {
                              nIntern = nIntern - 5;
                              SIntern = "$nIntern";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SIntern,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nIntern >= 0 && nIntern <= 75) {
                              nIntern = nIntern + 25;
                              SIntern = "$nIntern";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(

                      child: TextCustom(
                        text: "Forros",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nLinings > 0) {
                              nLinings = nLinings - 5;
                              SLinings = "$nLinings";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SLinings,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nLinings >= 0 && nLinings <= 75) {
                              nLinings = nLinings + 25;
                              SLinings = "$nLinings";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: TextCustom(
                        text: "Revestimentos externos",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nExtern > 0) {
                              nExtern =
                                  nExtern - 5;
                              SExtern =
                              "$nExtern";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SExtern,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nExtern >= 0 && nExtern <= 75) {
                              nExtern =
                                  nExtern + 25;
                              SExtern =
                              "$nExtern";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: TextCustom(
                        text: "Pintura",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nPaint > 0) {
                              nPaint = nPaint - 5;
                              SPaint = "$nPaint";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SPaint,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nPaint >= 0 && nPaint  <= 75) {
                              nPaint = nPaint + 25;
                              SPaint = "$nPaint";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    TextCustom(
                      text: "Pisos",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nFloors > 0) {
                              nFloors = nFloors - 5;
                              SFloors = "$nFloors";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SFloors,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nFloors >= 0 && nFloors <= 75) {
                              nFloors = nFloors + 25;
                              SFloors = "$nFloors";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    TextCustom(
                      text: "Acabamentos",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.normal,
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nFinishes > 0) {
                              nFinishes = nFinishes - 5;
                              SFinishes = "$nFinishes";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SFinishes,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nFinishes >= 0 && nFinishes <= 75) {
                              nFinishes = nFinishes + 25;
                              SFinishes = "$nFinishes";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: TextCustom(
                        text: "Inst. elétricas e telefônicas",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nEletric > 0) {
                              nEletric = nEletric - 5;
                              SEletric = "$nEletric";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SEletric,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nEletric >= 0 && nEletric <= 75) {
                              nEletric = nEletric + 25;
                              SEletric = "$nEletric";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: TextCustom(
                        text: "Inst. hidráulicas",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nHidro > 0) {
                              nHidro = nHidro - 5;
                              SHidro = "$nHidro";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SHidro,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nHidro >= 0 && nHidro <= 75) {
                              nHidro = nHidro + 25;
                              SHidro = "$nHidro";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      child: TextCustom(
                        text: "Inst. esgoto e águas pluviais",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nSewer > 0) {
                              nSewer = nSewer - 5;
                              SSewer = "$nSewer";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SSewer,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nSewer >= 0 && nSewer <= 75) {
                              nSewer = nSewer + 25;
                              SSewer = "$nSewer";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(

                      child: TextCustom(
                        text: "Louças e metais",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nSlabs > 0) {
                              nSlabs = nSlabs - 5;
                              SSlabs = "$nSlabs";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SSlabs,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nSlabs >= 0 && nSlabs <= 75) {
                              nSlabs = nSlabs + 25;
                              SSlabs = "$nSlabs";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(

                      child: TextCustom(
                        text: "Complementos",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nComplements > 0) {
                              nComplements = nComplements - 5;
                              SComplements = "$nComplements";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SComplements,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nComplements >= 0 && nComplements <= 75) {
                              nComplements = nComplements + 25;
                              SComplements = "$nComplements";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Container(

                      child: TextCustom(
                        text: "Outros serviços",
                        size: 16.0,
                        color: PaletteColors.grey,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Spacer(),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nOthers > 0) {
                              nOthers = nOthers - 5;
                              SOthers = "$nOthers";
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: width * 0.12,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0)),
                        child: TextCustom(
                          text: SOthers,
                          color: PaletteColors.grey,
                          textAlign: TextAlign.center,
                        )),
                    Ink(
                      decoration: ShapeDecoration(
                        color: PaletteColors.midGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: PaletteColors.grey,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 28,
                            minWidth: 28,
                            maxHeight: 28,
                            maxWidth: 28),
                        iconSize: 16.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            if (nOthers >= 0 &&  nOthers <= 75) {
                              nOthers = nOthers + 25;
                              SOthers = "$nOthers";
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCustom(
                      text: "Observações:",
                      size: 16.0,
                      color: PaletteColors.grey,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    Container(
                      width: width * 0.9,
                      height: height * 0.2,
                      child: InputRegister(
                          controller: _controllerObs,
                          hint: ' ',
                          fonts: 14.0,
                          keyboardType: TextInputType.text,
                          width: width * 0.9,
                          sizeIcon: 0.0,
                          icons: Icons.height,
                          colorBorder: PaletteColors.greyInput,
                          background: PaletteColors.greyInput),
                    ),
                    SizedBox(height: height * 0.1),
                  ],
                ),
                Divider(
                    thickness: 1.0
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.35,
                      child: ButtonCustom(
                        widthCustom: 0.3,
                        heightCustom: 0.070,
                        onPressed: () =>

                            Navigator.pop(context),
                        text: "Voltar",
                        size: 14.0,
                        colorButton: PaletteColors.white,
                        colorText: PaletteColors.primaryColor,
                        colorBorder: PaletteColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: width * 0.15),
                    Container(
                      width: width * 0.35,
                      child: ButtonCustom(
                        widthCustom: 0.3,
                        heightCustom: 0.070,
                        onPressed: () => _tableConstruction(),
                        text: "Concluir",
                        size: 14.0,
                        colorButton: PaletteColors.primaryColor,
                        colorText: PaletteColors.white,
                        colorBorder: PaletteColors.primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

  Widget buildSingleCheckbox(CheckBoxModel checkBoxModel) => CheckboxListTile(
    title: TextCustom(
        text: checkBoxModel.title,
        color: PaletteColors.grey,
        fontWeight: FontWeight.normal,
        size: 16.0),
    value: checkBoxModel.value,
    onChanged: (value) => setState(() => checkBoxModel.value = value!),
    activeColor: PaletteColors.primaryColor,
    checkColor: PaletteColors.white,
  );
}