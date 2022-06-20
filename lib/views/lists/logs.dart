import 'package:fluent_ui/fluent_ui.dart';
import 'package:hermes/services/api.dart';
import 'package:hermes/utils/colors.dart';
import '../../controllers/crud_controller.dart';
import '../../utils/tools.dart';

class ListViewWidget extends StatefulWidget {
  final String model;
  final String headerText;
  const ListViewWidget(
      {Key? key, required this.model, required this.headerText})
      : super(key: key);
  @override
  ListViewWidgetState createState() => ListViewWidgetState();
}

class ListViewWidgetState extends State<ListViewWidget> {
  late String route = widget.model;
  late String headerText = widget.headerText;
  late final _futureList = getModule(context,route);
  String filterText = '';
  @override
  Widget build(BuildContext context) {
    Typography typography = FluentTheme.of(context).typography;
    return ScaffoldPage(
      header: PageHeader(
        title: Text(headerText),
        commandBar: SizedBox(
          width: 240.0,
          child: Tooltip(
            message: 'Filter by name',
            child: TextBox(
              suffix: const Icon(FluentIcons.search),
              placeholder: 'Type to filter icons by name (e.g "logo")',
              onChanged: (value) => setState(() {
                filterText = value;
              }),
            ),
          ),
        ),
      ),
      content: SizedBox.expand(
        child: FutureBuilder(
            future: _futureList,
            builder: (context, snapshot) {
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
                    String title = item.title.toString();
                    String subtitle = item.comment.toString();
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
                                  child:
                                      const Icon(FluentIcons.report_document)),
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  title,
                                  style: typography.subtitle
                                      ?.apply(fontSizeFactor: 1.0),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 8, left: 8),
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
            }),
      ),
    );
  }
}
