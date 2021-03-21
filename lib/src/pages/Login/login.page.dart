import 'package:flutter/material.dart';
import './components/body.login.dart';
import 'package:stacked/stacked.dart';

import './login.page.model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageModel>.reactive(
        viewModelBuilder: () => LoginPageModel(),
        builder: (context, model, child) => Scaffold(body: Body(model: model)));
  }
}
