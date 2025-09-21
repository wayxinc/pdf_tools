#ifndef FLUTTER_PLUGIN_PDF_TOOLS_PLUGIN_H_
#define FLUTTER_PLUGIN_PDF_TOOLS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace pdf_tools {

class PdfToolsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PdfToolsPlugin();

  virtual ~PdfToolsPlugin();

  // Disallow copy and assign.
  PdfToolsPlugin(const PdfToolsPlugin&) = delete;
  PdfToolsPlugin& operator=(const PdfToolsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace pdf_tools

#endif  // FLUTTER_PLUGIN_PDF_TOOLS_PLUGIN_H_
