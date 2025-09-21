# pdf_tools

**Flutter PDF Tools** – A Flutter plugin to **split** and **merge** PDF files with full page fidelity.  
Supports **Android, iOS, macOS, and Windows**.  

> ⚠️ This project is released **for personal and non-commercial use only**.  
> Commercial use is prohibited without prior written permission from the author.  

---

## ✨ Features
- PDF **split** → export each page as an individual PDF  
- PDF **merge** → combine multiple PDFs into a single document  
- Cross-platform support:
  - **Android** → Apache PDFBox  
  - **iOS & macOS** → Apple PDFKit  
  - **Windows** → qpdf  

---

## 🚀 Installation
Add to your `pubspec.yaml`:

```yaml
dependencies:
  pdf_tools:
    git:
      url: https://github.com/wayxinc/pdf_tools

---

## Usage 

import 'package:pdf_tools/pdf_tools.dart';

void main() async {
  // Split
  final pages = await PdfTools.splitPdf("/path/to/input.pdf");
  print("Pages saved: $pages");

  // Merge
  final merged = await PdfTools.mergePdfs([
    "/path/to/page_0.pdf",
    "/path/to/page_1.pdf",
  ]);
  print("Merged file: $merged");
}

See the LICENSE
 file for details.