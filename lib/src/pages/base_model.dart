import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/models/user.dart';
// import 'package:itlstatusb/src/services/authentication_service.dart';
import 'package:flutter/widgets.dart';
import 'package:itlstatusb/src/services/authentication_service.dart';

class BaseModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  // User antonio = new User(email: 'antonio', id: '1234');
  User get currentUser => _authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
