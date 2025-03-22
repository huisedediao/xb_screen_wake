import 'package:flutter_test/flutter_test.dart';
import 'package:xb_screen_wake/xb_screen_wake.dart';
import 'package:xb_screen_wake/xb_screen_wake_platform_interface.dart';
import 'package:xb_screen_wake/xb_screen_wake_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockXbScreenWakePlatform
    with MockPlatformInterfaceMixin
    implements XbScreenWakePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final XbScreenWakePlatform initialPlatform = XbScreenWakePlatform.instance;

  test('$MethodChannelXbScreenWake is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelXbScreenWake>());
  });

  test('getPlatformVersion', () async {
    XbScreenWake xbScreenWakePlugin = XbScreenWake();
    MockXbScreenWakePlatform fakePlatform = MockXbScreenWakePlatform();
    XbScreenWakePlatform.instance = fakePlatform;

    expect(await xbScreenWakePlugin.getPlatformVersion(), '42');
  });
}
