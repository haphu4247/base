import 'package:base/app/base/base_view.dart';
import 'package:base/app/flavour/environment.dart';
import 'package:base/app/global_widgets/my_appbar.dart';
import 'package:flutter/material.dart';

import '../controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    controller.back();
    return Scaffold(
      appBar: MyAppbar.Title(title: 'Env: ${Environment().config.env.name}'),
      body: Center(
        child: Text(
          'SplashView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
