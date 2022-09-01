class InputsModel{

  String age = '';
  String price = '';
  String obs = '';



  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = {

      "age"    : this.age,
      "price"   : this.price,
      "obs"   : this.obs,

    };
    return map;

  }
}