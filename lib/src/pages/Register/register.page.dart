import 'package:flutter/material.dart';
import './components/body.register.dart';
import 'package:stacked/stacked.dart';

import './register.page.model.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterPageModel>.reactive(
        viewModelBuilder: () => RegisterPageModel(),
        builder: (context, model, child) => Scaffold(body: Body(model: model)));
  }
}
