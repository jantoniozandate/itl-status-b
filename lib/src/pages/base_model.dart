import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/models/user.dart';
// import 'package:itlstatusb/src/services/authentication_service.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();
  User antonio = new User(email: 'antonio', fullName: 'Antonio Z', id: '1234');
  User get currentUser => antonio; //_authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
