class UserModel{
  String idUser ='';
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';


Map<String,dynamic> toMap(){
  Map<String,dynamic> map = {
    "idUser"  : this.idUser,
    "name"    : this.name,
    "email"   : this.email,
    "phone"   : this.phone,
    "password": this.password,
    "confirmPassword": this.confirmPassword,
  };
  return map;

  }
}
