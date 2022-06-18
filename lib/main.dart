import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hermes/utils/colors.dart';
import 'package:hermes/views/dashboard.dart';
import 'package:hermes/views/login.dart';
import 'package:hive/hive.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle('Hermes 1.0');
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setBackgroundColor(backgroundColor);
    await windowManager.setSize(const Size(755, 545));
    await windowManager.setMinimumSize(const Size(755, 545));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
    });
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

