import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hermes/views/dashboard.dart';
import 'package:hermes/views/login.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = Directory.current.path;
  Hive.init(path);

  var userDataStore = await Hive.openBox('userdata');
  bool authCheck() {
    var token = userDataStore.get('access_token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
  runApp(FluentApp(
    debugShowCheckedModeBanner: false,
    home: authCheck() ? const DashboardView() : const LoginPage(),
  ));
}
