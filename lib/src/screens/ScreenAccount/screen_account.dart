import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/components/roudedbutton.component.dart';
import 'package:itlstatusb/src/components/rounded_input_form.dart';
import 'package:itlstatusb/src/components/rounded_password_field.dart';
import 'package:itlstatusb/src/models/account_model.dart';
import 'package:itlstatusb/src/models/user.dart';
import 'package:itlstatusb/src/services/authentication_service.dart';
import 'package:itlstatusb/src/services/dialog_service.dart';

class ScreenAccount extends StatefulWidget {
  ScreenAccount({Key key}) : super(key: key);

  @override
  _ScreenAccountState createState() => _ScreenAccountState();
}

class _ScreenAccountState extends State<ScreenAccount> {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final DialogService _dialogService = locator<DialogService>();

  User currentUser;
  Account userAccount;
  bool hasOccurredAnyChange = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    currentUser = _authenticationService.currentUser;
    userAccount = userAccount ?? Account(user: currentUser);

    if (loading)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[CircularProgressIndicator()],
      );

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              "assets/icons/account.svg",
              height: size.height * .3,
            ),
          ),
          Center(
              child: Column(children: <Widget>[
            RoundedInputForm(
              onChanged: (v) {
                setState(() {
                  currentUser.email = v;
                  hasOccurredAnyChange = true;
                });
              },
              initialValue: currentUser.email,
              labelText: 'Correo',
            ),
            RoundedPasswordField(
              onChanged: (v) {
                setState(() {
                  currentUser.password = v;
                  hasOccurredAnyChange = true;
                });
              },
            ),
            RoundedInputForm(
              onChanged: (v) {
                setState(() {
                  currentUser.username = v;
                  hasOccurredAnyChange = true;
                });
              },
              initialValue: currentUser.username,
              labelText: 'Username',
              icon: Icons.portrait_rounded,
            ),
            RoundedButton(
              text: 'Salir',
              press: () {
                _authenticationService.terminateSession().then((r) {
                  SystemNavigator.pop();
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                      color: Colors.white70,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Credenciales ITL',
                      style: TextStyle(
                          color: Colors.white,
                          )),
                ),
                Expanded(
                  child: Divider(
                      color: Colors.white70,
                      ),
                ),
              ],
            ),
            RoundedInputForm(
              labelText: 'No Control',
              icon: Icons.portrait_rounded,
              onChanged: (v) {
                setState(() {
                  userAccount.controlNum = v;
                  hasOccurredAnyChange = true;
                });
              },
            ),
            RoundedPasswordField(
              hint: 'Contraseña ITL',
              onChanged: (v) {
                setState(() {
                  userAccount.controlPwd = v;
                  hasOccurredAnyChange = true;
                });
              },
            ),
            RoundedButton(
                text: 'Guardar',
                disabled: !hasOccurredAnyChange,
                color: hasOccurredAnyChange ? Colors.blue : Colors.grey,
                press: () {
                  setState(() {
                    loading = true;
                  });

                  _authenticationService
                      .updateAccount(userAccount: userAccount)
                      .then((result) {
                    setState(() {
                      loading = false;
                    });
                    if (result) {
                      try {
                        _dialogService.showDialog(
                            title: 'Actualización',
                            description: 'Datos actualizados!');
                      } catch (e) {
                        _dialogService.showDialog(
                            title: 'Algo salió mal :(',
                            description: 'Datos incorrectos');
                      }
                    }
                  });
                })
          ]))
        ],
      ),
    ));
  }
}
