class UtilsInt {
  UtilsInt._internal();

  static int parse(dynamic msg) {
    if (msg == null) {
      return 0;
    }
    if (msg is int) {
      return msg;
    }
    final result = int.tryParse(msg.toString());
    return result ?? 0;
  }
}
