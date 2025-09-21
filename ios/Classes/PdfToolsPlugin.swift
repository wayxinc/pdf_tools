import Flutter
import UIKit
import PDFKit

public class PdfToolsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "pdf_tools", binaryMessenger: registrar.messenger())
    let instance = PdfToolsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "splitPdf" {
      guard let args = call.arguments as? [String: Any],
            let path = args["path"] as? String,
            let doc = PDFDocument(url: URL(fileURLWithPath: path)) else {
        result(FlutterError(code: "INVALID", message: "No PDF", details: nil))
        return
      }

      var outputPaths: [String] = []
      for i in 0..<doc.pageCount {
        let newDoc = PDFDocument()
        if let page = doc.page(at: i) {
          newDoc.insert(page, at: 0)
        }
        let outPath = (path as NSString).deletingLastPathComponent + "/page_\(i).pdf"
        newDoc.write(to: URL(fileURLWithPath: outPath))
        outputPaths.append(outPath)
      }
      result(outputPaths)

    } else if call.method == "mergePdfs" {
      guard let args = call.arguments as? [String: Any],
            let paths = args["paths"] as? [String] else {
        result(FlutterError(code: "INVALID", message: "No paths", details: nil))
        return
      }

      let merged = PDFDocument()
      var pageIndex = 0
      for p in paths {
        if let doc = PDFDocument(url: URL(fileURLWithPath: p)) {
          for i in 0..<doc.pageCount {
            if let page = doc.page(at: i) {
              merged.insert(page, at: pageIndex)
              pageIndex += 1
            }
          }
        }
      }
      let outPath = (paths[0] as NSString).deletingLastPathComponent + "/merged.pdf"
      merged.write(to: URL(fileURLWithPath: outPath))
      result(outPath)

    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
