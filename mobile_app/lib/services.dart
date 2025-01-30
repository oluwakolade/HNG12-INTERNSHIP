import 'package:flutter/services.dart';

class UrlLauncher {
  static const MethodChannel _channel = MethodChannel('url_launcher');

  static Future<void> openUrl(String url) async {
    try {
      await _channel.invokeMethod('openUrl', {'url': url});
    } on PlatformException catch (e) {
      print('Failed to open URL: ${e.message}');
    }
  }
}
