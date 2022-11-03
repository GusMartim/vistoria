class OrderModel{
  int order = 0;
  int Nsurvey = 0;
  String status= '';




Map<String,dynamic> toMap(){
  Map<String,dynamic> map = {
    "order"  : this.order,
    "Nsurvey"  : this.Nsurvey,
    "status"  : this.status,

  };
  return map;

  }
}
