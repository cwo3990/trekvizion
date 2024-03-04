
import 'opencv_native_platform_interface.dart';

class OpencvNative {
  Future<String?> getPlatformVersion() {
    return OpencvNativePlatform.instance.getPlatformVersion();
  }
}
