import 'package:itlstatusb/constants.dart';
import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/services/dialog_service.dart';
import 'package:itlstatusb/src/services/navigation_service.dart';
import 'package:flutter/foundation.dart';

import '../base_model.dart';

class LoginPageModel extends BaseModel {
  // final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToHome() {
    _navigationService.navigateTo(LoginPageRoute);
  }

  void navigateToRegister() {
    _navigationService.navigateTo(RegisterPageRoute);
  }
}