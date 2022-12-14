class UserModel{
  String idUser ='';
  String userType ='';
  String doc = '';
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  String region = '';
  String category = '';
  bool status = false;

Map<String,dynamic> toMap(){
  Map<String,dynamic> map = {
    "idUser"  : this.idUser,
    "userType"  : this.userType,
    "doc"  : this.doc,
    "name"    : this.name,
    "email"   : this.email,
    "phone"   : this.phone,
    "password": this.password,
    "confirmPassword": this.confirmPassword,
    "region": this.region,
    "category": this.category,
    "status" : this.status,
  };
  return map;

  }
}
