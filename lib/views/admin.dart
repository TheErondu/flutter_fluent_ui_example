import 'package:fluent_ui/fluent_ui.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  AdminViewState createState() => AdminViewState();
}

class AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: Text(
        "Administration",
        style: TextStyle(fontSize: 60),
      ),
      content: Center(
        child: Text("No Admin Settings Configured!"),
      ),
    );
  }
}
