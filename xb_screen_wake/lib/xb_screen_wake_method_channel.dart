import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'xb_screen_wake_platform_interface.dart';

/// An implementation of [XbScreenWakePlatform] that uses method channels.
class MethodChannelXbScreenWake extends XbScreenWakePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('xb_screen_wake');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
