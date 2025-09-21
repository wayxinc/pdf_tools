import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pdf_tools_method_channel.dart';

abstract class PdfToolsPlatform extends PlatformInterface {
  /// Constructs a PdfToolsPlatform.
  PdfToolsPlatform() : super(token: _token);

  static final Object _token = Object();

  static PdfToolsPlatform _instance = MethodChannelPdfTools();

  /// The default instance of [PdfToolsPlatform] to use.
  ///
  /// Defaults to [MethodChannelPdfTools].
  static PdfToolsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PdfToolsPlatform] when
  /// they register themselves.
  static set instance(PdfToolsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
