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
  String lat = '';
  String lng = '';

  String hourRequest = '';
  String idUser = '';
  String? userName = '';
  String userCode ='';
  String status ='';



  SurveyModel();

Map<String,dynamic> toMap(){
  Map<String,dynamic> map = {
    "hourRequest": this.hourRequest,
    "idUser"   : this.idUser,
    "userName"   : this.userName,
    "idSurvey"  : this.idSurvey,
    "adress"    : this.adress,
    "number"   : this.number,
    "complement"   : this.complement,
    "district": this.district,
    "city": this.city,
    "estado": this.estado,
    "cep": this.cep,
    "typesurvey": this.typesurvey,
    "lat": this.lat,
    "lng": this.lng,
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
