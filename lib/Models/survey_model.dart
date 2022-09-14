import 'package:vistoria/Utils/exports.dart';

class SurveyModel{
  String idSurvey ='';
  String adress = '';
  String number = '';
  String complement = '';
  String district = '';
  String city = '';
  String state = '';
  String cep = '';
  String type = '';
  String latG = '';
  String latMin = '';
  String latSeg = '';
  String longG = '';
  String longMin = '';
  String longSeg = '';
  String hourRequest = '';
  String idUser = '';
  int  Nsurvey = 0;

  SurveyModel();

Map<String,dynamic> toMap(){
  Map<String,dynamic> map = {
    "hourRequest": this.hourRequest,
    "idUser"   : this.idUser,
    "idSurvey"  : this.idSurvey,
    "adress"    : this.adress,
    "number"   : this.number,
    "complement"   : this.complement,
    "district": this.district,
    "city": this.city,
    "state": this.state,
    "cep": this.cep,
    "type": this.type,
    "latG": this.latG,
    "latMin": this.latMin,
    "latSeg": this.latSeg,
    "longG": this.longG,
    "longMin": this.longMin,
    "longSeg": this.longSeg,
    "Nsurvey": this.Nsurvey,

  };
  return map;

  }

  SurveyModel.createId(){
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference create = db.collection("surveys");
  this.idSurvey = create.doc().id;
  }
}
