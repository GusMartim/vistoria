import '../Utils/exports.dart';

class SearchModelRegion{

  String _region="";

  SearchModelRegion.fromSnapshot(DocumentSnapshot snapshot):_region = snapshot['region'];

  SearchModelRegion.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    this.region = documentSnapshot["region"];
  }

  String get region => _region;

  set region(String value) {
    _region = value;
  }
}