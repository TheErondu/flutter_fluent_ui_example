import 'package:fluent_ui/fluent_ui.dart';
import 'package:hermes/services/api.dart';
import 'package:hermes/utils/debugger.dart';

import '../controllers/crud_controller.dart';
import '../utils/tools.dart';

class ListViewWidget extends StatefulWidget {
  final String model;
  const ListViewWidget({Key? key, required this.model}) : super(key: key);
  @override
  ListViewWidgetState createState() => ListViewWidgetState();
}

class ListViewWidgetState extends State<ListViewWidget> {
  late String route = widget.model;
 late final _futureList = index(route);
  final reports = {
    'Mass in B minor': 'Johann Sebastian Bach',
    'Third Symphony': 'Ludwig van Beethoven',
    'Serse': 'George Frideric Hendel',
    'Mass in  minor': 'Johann Sebastian Bach',
    'Third Symphony2': 'Ludwig van Beethoven',
    'Serse2': 'George Frideric Hendel',
    'Mass 2in B minor': 'Johann Sebastian Bach',
    'Third S2ymphony': 'Ludwig van Beethoven',
    'Serse3': '2George Frideric Hendel',
    'Mass in B 2minor': 'Johann Sebastian Bach',
    'Third Sympho2ny': 'Ludwig van Beethoven',
    'Serse4': 'George Frideric Hendel',
    'Mass in sB minor': 'Johann Sebastian Bach',
    'Third Symsphony': 'Ludwig van Beethoven',
    'Sersse': 'George Frideric Hendel',
    'Mass sin B minor': 'Johann Sebastian Bach',
    'Third sSymphony': 'Ludwig van Beethoven',
    'Serssae': 'George Frideric Hendel',
  };

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
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

              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    if (list.isEmpty) {
                      return Center(
                        child: Image.asset(
                          'assets/images/No_Data_Found.png',
                          fit: BoxFit.scaleDown,
                        ),
                      );
                    }
                    final data = list[index];
                    final item = getReportModel(data);
                    String title = item.title.toString();
                    String subtitle = item.comment.toString();
                    return TappableListTile(
                        leading: const Icon(FluentIcons.report_library),
                        title: Text(title,
                            overflow: TextOverflow.ellipsis, maxLines: 1),
                        subtitle: Text(subtitle,
                            overflow: TextOverflow.ellipsis, maxLines: 1),
                        onTap: () => toLog(subtitle));
                  });
            }),
      ),
    );
  }
}
