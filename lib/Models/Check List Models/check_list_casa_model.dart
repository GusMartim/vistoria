
class UnityModel{
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
  String type = '';
  String infra = '';
  String situation = '';
  String quota = '';
  String unPosition = '';
  String roof = '';
  String wall = '';
  String internPaint = '';
  String externDoors = '';
  String floor = '';
  String internDoors = '';
  String windowns= '';
  String externPaint = '';
  String balcony= '';
  String switchboard = '';
  String kitchen = '';
  String bathroom = '';
  String tank = '';
  String pattern = '';
  String state = '';
  String unRoof = '';
  String block = '';
  String TerrainArea = '';
  String ClosedArea = '';
  String OpenArea = '';
  String TotalArea =  '';
  String Origin = '';
  String Goal = '';
  String pathology = '';
  UnityModel();

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = {
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
      "type": this.type,
      "infra"   : this.infra,
      "situation"    : this.situation,
      "quota"   : this.quota,
      "unPosition"   : this.unPosition,
      "roof": this.roof,
      "wall": this.wall,
      "internPaint": this.internPaint,
      "externDoors": this.externDoors,
      "floor": this.floor,
      "internDoors": this.internDoors,
      "windowns": this.windowns,
      "externPaint": this.externPaint,
      "balcony": this.balcony,
      "switchboard": this.switchboard,
      "kitchen": this.kitchen,
      "bathroom": this.bathroom,
      "tank": this.tank,
      "pattern": this.pattern,
      "state": this.state,
      "unRoof": this.unRoof,
      "block": this.block,
      "TerrainArea" : this.TerrainArea,
      "ClosedArea"  : this.ClosedArea,
      "OpenArea"  : this.OpenArea,
      "TotalArea" : this.TotalArea,
      "Origin" : this.Origin,
      "Goal" : this.Goal,
      "Pathology" : this.pathology
    };
    return map;

  }


}
