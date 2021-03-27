import 'package:itlstatusb/constants.dart';
import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/services/authentication_service.dart';
import 'package:itlstatusb/src/services/dialog_service.dart';
import 'package:itlstatusb/src/services/navigation_service.dart';
import 'package:flutter/foundation.dart';

import '../base_model.dart';

class WelcomePageModel extends BaseModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  void navigateToLogin() {
    _navigationService.navigateTo(LoginPageRoute);
  }

  void navigateToRegister() {
    _navigationService.navigateTo(RegisterPageRoute);
  }

  void checkLogin() async {
    bool isLoggedIn = await _authenticationService.isUserLoggedIn();
    if (isLoggedIn) _navigationService.navigateTo(HomePageRoute);
  }
}
