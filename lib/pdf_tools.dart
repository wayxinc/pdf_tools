import 'dart:async';
import 'package:flutter/services.dart';

class PdfTools {
  static const MethodChannel _channel = MethodChannel('pdf_tools');

  /// Split a PDF into single-page PDFs.
  /// Returns a list of output file paths.
  static Future<List<String>> splitPdf(String path) async {
    final List<dynamic> result = await _channel.invokeMethod('splitPdf', {
      'path': path,
    });
    return result.cast<String>();
  }

  /// Merge multiple PDFs into a single PDF.
  /// Returns the output file path.
  static Future<String> mergePdfs(List<String> paths) async {
    final String result = await _channel.invokeMethod('mergePdfs', {
      'paths': paths,
    });
    return result;
  }
}
