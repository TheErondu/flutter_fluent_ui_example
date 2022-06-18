import 'package:fluent_ui/fluent_ui.dart';
import 'package:hermes/services/api.dart';
import 'package:hermes/utils/tools.dart';
import 'package:hermes/views/admin.dart';
import 'package:hermes/views/modules/logs/logs.dart';
import 'package:hermes/views/login.dart';
import 'package:hermes/views/lists/logs.dart';

import 'logout_dialog.dart';
import 'mesages.dart';
import 'modules/logs/logs_view.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      theme:
          ThemeData(brightness: Brightness.light, accentColor: Colors.blue),
      darkTheme:
          ThemeData(brightness: Brightness.dark, accentColor: Colors.blue),
      home: NavigationView(
        appBar: NavigationAppBar(
            actions: CommandBar(
              mainAxisAlignment: MainAxisAlignment.end,
              overflowBehavior: CommandBarOverflowBehavior.noWrap,
              compactBreakpointWidth: 768,
              primaryItems: [
                CommandBarButton(
                  icon: const Icon(FluentIcons.add),
                  label: const Text('Add'),
                  onPressed: () {},
                ),
                CommandBarButton(
                  icon: const Icon(FluentIcons.edit),
                  label: const Text('Edit'),
                  onPressed: () {},
                ),
              ],
              secondaryItems: [
                CommandBarButton(
                  icon: const Icon(FluentIcons.help),
                  label: const Text('About the App'),
                  onPressed: () {},
                ),
              ],
            ),
            title: Text(
                'Welcome to Hermes Workflow!, IP Address : $_connectionStatus')),
        pane: NavigationPane(
          selected: index,
          onChanged: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
          displayMode: PaneDisplayMode.top,
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
                icon: const Icon(FluentIcons.admin_a_logo32),
                title: const Text("Administration")),
             PaneItem(
                icon: const Icon(FluentIcons.report_document),
                title: const Text("Logs"))
          ],
          footerItems: [
            PaneItemSeparator(),
            PaneItem(
              icon: const Icon(FluentIcons.leave),
              title: const Text('Logout'),
            ),
          ],
          
        ),
        content: NavigationBody(
          index: index,
          children:  const [
            ScaffoldPage(
              header: Text(
                "Dashboard",
                style: TextStyle(fontSize: 60),
              ),
              content: Center(
                child: Text("Welcome to Dashboard Page!"),
              ),
            ),
            MessageView(),
            AdminView(),
            LogsView(),
            LogoutDialog(),
          ],
        ),
      ),
      
    );
  }
}
