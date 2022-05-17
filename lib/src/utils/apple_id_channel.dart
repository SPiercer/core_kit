import 'package:flutter/services.dart';

class AppleIdChannel {
  static const MethodChannel _channel = MethodChannel('turbo_core_kit');

  static Future<String?> get appleAppId async {
    final String? version = await _channel.invokeMethod('getAppleAppID');
    return version;
  }
}