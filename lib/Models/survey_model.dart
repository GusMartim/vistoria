import 'package:vistoria/Utils/exports.dart';

class SurveyModel{
  String idSurvey ='';
  String adress = '';
  String number = '';
  String complement = '';
  String district = '';
  String city = '';
  String estado = '';
  String cep = '';
  String typesurvey = '';
  String latG = '';
  String lat = '';
  String latMin = '';
  String latSeg = '';
  String longG = '';
  String lng = '';
  String longMin = '';
  String longSeg = '';
  String hourRequest = '';
  String idUser = '';
  String userCode ='';
  String status ='';



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
    "estado": this.estado,
    "cep": this.cep,
    "typesurvey": this.typesurvey,
    "latG": this.latG,
    "latMin": this.latMin,
    "latSeg": this.latSeg,
    "longG": this.longG,
    "longMin": this.longMin,
    "longSeg": this.longSeg,
    "userCode" : this.userCode,
    "status" : this.status
  };
  return map;

  }

  SurveyModel.createId(){
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference create = db.collection("surveys");
  this.idSurvey = create.doc().id;
  }
}
