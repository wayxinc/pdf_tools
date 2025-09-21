import 'package:flutter_test/flutter_test.dart';
import 'package:pdf_tools/pdf_tools.dart';
import 'package:pdf_tools/pdf_tools_platform_interface.dart';
import 'package:pdf_tools/pdf_tools_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPdfToolsPlatform
    with MockPlatformInterfaceMixin
    implements PdfToolsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PdfToolsPlatform initialPlatform = PdfToolsPlatform.instance;

  test('$MethodChannelPdfTools is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPdfTools>());
  });

  test('getPlatformVersion', () async {
    PdfTools pdfToolsPlugin = PdfTools();
    MockPdfToolsPlatform fakePlatform = MockPdfToolsPlatform();
    PdfToolsPlatform.instance = fakePlatform;

    expect(await pdfToolsPlugin.getPlatformVersion(), '42');
  });
}
