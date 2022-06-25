import 'envi_config.dart';

class ProdConfig implements EnviConfig {
  @override
  String get apiHost => 'https://phuhp.com';

  @override
  bool get showBanner => false;
}
