import '../utils/exports.dart';

bool ErrorBoolModel(item,type){
  bool value;
  try {
    dynamic data = item.get(FieldPath([type]));
    value = data;
  } on StateError catch (e) {
    value = false;
  }
  return value;
}