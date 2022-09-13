
class LoteModel{



  String obs = '';
  String type = '';
  String shape = '';
  String situation = '';
  String topography = '';
  String terrainClosing = '';
  String localization = '';
  String use = '';
  String pattern = '';
  String rating = '';
  String density = '';
  String transport = '';
  String TerrainArea = '';
  String Price = '';
  String factors = '';



  LoteModel();

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = {
      "obs"   : this.obs,
      "factors"   : this.factors,
      "price"   : this.Price,
      "type": this.type,
      "shape"   : this.shape,
      "situation"    : this.situation,
      "topography"   : this.topography,
      "terrainClosing"   : this.terrainClosing,
      "localization": this.localization,
      "use": this.use,
      "pattern": this.pattern,
      "rating": this.rating,
      "density": this.density,
      "transport": this.transport,
      "TerrainArea" : this.TerrainArea,
    };
    return map;

  }


}
