class OrderModel{
  int order = 0;




Map<String,dynamic> toMap(){
  Map<String,dynamic> map = {
    "order"  : this.order,

  };
  return map;

  }
}
