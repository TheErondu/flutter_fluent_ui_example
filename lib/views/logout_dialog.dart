import 'package:fluent_ui/fluent_ui.dart';
import 'package:hermes/views/dashboard.dart';

import '../utils/tools.dart';
import 'login.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  LogoutDialogState createState() => LogoutDialogState();
}

class LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: const Text('Do you really want logout?'),
      content: const Text('You will need to sign in to use the app next time.'),
      actions: [
        Button(
            child: const Text('yes'),
            onPressed: () {
              logout();
              Navigator.pushAndRemoveUntil(
                context,
                FluentPageRoute(builder: (context) => const LoginPage()),
                (Route<dynamic> route) => false,
              );
            }),
        Button(
            child: const Text('no'),
            onPressed: () {
              Navigator.push(
                context,
                FluentPageRoute(builder: (context) => const DashboardView()),
              );
            })
      ],
    );
  }
}
