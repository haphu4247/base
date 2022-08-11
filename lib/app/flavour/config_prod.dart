import 'base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => 'https://phuhp.com';

  @override
  bool get showBanner => false;
}
