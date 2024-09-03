import 'package:flutter/services.dart';

class NativeCodeInvoker {
  static const platform = MethodChannel('com.listenToMe.app/native');
  static Future<dynamic> invokeMethod(String method,
      [dynamic arguments]) async {
    return platform.invokeMethod(method, arguments);
  }
}
