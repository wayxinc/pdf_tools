import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pdf_tools_platform_interface.dart';

/// An implementation of [PdfToolsPlatform] that uses method channels.
class MethodChannelPdfTools extends PdfToolsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pdf_tools');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
