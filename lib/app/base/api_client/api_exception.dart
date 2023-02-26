class APIException implements Exception {
  String message;
  int? code;
  dynamic parameters;
  APIException(
      {this.message = 'Unknown exception!', this.code, this.parameters});

  String get fullMessage {
    // if (parameters != null) {
    //   var replacedMessage = message;
    //   if (parameters is List<dynamic>) {
    //     for (var i = 0; i < parameters!.length; i++) {
    //       final param = parameters![i];
    //       replacedMessage = replacedMessage.replaceAll('%${i + 1}', param);
    //     }
    //   } else if (parameters is Map<String, dynamic>) {
    //     parameters.forEach((k, v) {
    //       replacedMessage = replacedMessage.replaceAll('%$k', v);
    //     });
    //   }
    //   return replacedMessage;
    // }
    return message;
  }

  @override
  String toString() => fullMessage;
}
