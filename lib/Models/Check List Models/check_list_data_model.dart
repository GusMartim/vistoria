
class DataModel{
  String rooms = '';
  String socialbathrooms = '';
  String privatebathrooms = '';
  String lavs = '';
  String servicebathrooms = '';
  String maidrooms = '';
  String balconys = '';
  String completecontainers = '';
  String kitchens = '';
  String restrooms = '';
  String servicearearoofed = '';
  String serviceareaunroofed= '';
  String garageroofed = '';
  String garageunroofed= '';
  String acs = '';
  String pools = '';
  String age = '';
  String price = '';
  String obs = '';
  String infra = '';
  String situation = '';
  String quota = '';
  String unPosition = '';
  String roof = '';
  String wall = '';
  String internPaint = '';
  String windowns= '';
  String externPaint = '';
  String pattern = '';
  String state = '';
  String TerrainArea = '';
  String ClosedArea = '';
  String OpenArea = '';
  String TotalArea =  '';
  String Origin = '';
  String Goal = '';
  String phone = '';
  String completeAdress = '';
  String contact = '';
  String divisaointerna = '';
  DataModel();

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = {
      "divisaointerna": this.divisaointerna,
      "rooms": this.rooms,
      "socialbathrooms"   : this.socialbathrooms,
      "privatebathrooms"    : this.privatebathrooms,
      "lavs"   : this.lavs,
      "servicebathrooms"   : this.servicebathrooms,
      "maidrooms": this.maidrooms,
      "balconys": this.balconys,
      "completecontainers": this.completecontainers,
      "kitchens": this.kitchens,
      "restrooms": this.restrooms,
      "servicearearoofed": this.servicearearoofed,
      "serviceareaunroofed": this.serviceareaunroofed,
      "garageroofed": this.garageroofed,
      "garageunroofed": this.garageunroofed,
      "acs": this.acs,
      "pools": this.pools,
      "age"    : this.age,
      "price"   : this.price,
      "obs"   : this.obs,
      "infra"   : this.infra,
      "situation"    : this.situation,
      "quota"   : this.quota,
      "unPosition"   : this.unPosition,
      "roof": this.roof,
      "wall": this.wall,
      "internPaint": this.internPaint,
      "windowns": this.windowns,
      "externPaint": this.externPaint,
      "pattern": this.pattern,
      "state": this.state,
      "TerrainArea" : this.TerrainArea,
      "ClosedArea"  : this.ClosedArea,
      "OpenArea"  : this.OpenArea,
      "TotalArea" : this.TotalArea,
      "Origin" : this.Origin,
      "Goal" : this.Goal,
      "telefone" : this.phone,
      "completeAdress" : this.completeAdress,
      "contato" : this.contact,

    };
    return map;

  }


}
