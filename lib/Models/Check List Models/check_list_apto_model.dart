class AptoModel{
  String pavs = '';
  String elevators = '';
  String estimatedAge = '';
  String aptos = '';
  String unitys = '';
  String phone = '';
  String admin = '';
  String rooms = '';
  String socialbathrooms = '';
  String privatebathrooms = '';
  String lavs = '';
  String Telefone = '';
  String Contato = '';
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
  String condPrice = '';
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
  String PavType = '';
  String pathology = '';
  String unity = '';
  String subs = '';
  String blocks = '';
  String predio = '';
  String view = '';
  String divisaointerna = '';

  AptoModel();

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = {
      "contato"    : this.Contato,
      "divisaointerna"    : this.divisaointerna,
      "telefone"    : this.Telefone,
      "pavs": this.pavs,
      "predio": this.predio,
      "subs": this.subs,
      "blocks": this.blocks,
      "elevators"   : this.elevators,
      "estimatedAge"    : this.estimatedAge,
      "aptos"   : this.aptos,
      "unitys"   : this.unitys,
      "phone": this.phone,
      "admin": this.admin,
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
      "condprice"   : this.condPrice,
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
      "unity": this.unity,
      "view": this.view,
      "block": this.block,
      "TerrainArea" : this.TerrainArea,
      "ClosedArea"  : this.ClosedArea,
      "OpenArea"  : this.OpenArea,
      "TotalArea" : this.TotalArea,

      "Origin" : this.Origin,
      "Goal" : this.Goal,
      "PavType" : this.PavType,
      "Pathology" : this.pathology
    };
    return map;

  }


}
