import 'package:syncfusion_flutter_pdf/pdf.dart';

addBottomTable(bottomTable, fontSmall, width, invoice) {
  bottomTable.style.font = fontSmall;
  bottomTable.columns.add(count: 4);
  bottomTable.columns[2].format = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.right,
  );
  bottomTable.columns[0].format = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.right,
  );

  bottomTable.columns[0].width = width * 0.3;
  bottomTable.columns[1].width = width * 0.13;
  bottomTable.columns[3].width = width * 0.13;
  PdfGridRow totalRow = bottomTable.rows.add();
  totalRow.cells[0].value = 'المدفوع - Paid';
  totalRow.cells[1].value = '${invoice.amountCalculatedPayed} SAR';
  totalRow.cells[2].value =
      'الاجمالي - غير شامل ضريبة القيمة المضافة - Total Exculding VAT';
  totalRow.cells[3].value = '${invoice.subTotal} SAR';
  totalRow = bottomTable.rows.add();
  totalRow.cells[0].value = 'المتبقي - Left Amount';
  totalRow.cells[1].value = '${invoice.amountLeft} SAR';
  totalRow.cells[2].value = 'مجموع الخصومات - Discount';
  totalRow.cells[3].value = '${invoice.subTotalDiscount} SAR';
  totalRow = bottomTable.rows.add();
  totalRow.cells[0].value = 'م.السلع والخدمات - Quantity';
  totalRow.cells[1].value = '${invoice.subQuantity}';
  totalRow.cells[2].value =
      'الاجمالي الخاضع للضريبة - غير شاملة ضريبة القيمة المضافة \n Total Taxable Amount - Excluding VAT';
  totalRow.cells[3].value = '${invoice.subNetTotal} SAR';
  totalRow = bottomTable.rows.add();
  totalRow.cells[0].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
  );

  totalRow.cells[1].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
    left: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  totalRow.cells[2].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  totalRow.cells[0].value = '';
  totalRow.cells[2].value = 'مجموع ضريبة القيمة المضافة - Total VAT';
  totalRow.cells[3].value = '${invoice.taxRate1_Total} SAR';
  totalRow = bottomTable.rows.add();
  totalRow.cells[0].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  totalRow.cells[1].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
    left: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  totalRow.cells[2].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  totalRow.cells[0].value = '';
  totalRow.cells[2].value =
      'اجمالي المبلغ المستحق بعد الضريبة - Total Amount Due';
  totalRow.cells[3].value = '${invoice.subNetTotalPlusTax} SAR';
  bottomTable.style.cellPadding = PdfPaddings(left: 5, top: 5, right: 5);
}
