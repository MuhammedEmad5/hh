import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

addFooter(
    PdfDocument document, double width, double height, PdfFont fontSmall) {
  var date = DateTime.now().toString().substring(0, 10);
  document.pages[document.pages.count - 1].graphics.drawString(
    'تصميم مؤسسة روائع الابتكار للبرمجة - https://www.appyinnovate.com\n رقم بطاقة الأحوال : 12312341421431 - هاتف 1 : اتصال :05500',
    fontSmall,
    brush: PdfBrushes.black,
    bounds: Rect.fromLTWH(width, height - fontSmall.height * 2, 0, 0),
    format: PdfStringFormat(
      textDirection: PdfTextDirection.rightToLeft,
      alignment: PdfTextAlignment.right,
    ),
  );
  document.pages[document.pages.count - 1].graphics.drawString(
    'تطبيق الفاتورة الإلكترونية\nPrinted at $date',
    fontSmall,
    brush: PdfBrushes.black,
    bounds: Rect.fromLTWH(0, height - fontSmall.height, 0, 0),
    format: PdfStringFormat(
        textDirection: PdfTextDirection.rightToLeft,
        lineAlignment: PdfVerticalAlignment.middle
        // alignment: PdfTextAlignment.right,
        ),
  );
}
