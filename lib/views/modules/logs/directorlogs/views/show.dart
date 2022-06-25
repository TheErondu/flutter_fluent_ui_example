import 'package:flutter/material.dart';
import 'package:hermes/utils/colors.dart';
import 'package:hermes/utils/functions.dart';
import 'package:hermes/views/modules/logs/directorlogs/directorlog.dart';
import 'package:hermes/views/modules/logs/list.dart';

class ShowDirectorLogView extends StatefulWidget {
  const ShowDirectorLogView({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowDirectorLogView> createState() => _ShowDirectorLogViewState();
}

class _ShowDirectorLogViewState extends State<ShowDirectorLogView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as LogArguments;
    var log = Directorlogs.fromJson(args.data);
    final introText = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        // "\$20",
        formatDate(log.logDate!),
        style: const TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          log.title!,
          style: const TextStyle(color: Colors.white, fontSize: 45.0),
        ),
          SizedBox(
          width: MediaQuery.of(context).size.width,
          child:  Divider(color: primaryColor),
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Expanded(flex: 1, child: Icon(Icons.newspaper)),
             Expanded(
                flex: 6,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Producer : ${log.producer!}',
                      style: const TextStyle(color: Colors.white),
                    ))),
            Expanded(flex: 6, child: introText)
          ],
        ),
      ],
    );
    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login-bg.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    const bottomContentText = Text(
      'lesson.content',
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width/2,
        child: ElevatedButton(
          onPressed: () => {},
          child: const Text("Edit this log",
              style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[topContent, bottomContent],
            ),
          ),
        ],
      ),
    );
  }
}
