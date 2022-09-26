class OrderModel{
  int order = 0;
  int Nsurvey = 0;




Map<String,dynamic> toMap(){
  Map<String,dynamic> map = {
    "order"  : this.order,
    "Nsurvey"  : this.Nsurvey,

  };
  return map;

  }
}
