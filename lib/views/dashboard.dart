
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hermes/services/api.dart';
import 'package:hermes/views/admin.dart';
import 'package:hermes/views/reports.dart';

import 'mesages.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  DashbordViewState createState() => DashbordViewState();
}

class DashbordViewState extends State<DashboardView> {
  dynamic _connectionStatus;
  int index = 0;

  @override
  void initState() {
    super.initState();
    getPublicIP().then((ip) {
      setState(() {
        _connectionStatus = ip;
      });
    });
    // loginCall(email,password).then((status) {
    //   setState(() {
    //     _connectionStatus = status;
    //   });
    //   toLog(status);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.blue,
          iconTheme: const IconThemeData(size: 30)),
      darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.blue,
          iconTheme: const IconThemeData(size: 30)),
      home: NavigationView(
        appBar: NavigationAppBar(
            title: Text(
                'Welcome to Hermes Workflow!, IP Address : $_connectionStatus')),
        pane: NavigationPane(
            selected: index,
            onChanged: (newIndex) {
              setState(() {
                index = newIndex;
              });
            },
            displayMode: PaneDisplayMode.auto,
            items: [
              PaneItem(
                  icon: const Icon(FluentIcons.go_to_dashboard),
                  title: const Text(
                    "Dashboard",
                  )),
              PaneItem(
                  icon: const Icon(FluentIcons.mail),
                  title: const Text("Messages")),
              PaneItem(
                  icon: const Icon(FluentIcons.report_library),
                  title: const Text("Reports")),
              PaneItem(
                  icon: const Icon(FluentIcons.admin_a_logo32),
                  title: const Text("Administration"))
            ]),
        content: NavigationBody(
          index: index,
          children:  [
            const ScaffoldPage(
              header: Text(
                "Dashboard",
                style: TextStyle(fontSize: 60),
              ),
              content: Center(
                child: Text("Welcome to Dashboard Page!"),
              ),
            ),
            const MessageView(),
            ReportView(),
            const AdminView(),
          ],
        ),
      ),
    );
  }
}
