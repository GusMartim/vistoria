import 'package:shared_preferences/shared_preferences.dart';

class PrefService {

  Future createCacheContador(String contador) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('contador', contador);
  }

  Future readCacheContador(String contador) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString(contador);
    return cache;
  }

  Future removeCacheContador(String contador) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove('contador');
  }

  Future createCacheTipo(String tipo) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('tipo', tipo);
  }

  Future readCacheTipo(String tipo) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString('tipo');
    return cache;
  }
  Future createCacheNome(String nome) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('nome', nome);
  }

  Future readCacheNome(String nome) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString('nome');
    return cache;
  }
  Future createCacheIdUser(String idUser) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('idUser', idUser);
  }

  Future readCacheIdUser(String idUser) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString('idUser');
    return cache;
  }



  Future createCacheOrder(String Order) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('Order', Order);
  }

  Future readCacheOrder(String Order) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString('Order');
    return cache;
  }

  Future removeCacheOrder(String Order) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove('Order');
  }

  Future createCacheNSurvey(List<String> NSurvey) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setStringList('NSurvey',NSurvey);
  }
  Future readCacheNSurvey(String NSurvey) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getStringList('NSurvey');
    return cache;
  }
  Future removeCacheNSurvey(String NSurvey) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove('NSurvey');
  }
}
