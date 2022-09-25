import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../data/local_repositories/local_repository.dart';

abstract class BaseController extends GetxController {
  late LocalRepository localRepo = Get.find<LocalRepository>();
}
