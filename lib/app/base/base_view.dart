import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BaseView<T extends BaseController> extends GetView<T> {
  const BaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildView(context);
  }

  @protected
  Widget buildView(BuildContext context);
}
