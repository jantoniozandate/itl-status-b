// import 'package:itlstatusb/src/models/post.dart';
// import 'package:itlstatusb/src/ui/views/create_post_view.dart';
import 'package:itlstatusb/src/pages/Register/register.page.dart';
import 'package:itlstatusb/src/pages/Welcome/welcome.page.dart';
// import 'package:itlstatusb/src/pages/home.page.dart';
import 'package:itlstatusb/src/pages/Home/home.page.dart';
import 'package:flutter/material.dart';
import 'package:itlstatusb/constants.dart';
import 'package:itlstatusb/src/pages/Login/login.page.dart';
// import 'package:itlstatusb/src/pages/Register/register.page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPageRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginPage(),
      );
    case RegisterPageRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: RegisterPage(),
      );
    case WelcomePageRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: WelcomePage(),
      );
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomePage(),
      );
    case HomePageRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: HomePage());
    // case :
    //   var postToEdit = settings.arguments as Post;
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: CreatePostView(
    //       edittingPost: postToEdit,
    //     ),
    //   );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
