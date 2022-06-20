import 'dart:developer';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:hermes/services/api.dart';
import 'package:hermes/utils/tools.dart';
import 'package:hermes/views/modules/logs/logs.dart';

import '../../../controllers/crud_controller.dart';
import '../../../utils/colors.dart';
import 'forms/create.dart';

class LogsView extends StatefulWidget {
  const LogsView({
    Key? key,
  }) : super(key: key);

  @override
  LogsViewState createState() => LogsViewState();
}

class LogsViewState extends State<LogsView> {
  late String route = "directorlogs";
  late String headerText = "Test";
  late Future futureLogs;

  final logs = {
    "Director Logs": FluentIcons.report_library,
    "Video Editor Logs": FluentIcons.report_library,
    "OB logs": FluentIcons.report_library,
    "MCR logs": FluentIcons.report_library,
    "Production Show logs": FluentIcons.report_library,
    "Graphics News logs": FluentIcons.report_library
  };

  int currentIndex = 0;
  late String modelText;
  int isActiveWidget=2;

  @override
  void initState() {
    super.initState();
    futureLogs = getModule(context,route);
  }

  @override
  Widget build(BuildContext context) {
    Typography typography = FluentTheme.of(context).typography;
    int tabs = logs.length;
    return isActiveWidget==1
        ? const AddlogForm()
        : ScaffoldPage(
            content: SizedBox.expand(
              child: TabView(
                wheelScroll: true,
                currentIndex: currentIndex,
                onChanged: (index) => refresh(index),
                tabs: List.generate(tabs, (index) {
                  String logTitle = logs.entries.elementAt(index).key;
                  return Tab(
                    icon: const Icon(FluentIcons.report_document),
                    closeIcon: null,
                    text: Text(logTitle),
                  );
                }),
                bodies: List.generate(
                  tabs,
                  (index) => FutureBuilder(
                    future: futureLogs,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: ProgressBar(),
                          ),
                        );
                      }
                      final listResponse = snapshot.data;
                      final list =
                          getJsonField(listResponse, r'''$''')?.toList() ?? [];
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 280,
                                  mainAxisExtent: 220,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          padding: const EdgeInsets.all(16),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            if (list.isEmpty) {
                              return const Center(
                                child: Text('No Content Here!'),
                              );
                            }
                            final data = list[index];
                            final item = getReportModel(data, route);
                            String title = item.title ?? "loading..";
                            String subtitle = item.comment ?? "loading..";
                            return Card(
                                backgroundColor: cardsBg,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(6),
                                          topRight: Radius.circular(6)),
                                      child: Container(
                                          width: double.infinity,
                                          height: 80,
                                          color: Colors.transparent,
                                          child: const Icon(
                                              FluentIcons.report_document)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          right: 8, left: 8, bottom: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              title,
                                              style: typography.subtitle
                                                  ?.apply(fontSizeFactor: 0.9),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          right: 8, left: 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              subtitle,
                                              style: typography.body
                                                  ?.apply(fontSizeFactor: 0.8),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                          });
                    },
                  ),
                ),
              ),
            ),
            bottomBar:isActiveWidget==2? CommandBar(
                mainAxisAlignment: MainAxisAlignment.end,
                overflowBehavior: CommandBarOverflowBehavior.dynamicOverflow,
                compactBreakpointWidth: 480,
                primaryItems: [
                  CommandBarButton(
                    icon: const Icon(FluentIcons.add),
                    label: const Text('Add'),
                    onPressed: () {
                      showActiveWidget("addForm");
                    },
                  ),
                  CommandBarButton(
                    icon: const Icon(FluentIcons.edit),
                    label: const Text('Edit'),
                    onPressed: () {},
                  ),
                  CommandBarButton(
                    icon: const Icon(FluentIcons.delete),
                    label: const Text('Delete'),
                    onPressed: () {},
                  ),
                ]):null,
          );
  }

  void refresh(int index) async {
    return setState(() {
      currentIndex = index;
      modelText = textToModel(logs.entries.elementAt(index).key);
      route = modelText;
      futureLogs = getModule(context,route);
      log(modelText);
    });
  }

  void showActiveWidget(dynamic widget) {
    switch (widget) {
      case "addForm":
        {
          return setState(() {
            isActiveWidget = 1;
          });
        }

      case "logsIndex":
        {
          return setState(() {
            isActiveWidget = 2;
          });
        }
      case "editForm":
        {
          return setState(() {
            isActiveWidget = 3;
          });
        }

      default:
        {
          return setState(() {
            isActiveWidget = 0;
          });
        }
    }
  }
}
