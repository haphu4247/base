import 'package:intl/intl.dart';

extension IntExt on int {
  String formatedTime() {
    int min = this ~/ 60;
    int sec = this % 60;
    return '$min:$sec';
  }

  String formatNumber() {
    return NumberFormat.decimalPattern().format(this);
  }
}

extension IntNullableExt on int? {
  String formatedTime() {
    return (this ?? 0).formatedTime();
  }

  String formatNumber() {
    return (this ?? 0).formatNumber();
  }
}
