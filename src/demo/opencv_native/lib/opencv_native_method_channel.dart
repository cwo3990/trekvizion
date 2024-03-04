import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'opencv_native_platform_interface.dart';

/// An implementation of [OpencvNativePlatform] that uses method channels.
class MethodChannelOpencvNative extends OpencvNativePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('opencv_native');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
