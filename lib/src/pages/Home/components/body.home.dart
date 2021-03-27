import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/services/authentication_service.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key key}) : super(key: key);

  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Home'),
                Text(
                    'Bienvenido ' + _authenticationService.currentUser.username)
              ],
            )));
  }
}
