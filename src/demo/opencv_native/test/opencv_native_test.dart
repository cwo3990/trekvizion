import 'package:flutter_test/flutter_test.dart';
import 'package:opencv_native/opencv_native.dart';
import 'package:opencv_native/opencv_native_platform_interface.dart';
import 'package:opencv_native/opencv_native_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOpencvNativePlatform
    with MockPlatformInterfaceMixin
    implements OpencvNativePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final OpencvNativePlatform initialPlatform = OpencvNativePlatform.instance;

  test('$MethodChannelOpencvNative is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOpencvNative>());
  });

  test('getPlatformVersion', () async {
    OpencvNative opencvNativePlugin = OpencvNative();
    MockOpencvNativePlatform fakePlatform = MockOpencvNativePlatform();
    OpencvNativePlatform.instance = fakePlatform;

    expect(await opencvNativePlugin.getPlatformVersion(), '42');
  });
}
