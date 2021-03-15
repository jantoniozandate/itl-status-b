import 'package:flutter/material.dart';
import 'package:itlstatusb/src/pages/Welcome/welcome.page.dart';
import 'package:itlstatusb/src/providers/push_notifications.provider.dart';

// Pages
import 'package:itlstatusb/src/pages/home.page.dart';
import 'package:itlstatusb/src/pages/message.page.dart';
import 'package:itlstatusb/src/pages/Login/login.page.dart';


// Constants
// import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
    void initState() {
      // TODO: implement initState
      super.initState();

      final pushProvider = new PushNotificationProvider();
      pushProvider.initNotifications();
      pushProvider.messages.listen((data) {
        navigatorKey.currentState.pushNamed('message', arguments: data);
      });
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITL Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'welcome',
      routes: {
        'welcome': (BuildContext context) => WelcomePage(),
        'home': (BuildContext context) => HomePage(),
        'message': (BuildContext context) => MessagePage(),
        'login': (BuildContext context) => LoginPage(),
      },
      navigatorKey: navigatorKey,
    );
  }
}
