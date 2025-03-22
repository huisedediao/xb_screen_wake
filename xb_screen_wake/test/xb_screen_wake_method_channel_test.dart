import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xb_screen_wake/xb_screen_wake_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelXbScreenWake platform = MethodChannelXbScreenWake();
  const MethodChannel channel = MethodChannel('xb_screen_wake');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
