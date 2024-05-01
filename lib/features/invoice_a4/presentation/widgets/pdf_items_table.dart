// import 'package:syncfusion_flutter_pdf/pdf.dart';

// addItemsTable(productsGrid, fontSmall, width, items) {
//   productsGrid.style.font = fontSmall;
//   productsGrid.columns.add(count: 10);
//   final PdfGridRow productsHeaderRow = productsGrid.headers.add(1)[0];
//   productsHeaderRow.cells[0].value =
//       'Item Subtotal Including VAT\nالمجموع شامل ضريبة القيمة المضافة';
//   productsHeaderRow.cells[1].value = 'Tax Amount\nمبلغ الضريبة';
//   productsHeaderRow.cells[2].value = 'Tax Rate\nنسبة الضريبة';
//   productsHeaderRow.cells[3].value = 'Taxable Amount\nالمبلغ الخاضع للضريبة';
//   productsHeaderRow.cells[4].value = 'Discount\nالخصومات';
//   productsHeaderRow.cells[5].value = 'Quantity\nالكمية';
//   productsHeaderRow.cells[6].value = 'Unit Price\nسعر الوحدة';
//   productsHeaderRow.cells[7].value = 'UOM\nالوحدة';
//   productsHeaderRow.cells[8].value =
//       'Nature of Goods or Service\nتفاصيل السلعة او الخدمة';
//   productsHeaderRow.cells[9].value = '#';
//   productsHeaderRow.style.backgroundBrush = PdfBrushes.lightGray;

//   productsGrid.columns[0].width = width * 0.10;
//   productsGrid.columns[8].width = width * 0.23;
//   for (var i = 0; i < productsGrid.columns.count; i++) {
//     productsGrid.columns[i].format = PdfStringFormat(
//       textDirection: PdfTextDirection.rightToLeft,
//       alignment: PdfTextAlignment.center,
//       lineAlignment: PdfVerticalAlignment.middle,
//     );
//   }
//   items.sort((a, b) => a.orderNo.compareTo(b.orderNo));
//   items.forEach((item) {
//     PdfGridRow productsRow = productsGrid.rows.add();
//     productsRow.cells[0].value = '${item.totalPlusTax}';
//     productsRow.cells[1].value = '${item.taxRate1_Total}';
//     productsRow.cells[2].value = '${item.taxRate1_Percentage * 100}%';
//     productsRow.cells[3].value = '${item.total}';
//     productsRow.cells[4].value = '${item.discount}';
//     productsRow.cells[5].value = '${item.quantity}';
//     productsRow.cells[6].value = '${item.price}';
//     productsRow.cells[7].value = 'Unit';
//     productsRow.cells[8].value = '${item.aName}\n${item.eName}';
//     productsRow.cells[9].value = '${item.orderNo}';
//   });
//   productsGrid.style.cellPadding = PdfPaddings(left: 5, top: 5, right: 5);
// }
