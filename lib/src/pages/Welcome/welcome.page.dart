import 'package:flutter/material.dart';
import 'package:itlstatusb/src/pages/Welcome/components/welcome.body.dart';
import 'package:stacked/stacked.dart';

import './welcome.page.model.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomePageModel>.reactive(
        viewModelBuilder: () => WelcomePageModel(),
        builder: (context, model, child) => Scaffold(
              body: WelcomeBody(
                model: model,
              ),
            ));
  }
}
