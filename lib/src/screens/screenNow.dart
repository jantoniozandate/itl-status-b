import 'package:flutter/material.dart';
import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/models/status_model.dart';
import 'package:itlstatusb/src/services/api_service.dart';
import 'package:itlstatusb/src/services/authentication_service.dart';

class ScreenNow extends StatefulWidget {
  const ScreenNow({Key key}) : super(key: key);

  @override
  _ScreenNowState createState() => _ScreenNowState();
}

class _ScreenNowState extends State<ScreenNow> {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  Status _status;
  bool loading = true;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    if (loading && !error)
      APIService.getStatus(_authenticationService.currentUser)
          .then((Status result) {
        setState(() {
          if (result != null) {
            _status = result;
            loading = false;
          }
        });
      }).catchError((var err){
        setState(() {
          error = true;
        });
      });

    if (loading)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[CircularProgressIndicator(strokeWidth: 5,)],
      );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(_status.cargaToString())],
      ),
    );
  }
}
