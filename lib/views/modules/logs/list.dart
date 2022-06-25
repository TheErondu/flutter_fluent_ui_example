import 'package:flutter/material.dart';
import 'package:hermes/controllers/crud_controller.dart';
import 'package:hermes/services/api.dart';
import 'package:hermes/utils/colors.dart';
import 'package:hermes/utils/functions.dart';

class LogsView extends StatefulWidget {
  const LogsView({Key? key}) : super(key: key);

  @override
  State<LogsView> createState() => _LogsViewState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _LogsViewState extends State<LogsView> with TickerProviderStateMixin {
  late String route = "directorlogs";
  late String headerText = "Test";
  late Future futureLogs;
  late TabController _tabController;
  late dynamic data;
  final logs = {
    "Director Logs": Icons.notes,
    "Video Editor Logs": Icons.notes,
    "OB Logs": Icons.notes,
    "MCR Logs": Icons.notes,
    "Production Show Logs": Icons.notes,
    "Graphics News Logs": Icons.notes
  };
  int currentIndex = 0;
  late String modelText;
  int isActiveWidget = 2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: logs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
        modelText = textToModel(logs.entries.elementAt(currentIndex).key);
        route = modelText;
        futureLogs = getModule(context, route);
      });
    });
    futureLogs = getModule(context, route);
  }

  @override
  Widget build(BuildContext context) {
    int mytabs = logs.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgroundColor,
        toolbarHeight: 0,
        bottom: TabBar(
            indicatorColor: primaryColor,
            isScrollable: true,
            controller: _tabController,
            tabs: List.generate(mytabs, (index) {
              String logTitle = logs.entries.elementAt(index).key;
              return Tab(icon: Text(logTitle));
            })),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          mytabs,
          (index) => FutureBuilder(
            future: futureLogs,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final listResponse = snapshot.data;
              final list = getJsonField(listResponse, r'''$''')?.toList() ?? [];
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(context, '/$route',
                            arguments: LogArguments(data, route));
                      },
                      child: Card(
                          color: getRandColor(),
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
                                    child: const Icon(Icons.notes)),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    right: 8, left: 8, bottom: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 8, left: 8),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        subtitle,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}

class LogArguments {
   dynamic data;
   String route;
  LogArguments(this.data, this.route);
}
