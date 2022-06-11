import 'package:hive/hive.dart';
import 'package:json_path/json_path.dart';

dynamic getJsonField(dynamic response, String jsonPath) {
  final field = JsonPath(jsonPath).read(response);
  return field.isNotEmpty
      ? field.length > 1
          ? field.map((f) => f.value).toList()
          : field.first.value
      : null;
}

Future<bool> authCheck() async {
  var userDataStore = await Hive.openBox('userdata');
  var token = userDataStore.get('access_token');
  if (token != null) {
    return true;
  } else {
    return false;
  }
}

Future<void> logout() async {
  var userDataStore = await Hive.openBox('userdata');
  userDataStore.delete('access_token');
}
