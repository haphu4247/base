import 'config_prod.dart';
import 'config_staging.dart';
import 'flavour.dart';

abstract class BaseConfig {
  factory BaseConfig(Flavour environment) {
    switch (environment) {
      case Flavour.production:
        return ProdConfig(environment);
      case Flavour.dev:
      case Flavour.staging:
        return StagingConfig(environment);
    }
  }
  String get apiHost;

  bool get showBanner;

  late Flavour env;
}
