import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/models/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
// import 'package:compound/services/firestore_service.dart';
import './api_service.dart';

class AuthenticationService {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirestoreService _firestoreService = locator<FirestoreService>();

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

  Future<bool> isUserLoggedIn() async {
    return true;
    // var user = await _firebaseAuth.currentUser();
    // await _populateCurrentUser(user);
    // return user != null;
  }

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = user;
      // _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
