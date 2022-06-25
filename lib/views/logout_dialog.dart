import 'package:flutter/material.dart';

import 'package:hermes/views/dashboard.dart';

import '../utils/functions.dart';
import 'login.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  LogoutDialogState createState() => LogoutDialogState();
}

class LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Do you really want logout?'),
      content: const Text('You will need to sign in to use the app next time.'),
      actions: [
        IconButton(
            icon: const Text('yes'),
            onPressed: () {
              logout();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const LoginPage()));
            }),
        IconButton(
            icon: const Text('no'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardView()),
              );
            })
      ],
    );
  }
}
