import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itlstatusb/src/providers/roudedbutton.component.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bienvenido a ITL Status',
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
                  press: () {},
                ),
                RoundedButton(
                    text: "REGISTER",
                    press: () {},
                    color: Colors.blue[100],
                    textColor: Colors.black),
              ],
            )
          ],
        ));
  }
}
