import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'opencv_native_method_channel.dart';

abstract class OpencvNativePlatform extends PlatformInterface {
  /// Constructs a OpencvNativePlatform.
  OpencvNativePlatform() : super(token: _token);

  static final Object _token = Object();

  static OpencvNativePlatform _instance = MethodChannelOpencvNative();

  /// The default instance of [OpencvNativePlatform] to use.
  ///
  /// Defaults to [MethodChannelOpencvNative].
  static OpencvNativePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OpencvNativePlatform] when
  /// they register themselves.
  static set instance(OpencvNativePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
