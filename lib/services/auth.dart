import 'dart:convert';

import 'package:hive/hive.dart';

class Auth {
  Future<void> setCredentials(data) async {
    var box = await Hive.openBox('userdata');
    // var id = Credentials().userId;
    // var name = Credentials().name;
    // var email = Credentials().email;
    // var token = Credentials().accessToken;

    // box.put('id', id);
    // box.put('name', name);
    // var user = User().name;
    Map userMap = jsonDecode(data);
    box.putAll(userMap);
  }

  // Future<String> getCredentials() async {
  //   var box = await Hive.openBox('userdata');
  //   var name = box.get('name');
  //   return name;
  // }
}
