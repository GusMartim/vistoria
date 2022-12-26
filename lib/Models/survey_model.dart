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
  String idUser = '';
  String? userName = '';
  String userCode ='';
  String status ='';
  String pdf ='';
  int nsurvey= 0;



  SurveyModel();

Map<String,dynamic> toMap(){
  Map<String,dynamic> map = {
    "hourRequest": DateTime.now(),
    "savedPdf": this.pdf,
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
    "status" : this.status,
    "Nsurvey":this.nsurvey,
  };
  return map;

  }

  SurveyModel.createId(){
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference create = db.collection("surveys");
  this.idSurvey = create.doc().id;
  }
}
