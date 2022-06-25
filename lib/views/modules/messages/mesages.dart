import 'package:flutter/material.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  MessageViewState createState() => MessageViewState();
}

class MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "Messages",
      style: TextStyle(fontSize: 60),
    ));
  }
}
