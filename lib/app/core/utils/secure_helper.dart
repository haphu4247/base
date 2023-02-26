import 'package:base/app/core/utils/my_log.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SecureHelper {
  SecureHelper._();

  static final SecureHelper instance = SecureHelper._();

  Future<PackageInfo> get packageInfo async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // String appName = packageInfo.appName;
    // String packageName = packageInfo.packageName;
    // String version = packageInfo.version;
    // String buildNumber = packageInfo.buildNumber;
    // packageInfo.buildSignature;
    MyLog.d('buildSignature: ${packageInfo.buildSignature}');
    return packageInfo;
  }
}
