import 'package:sfindit/common/pref.dart';

getPrefValue(String key) {
  return Pref.getString(key, "");
}

String getToken(String key) {
  return "Bearer " + Pref.getString(key, "");
}

setPrefValue(key, value) {
  Pref.setString(key, value);
}
