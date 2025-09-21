#include "include/pdf_tools/pdf_tools_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "pdf_tools_plugin.h"

void PdfToolsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  pdf_tools::PdfToolsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
