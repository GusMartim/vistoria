import '../Utils/exports.dart';

class SearchModelAdress{

  String _adress="";

  SearchModelAdress.fromSnapshot(DocumentSnapshot snapshot):_adress = snapshot['adress'];

  SearchModelAdress.fromDocumentSnapshot(DocumentSnapshot documentSnapshot){
    this.adress = documentSnapshot["adress"];
  }

  String get adress => _adress;

  set adress(String value) {
    _adress = value;
  }
}