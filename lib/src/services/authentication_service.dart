import 'dart:convert';

import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/models/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
// import 'package:compound/services/firestore_service.dart';
import './api_service.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String SESSION_KEY = 'session';

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
      var authResult = await doLogin(
        email,
        password,
      );
      await _populateCurrentUser(authResult);
      return authResult != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
    @required String role,
  }) async {
    try {
      // var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );

      // // create a new user profile on firestore
      // _currentUser = User(
      //   id: authResult.user.uid,
      //   email: email,
      //   fullName: fullName,
      //   userRole: role,
      // );

      // await _firestoreService.createUser(_currentUser);

      // return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  // Fetch from memory or local storage
  Future<bool> isUserLoggedIn() async {
    try {
      if (_currentUser != null && _currentUser.id != '') {
        return true;
      }
      
      String usr = await storage.read(key: SESSION_KEY);

      if (usr != null && usr != '') {
        dynamic json = jsonDecode(usr);
        User user = User.fromJson(json);
        await _populateCurrentUser(user);
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
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
