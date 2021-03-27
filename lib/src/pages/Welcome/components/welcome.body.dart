import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itlstatusb/src/components/roudedbutton.component.dart';
import 'background.welcome.dart';
// import 'package:stacked/stacked.dart';
// import 'package:itlstatusb/src/pages/Login/login.page.dart';

import '../welcome.page.model.dart';

class WelcomeBody extends StatelessWidget {
  final WelcomePageModel model;
  const WelcomeBody({Key key, this.model} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    this.model.checkLogin();
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bienvenido a ITL Status',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20)),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset("assets/icons/welcome.svg",
                height: size.height * 0.4),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                this.model.navigateToLogin();
                // Navigator.push(
                //     context,
                //     new MaterialPageRoute(
                //         builder: (context) => new LoginPage()));
              },
            ),
            RoundedButton(
                text: "REGISTER",
                press: () {
                  this.model.navigateToRegister();
                },
                color: Colors.blue[100],
                textColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
