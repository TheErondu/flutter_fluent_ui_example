import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hermes/utils/colors.dart';
import 'package:hermes/utils/themes.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hermes/services/router.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  var userDataStore = await Hive.openBox('userdata');
  bool authCheck() {
    var token = userDataStore.get('access_token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }


  runApp(MaterialApp(
    color: bgroundColor,
    theme: hermesLight,
    darkTheme: hermesDark,
    debugShowCheckedModeBanner: false,
    initialRoute: authCheck() ? '/' : 'login',
    onGenerateRoute: router.generateRoute
  ));
}
