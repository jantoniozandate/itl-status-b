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
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Hola'),
    ]),
    ScreenNow(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Kardex')],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Cuenta')],
    )
  ];
  final List<BottomNavigationBarItem> _bottomNavBarList = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'Home',
        backgroundColor: Colors.blue),
    BottomNavigationBarItem(
        icon: Icon(Icons.timer), label: 'Now', backgroundColor: Colors.red),
    BottomNavigationBarItem(
      icon: Icon(Icons.show_chart_outlined),
      label: 'Kardex',
      backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: 'Cuenta'
    )
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
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: _bottomNavBarList),
    );
  }
}
