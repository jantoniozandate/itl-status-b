import 'dart:convert';

import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/models/account_model.dart';
import 'package:itlstatusb/src/models/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
// import 'package:compound/services/firestore_service.dart';
import './api_service.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:itlstatusb/constants.dart';

class AuthenticationService {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirestoreService _firestoreService = locator<FirestoreService>();
  final storage = new FlutterSecureStorage();

  User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await APIService.doLogin(
        email,
        password,
      );
      await _populateCurrentUser(authResult);
      return authResult != null;
    } catch (e) {
      return e.message;
    }
  }

  Future registerWithEmail({
    @required String username,
    @required String mail,
    @required String password,
  }) async {
    try {
      var authResult = await APIService.doRegister(
        username,
        mail,
        password,
      );
      await _populateCurrentUser(authResult);
      return authResult != null;
    } catch (e) {
      return e.message;
    }
  }

  Future updateAccount({
    @required Account userAccount
  }) async {
    try {
      final updateResult = await APIService.updateStatus(userAccount);
      return updateResult != null;
    } catch (e) {
      print(e);
      return e.message;
    }
  }

  Future terminateSession() async {
    try {
      _currentUser = null;
      await storage.delete(key: SESSION_KEY);
    } catch (e) {
    }    
  }

  // Fetch from memory or local storage
  Future<bool> isUserLoggedIn() async {
    try {
      if (_currentUser != null &&
          _currentUser.id != '' &&
          validateSessionExpiration(_currentUser)) {
        return true;
      }

      String usr = await storage.read(key: SESSION_KEY);

      if (usr != null && usr != '') {
        dynamic json = jsonDecode(usr);
        User user = User.fromJson(json);
        await _populateCurrentUser(user);
        return validateSessionExpiration(user);
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  validateSessionExpiration(User user) {
    int limitSessionAge =
        DateTime.now().toUtc().millisecondsSinceEpoch - ONE_DAY_IN_MS;
    return (user.sessionExpiresAt > limitSessionAge);
  }

  // Update memory and write to local storage
  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = user;

      String value = jsonEncode(user.toJson());
      await storage.delete(key: SESSION_KEY);
      await storage.write(key: SESSION_KEY, value: value);
      // _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
