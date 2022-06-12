import 'package:clipboard/clipboard.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hermes/utils/debugger.dart';

import '../icons.dart';
import '../list_view.dart';

class FeaturesViewWidget extends StatefulWidget {
  const FeaturesViewWidget({Key? key}) : super(key: key);

  @override
  FeaturesViewWidgetState createState() => FeaturesViewWidgetState();
}

class FeaturesViewWidgetState extends State<FeaturesViewWidget> {
  bool showList = false;
  late String r;
  final features = {
    "Director's Report": FluentIcons.report_library,
    "Video Editor's": FluentIcons.report_library,
    "OB Logs": FluentIcons.report_library,
    "MCR Logs": FluentIcons.report_library,
    "Production Show Logs": FluentIcons.report_library,
    "Graphics Logs": FluentIcons.report_library
  };
  String filterText = '';
  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasFluentTheme(context));
    return ScaffoldPage.withPadding(
      header: PageHeader(
        title: const Text('Fluent Icons Gallery showcase'),
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
          ? const ListViewWidget(model: "reports")
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
                    String text = textToModel(e.key);
                    toLog(text);
                    setState(() {
                      showList = !showList;
                      r = text;
                      toLog(r);
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(e.value, size: 40),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    snakeCasetoSentenceCase(e.key),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
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

