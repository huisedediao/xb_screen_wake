import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'xb_screen_wake_method_channel.dart';

abstract class XbScreenWakePlatform extends PlatformInterface {
  /// Constructs a XbScreenWakePlatform.
  XbScreenWakePlatform() : super(token: _token);

  static final Object _token = Object();

  static XbScreenWakePlatform _instance = MethodChannelXbScreenWake();

  /// The default instance of [XbScreenWakePlatform] to use.
  ///
  /// Defaults to [MethodChannelXbScreenWake].
  static XbScreenWakePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [XbScreenWakePlatform] when
  /// they register themselves.
  static set instance(XbScreenWakePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
