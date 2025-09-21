package com.deinefirma.pdftools

import androidx.annotation.NonNull
import org.apache.pdfbox.pdmodel.PDDocument
import org.apache.pdfbox.multipdf.Splitter
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File

class PdfToolsPlugin: FlutterPlugin, MethodChannel.MethodCallHandler {
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "pdf_tools")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
    when (call.method) {
      "splitPdf" -> {
        val path = call.argument<String>("path")!!
        val file = File(path)
        val document = PDDocument.load(file)
        val splitter = Splitter()
        val docs = splitter.split(document)

        val outputPaths = mutableListOf<String>()
        var index = 0
        for (doc in docs) {
          val outPath = "${file.parent}/page_${index++}.pdf"
          doc.save(outPath)
          outputPaths.add(outPath)
          doc.close()
        }
        document.close()
        result.success(outputPaths)
      }

      "mergePdfs" -> {
        val paths = call.argument<List<String>>("paths")!!
        val merged = PDDocument()
        for (p in paths) {
          val doc = PDDocument.load(File(p))
          for (page in doc.pages) {
            merged.addPage(page)
          }
          doc.close()
        }
        val outPath = "${File(paths[0]).parent}/merged.pdf"
        merged.save(outPath)
        merged.close()
        result.success(outPath)
      }

      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {}
}
