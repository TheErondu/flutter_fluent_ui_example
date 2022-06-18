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

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

getFromStorage(String box, dynamic value) async {
  var myBox = await Hive.openBox(box);
    String data =  myBox.get(value);
  return data;
}
Future<void>saveToStorage(String box, String key, dynamic value) async {
  var myBox = await Hive.openBox(box);
   await myBox.put(key,value);

}
Future<void>deletefromStorage(String box, String key, dynamic value) async {
  var myBox = await Hive.openBox(box);
   await myBox.delete(key);

}
Future<void>saveAllToStorage(String box, Map<dynamic, dynamic> value) async {
  var myBox = await Hive.openBox(box);
   await myBox.putAll(value);

}
Future<void>deleteAllfromStorage(String box, Iterable<dynamic> value) async {
  var myBox = await Hive.openBox(box);
   await myBox.deleteAll(value);

}
