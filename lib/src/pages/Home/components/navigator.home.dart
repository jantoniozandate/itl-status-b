import 'package:flutter/material.dart';

// Screens
import 'package:itlstatusb/src/screens/screenNow.dart';

class BottomNavigatorHome extends StatefulWidget {
  BottomNavigatorHome({Key key}) : super(key: key);

  @override
  BottomNavigatorHomeState createState() => BottomNavigatorHomeState();
}

class BottomNavigatorHomeState extends State<BottomNavigatorHome> {
  int currentIndex = 0;
  final List<Widget> viewContainer = [
    NowScreen(),
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Hola'),
    ])
  ];
  final List<BottomNavigationBarItem> _bottomNavBarList = [
    BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Now', backgroundColor: Colors.red),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: IndexedStack(index: currentIndex, children: viewContainer)),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.shifting,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: _bottomNavBarList),
    );
  }
}
