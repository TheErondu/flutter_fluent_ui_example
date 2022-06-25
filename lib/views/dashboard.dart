import 'package:flutter/material.dart';
import 'package:hermes/utils/colors.dart';
import 'package:hermes/views/modules/admin/admin.dart';
import 'package:hermes/views/modules/logs/list.dart';
import 'package:hermes/views/modules/messages/mesages.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const LogsView(),
    const Text(
      'Index 0: Media',
      style: optionStyle,
    ),
    const MessageView(),
    const AdminView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: primaryColor,
        backgroundColor: bgroundColor,
        title: const Text('Hello, Awesome User!'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: primaryColor,
        selectedItemColor: white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_check),
            label: 'logs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Media ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_rounded),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
