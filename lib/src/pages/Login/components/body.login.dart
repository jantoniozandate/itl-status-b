import 'package:flutter/material.dart';
import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/pages/Login/login.page.model.dart';
import 'package:itlstatusb/src/services/authentication_service.dart';
import 'package:itlstatusb/src/services/dialog_service.dart';
import './background.login.dart';
// import 'package:itlstatusb/Screens/Signup/signup_screen.dart';
import 'package:itlstatusb/src/components/already_have_an_account_acheck.dart';
import 'package:itlstatusb/src/components/roudedbutton.component.dart';
import 'package:itlstatusb/src/components/rounded_input_field.dart';
import 'package:itlstatusb/src/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

import 'package:itlstatusb/src/models/user.dart';
import 'package:itlstatusb/src/services/api_service.dart';

class Body extends StatefulWidget {
  final LoginPageModel model;
  const Body({Key key, this.model}) : super(key: key);

  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String login;
  String password;
  bool loading = false;
  final DialogService _dialogService = locator<DialogService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  @override
  Body get widget => super.widget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (loading)
      return Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[CircularProgressIndicator()],
        ),
      );

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email o username",
              onChanged: (value) {
                setState(() {
                  login = value;
                });
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                setState(() {
                  loading = true;
                });
                _authenticationService
                    .loginWithEmail(email: login, password: password)
                    .then((result) {
                  if (result) {
                    try {
                      setState(() {
                        loading = false;
                      });
                      super.widget.model.navigateToHome();
                    } catch (e) {
                      print(e);
                      _dialogService.showDialog(
                          title: 'Algo salió mal :(',
                          description: 'Credenciales invalidas');
                    }
                  }
                });
                // doLogin(login, password).then((result) {

                //   // print('Login terminado');
                //   // print(result);
                //   // _dialogService.showDialog(title: 'Success', description: result.toString());
                // });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       // return SignUpScreen();
                //     },
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
