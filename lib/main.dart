import 'package:flutter/material.dart';
// import 'package:itlstatusb/src/providers/push_notifications.provider.dart';
import 'locator.dart';
import './src/pages/router.dart';
import './src/managers/dialog_manager.dart';
import 'package:itlstatusb/src/services/navigation_service.dart';
import 'package:itlstatusb/src/services/dialog_service.dart';
import 'package:itlstatusb/src/providers/push_notifications.provider.dart';

import 'package:hexcolor/hexcolor.dart';

// Pages
import 'package:itlstatusb/src/pages/Login/login.page.dart';
import 'package:itlstatusb/src/pages/Welcome/welcome.page.dart';

// Constants
// import 'constants.dart';

// Dot env
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  await DotEnv.load(fileName: '.env');
  setupLocator();
  PushNotificationProvider pushNotificationService = locator<PushNotificationProvider>();
  pushNotificationService.initNotifications();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITL Status',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: HexColor('#282C34')
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   scaffoldBackgroundColor: HexColor('#282C34'),
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // themeMode: ThemeMode.dark,
      home: WelcomePage(),
      onGenerateRoute: generateRoute,
    );
  }
}
