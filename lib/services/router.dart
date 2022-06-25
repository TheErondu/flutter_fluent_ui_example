import 'package:flutter/material.dart';
import 'package:hermes/views/dashboard.dart';
import 'package:hermes/views/login.dart';
import 'package:hermes/views/modules/logs/directorlogs/views/show.dart';
import 'package:hermes/views/modules/logs/list.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (BuildContext context) {
        return const DashboardView();
      },
      settings: settings
      );
    case '/login':
      return MaterialPageRoute(builder: (BuildContext context) {
        return const LoginPage();
      },
      settings: settings
      );

    case '/logs':
       return MaterialPageRoute(builder: (BuildContext context) {
        return const LogsView();
      },
      settings: settings
      );
    case '/directorlogs':
       return MaterialPageRoute(builder: (BuildContext context) {
        return const ShowDirectorLogView();
      },
      settings: settings
      );
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return const DashboardView();
      },
      settings: settings
      );
  }
}
