import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intro View', style: Theme.of(context).textTheme.headline5),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Test Intro View is working',
              style: Theme.of(context).textTheme.headline3,
            ),
            IconButton(
                icon: Obx(
                  () => Icon(controller.isLightTheme.value
                      ? Icons.wb_sunny
                      : Icons.nightlight_round),
                ),
                onPressed: controller.onChangeTheme)
          ],
        ),
      ),
    );
  }
}
