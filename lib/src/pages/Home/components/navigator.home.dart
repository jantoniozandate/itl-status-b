import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:itlstatusb/src/screens/ScreenKardex/screenKardex.dart';

// Screens
import 'package:itlstatusb/src/screens/ScreenNow/screenNow.dart';
import 'package:itlstatusb/src/screens/ScreenAccount/screen_account.dart';

class BottomNavigatorHome extends StatefulWidget {
  BottomNavigatorHome({Key key}) : super(key: key);

  @override
  BottomNavigatorHomeState createState() => BottomNavigatorHomeState();
}

class BottomNavigatorHomeState extends State<BottomNavigatorHome> {
  int currentIndex = 1;
  final List<Widget> viewContainer = [
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('Hola'),
    ]),
    ScreenNow(),
    ScreenKardex(),
    ScreenAccount()
  ];
  final List<BottomNavigationBarItem> _bottomNavBarList = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
      ),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.timer_outlined),
        activeIcon: Icon(Icons.timer),
        label: 'Now',
        backgroundColor: Colors.red),
    BottomNavigationBarItem(
      icon: Icon(Icons.show_chart_outlined),
      activeIcon: Icon(Icons.show_chart),
      label: 'Kardex',
      backgroundColor: Colors.green,
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        activeIcon: Icon(Icons.account_circle),
        label: 'Cuenta')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: IndexedStack(index: currentIndex, children: viewContainer)),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.blue,
          backgroundColor: HexColor('#19396A'),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: _bottomNavBarList),
    );
  }
}
