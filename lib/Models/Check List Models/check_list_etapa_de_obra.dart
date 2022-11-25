
class ConstructionModel{
  String services = '';
  String infra = '';
  String supra = '';
  String walls = '';
  String frames = '';
  String glasses = '';
  String ceiling = '';
  String waterproof = '';
  String intern = '';
  String linings = '';
  String extern = '';
  String paints= '';
  String floors = '';
  String finishes= '';
  String electric = '';
  String hidro = '';
  String sewer = '';
  String slabs = '';
  String complements = '';
  String others = '';
  String obs = '';
  ConstructionModel();

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map = {
      "services": this.services,
      "infra"   : this.infra,
      "supra"    : this.supra,
      "walls"   : this.walls,
      "frames"   : this.frames,
      "glasses": this.glasses,
      "ceiling": this.ceiling,
      "waterproof": this.waterproof,
      "intern": this.intern,
      "linings": this.linings,
      "extern": this.extern,
      "paints": this.paints,
      "floors": this.floors,
      "finishes": this.finishes,
      "electric": this.electric,
      "hidro": this.hidro,
      "sewer"    : this.sewer,
      "slabs"   : this.slabs,
      "complements"   : this.complements,
      "others" : this.others,
      "obs" : this.obs


    };
    return map;

  }


}
