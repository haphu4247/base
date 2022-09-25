import 'package:base/app/base/base_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget buildView(BuildContext context) {
    controller.back();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SplashView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
