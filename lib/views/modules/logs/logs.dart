import 'package:fluent_ui/fluent_ui.dart';
import '../../lists/logs.dart';

class LogsGridWidget extends StatefulWidget {
  const LogsGridWidget({Key? key}) : super(key: key);

  @override
  LogsGridWidgetState createState() => LogsGridWidgetState();
}

class LogsGridWidgetState extends State<LogsGridWidget> {
  bool showList = false;
  late String modelText;
  late String logHeaderTitle;
  final features = {
    "Director Logs": FluentIcons.report_library,
    "Video Editor Logs": FluentIcons.report_library,
    "OB logs": FluentIcons.report_library,
    "MCR logs": FluentIcons.report_library,
    "Production Show logs": FluentIcons.report_library,
    "Graphics News logs": FluentIcons.report_library
  };
  String filterText = '';
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasFluentTheme(context));
    return ScaffoldPage.withPadding(
      header: showList
          ? PageHeader(
            padding: 2,
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    showList = false;
                  });
                },
                icon: const Icon(FluentIcons.back,size: 20,),
              ),
            )
          : PageHeader(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    showList = false;
                  });
                },
                icon: const Icon(FluentIcons.back),
              ),
              title: const Text('All Logs'),
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
      bottomBar: const InfoBar(
        title: Text('Tip:'),
        content: Text(
          'You can click on any icon to copy its name to the clipboard!',
        ),
      ),
      content: showList
          ? ListViewWidget(model: modelText,headerText:logHeaderTitle)
          : GridView.extent(
              maxCrossAxisExtent: 150,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.only(top: kPageDefaultVerticalPadding),
              children: features.entries
                  .where((icon) =>
                      filterText.isEmpty ||
                      // Remove '_'
                      icon.key
                          .replaceAll('_', '')
                          // toLowerCase
                          .toLowerCase()
                          .contains(filterText
                              .toLowerCase()
                              // Remove spaces
                              .replaceAll(' ', '')))
                  .map((e) {
                return HoverButton(
                  onPressed: () {
                    setState(() {
                      showList = !showList;
                      logHeaderTitle = e.key;
                      modelText = textToModel(e.key.toString());
                    });
                  },
                  cursor: SystemMouseCursors.copy,
                  builder: (context, states) {
                    return FocusBorder(
                      focused: states.isFocused,
                      renderOutside: false,
                      child: Tooltip(
                        useMousePosition: false,
                        message: '${e.key}\n(tap to see view logs)\n',
                        child: RepaintBoundary(
                          child: AnimatedContainer(
                            duration:
                                FluentTheme.of(context).fasterAnimationDuration,
                            decoration: BoxDecoration(
                              color: ButtonThemeData.uncheckedInputColor(
                                FluentTheme.of(context),
                                states,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: const EdgeInsets.all(6.0),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(e.value, size: 40),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      snakeCasetoSentenceCase(e.key),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
    );
  }
}

String snakeCasetoSentenceCase(String original) {
  return '${original[0].toUpperCase()}${original.substring(1)}'
      .replaceAll(RegExp(r'(_|-)+'), ' ');
}

String textToModel(String original) {
  return original.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+|\s'), '');
}
