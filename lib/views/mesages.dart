import 'package:fluent_ui/fluent_ui.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  MessageViewState createState() => MessageViewState();
}

class MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: Text(
        "Messages",
        style: TextStyle(fontSize: 60),
      ),
      content: Center(
        child: Text("You have no Messages!"),
      ),
    );
  }
}
