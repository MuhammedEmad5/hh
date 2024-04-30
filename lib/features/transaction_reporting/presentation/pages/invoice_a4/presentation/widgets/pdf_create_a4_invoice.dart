// import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:InvoiceF_ClientVendor/features/shared/shared_entities/client_vendor_entity/client_vendor_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/shared/shared_entities/invoice_sell/invoice_sell_model.dart';
import 'package:InvoiceF_ClientVendor/features/shared/shared_entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/transaction_reporting/presentation/pages/invoice_a4/presentation/widgets/pdf_bottom_table.dart';
import 'package:InvoiceF_ClientVendor/features/transaction_reporting/presentation/pages/invoice_a4/presentation/widgets/pdf_client_table.dart';
import 'package:InvoiceF_ClientVendor/features/transaction_reporting/presentation/pages/invoice_a4/presentation/widgets/pdf_footer.dart';
import 'package:InvoiceF_ClientVendor/features/transaction_reporting/presentation/pages/invoice_a4/presentation/widgets/pdf_items_table.dart';
import 'package:InvoiceF_ClientVendor/features/transaction_reporting/presentation/pages/invoice_a4/presentation/widgets/pdf_vendor_table.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:xml/xml.dart' show XmlDocument;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:open_file/open_file.dart';

createA4InvoicePdf(
    type,
    List<InvoiceSellUnitEntity> items,
    ClientVendorEntity clientVendor,
    InvoiceSell invoice,
    ClientVendorEntity companyData) async {
  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  var directory = await Directory('${appDocDirectory.path}/einvoice/pdf/')
      .create(recursive: true);
  String title = '';
  ClientVendorEntity client = companyData;
  ClientVendorEntity vendor = companyData;
  switch (type) {
    case 0:
      title = 'فاتورة بيع\n Sell Invoice';
    case 1:
      title = 'فاتورة شراء\nPurchase Invoice';
    case 2:
      title = 'فاتورة مرتجع بيع\nSell Return Invoice';
    case 3:
      title = 'فاتورة مرتجع شراء\nPurchase Return Invoice';
    default:
  }
  if (type == 0 || type == 3) {
    client = clientVendor;
  } else {
    vendor = clientVendor;
  }
  final PdfDocument document =
      PdfDocument(conformanceLevel: PdfConformanceLevel.a3b);
  document.pageSettings.size = PdfPageSize.a4;
  PdfPage page = document.pages.add();
  double width = page.getClientSize().width;
  double height = page.getClientSize().height;
  PdfGraphics graphics = page.graphics;
  late Uint8List fontData;
  if (Platform.isWindows) {
    fontData = File('assets/fonts/arial.ttf').readAsBytesSync();
  } else {
    ByteData data = await rootBundle.load('assets/fonts/arial.ttf');
    fontData = data.buffer.asUint8List();
  }
  final PdfFont font = PdfTrueTypeFont(fontData, 12);
  final PdfFont fontSmall = PdfTrueTypeFont(fontData, 8);

  graphics.drawString(
    'الرقم الضريبى: 123456789',
    font,
    brush: PdfBrushes.black,
    bounds: Rect.fromLTWH(0, 0, width, 0),
    format: PdfStringFormat(
      textDirection: PdfTextDirection.rightToLeft,
      // alignment: PdfTextAlignment.right,
    ),
  );

  graphics.drawString(
    'هاتف: 12345678910 ت.س: 0123456',
    font,
    brush: PdfBrushes.black,
    bounds: Rect.fromLTWH(width, 0, 0, 0),
    format: PdfStringFormat(
      textDirection: PdfTextDirection.rightToLeft,
      alignment: PdfTextAlignment.right,
    ),
  );

  graphics.drawString(
    'Tax Invoice - فاتورة ضريبية',
    font,
    brush: PdfBrushes.black,
    bounds: Rect.fromLTWH(width, 20, 0, 0),
    format: PdfStringFormat(
      textDirection: PdfTextDirection.rightToLeft,
      alignment: PdfTextAlignment.right,
    ),
  );

  // ---------ICON---------
  late Uint8List imageData;
  if (Platform.isWindows) {
    imageData = File('assets/icon.png').readAsBytesSync();
  } else {
    ByteData data = await rootBundle.load('assets/icon.png');
    imageData = data.buffer.asUint8List();
  }
  final PdfBitmap image = PdfBitmap(imageData);
  graphics.drawImage(image, Rect.fromLTWH(width * 0.5 - 25, 35, 50, 50));

  graphics.drawString(
    title,
    font,
    brush: PdfBrushes.black,
    bounds: Rect.fromLTWH(width / 2, 90, 0, 0),
    format: PdfStringFormat(
      textDirection: PdfTextDirection.rightToLeft,
      alignment: PdfTextAlignment.center,
    ),
  );

  graphics.drawString(
    'الفرع: الفرع الرئيسى',
    font,
    brush: PdfBrushes.black,
    bounds: Rect.fromLTWH(0, 50, width, 0),
    format: PdfStringFormat(
      textDirection: PdfTextDirection.rightToLeft,
      // alignment: PdfTextAlignment.right,
    ),
  );

  graphics.drawString(
    'المخزن: المخزن 1',
    font,
    brush: PdfBrushes.black,
    bounds: Rect.fromLTWH(0, 70, width, 0),
    format: PdfStringFormat(
      textDirection: PdfTextDirection.rightToLeft,
      // alignment: PdfTextAlignment.right,
    ),
  );

  // ---------CLIENT SMALL TABLE---------
  final PdfGrid smallGrid = PdfGrid();
  smallGrid.style.font = fontSmall;
  smallGrid.columns.add(count: 3);
  smallGrid.columns[1].format = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.center,
  );

  smallGrid.columns[1].width = (width / 2 - 10) * 0.50;
  smallGrid.columns[2].width = (width / 2 - 10) * 0.26;

  smallGrid.columns[2].format = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.right,
  );
  PdfGridRow smallRow = smallGrid.rows.add();

  smallRow.cells[0].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow.cells[1].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
    right: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow.cells[2].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow.cells[0].value = 'Client';
  smallRow.cells[1].value =
      '${clientVendor.eName ?? ''} - ${clientVendor.aName ?? ''}';
  smallRow.cells[2].value = 'العميل';
  smallRow = smallGrid.rows.add();
  smallRow.cells[0].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow.cells[1].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
    right: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow.cells[2].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow.cells[0].value = 'Address';
  smallRow.cells[1].value = clientVendor.address ?? "";
  smallRow.cells[2].value = 'العنوان';
  smallRow = smallGrid.rows.add();
  smallRow.cells[0].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow.cells[1].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
    right: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow.cells[2].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow.cells[0].value = 'VAT No';
  smallRow.cells[1].value = clientVendor.VATID ?? "";
  smallRow.cells[2].value = 'الرقم الضريبى';
  smallGrid.style.cellPadding = PdfPaddings(left: 5, top: 5, right: 5);
  PdfLayoutResult upperGrid = smallGrid.draw(
      page: page,
      bounds: Rect.fromLTWH(0, 125, width / 2 - 10, 0)) as PdfLayoutResult;

  // ---------INVOICE NUMBER/DATE SMALL TABLE---------
  final PdfGrid smallGrid2 = PdfGrid();
  smallGrid2.style.font = fontSmall;
  smallGrid2.columns.add(count: 3);
  smallGrid2.columns[1].format = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.center,
  );
  smallGrid2.columns[2].format = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.right,
  );

  smallGrid2.columns[0].width = (width / 2 - 10) * 0.31;
  smallGrid2.columns[2].width = (width / 2 - 10) * 0.34;

  PdfGridRow smallRow2 = smallGrid2.rows.add();

  smallRow2.cells[0].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
    bottom: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow2.cells[1].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
    right: PdfPen.fromBrush(PdfBrushes.transparent),
    bottom: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow2.cells[2].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
    bottom: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow2.cells[0].value = 'Invoice Number';
  smallRow2.cells[1].value = '${invoice.invoiceNo}';
  smallRow2.cells[2].value = 'رقم الفاتورة';
  smallRow2 = smallGrid2.rows.add();
  smallRow2.cells[0].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
    top: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow2.cells[1].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
    right: PdfPen.fromBrush(PdfBrushes.transparent),
    top: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow2.cells[2].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
    top: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow2.cells[0].value = 'Invoice Issue Date';
  smallRow2.cells[1].value = invoice.dateG?.substring(0, 10) ?? "";
  smallRow2.cells[2].value = 'تاريخ اصدار الفاتورة';
  smallGrid2.style.cellPadding = PdfPaddings(left: 5, top: 5, right: 5);
  smallGrid2.draw(page: page, bounds: Rect.fromLTWH(width / 1.7, 50, width, 0));

  // ---------CLIENT SMALL TABLE 2 ---------
  final PdfGrid smallGrid3 = PdfGrid();
  smallGrid3.style.font = fontSmall;
  smallGrid3.columns.add(count: 2);
  smallGrid3.columns[0].format = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.right,
  );
  smallGrid3.columns[1].format = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.right,
  );

  var clientNameSize = font.measureString(clientVendor.aName ?? "");
  clientNameSize.width > 150
      ? smallGrid3.columns[0].width = (width / 1.7) * 0.17
      : null;
  PdfGridRow smallRow3 = smallGrid3.rows.add();

  smallRow3.cells[0].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow3.cells[1].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow3.cells[0].value = 'رقم\t${clientVendor.clientVendorNo}';
  smallRow3.cells[1].value = 'العميل\t${clientVendor.aName ?? ""}';
  smallRow3 = smallGrid3.rows.add();
  smallRow3.cells[0].style.borders = PdfBorders(
    right: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow3.cells[1].style.borders = PdfBorders(
    left: PdfPen.fromBrush(PdfBrushes.transparent),
  );
  smallRow3.cells[0].value = '';
  smallRow3.cells[1].value = 'الهاتف\t${clientVendor.mainContact1 ?? ""}';
  smallGrid3.style.cellPadding = PdfPaddings(left: 5, top: 5, right: 5);
  smallGrid3.draw(
      page: page,
      bounds: Rect.fromLTWH(
          width / 1.7, upperGrid.bounds.center.dy - 18, width, 0));

  // ---------CLIENT TABLE---------
  final PdfGrid grid = PdfGrid();
  addClientTable(grid, client, fontSmall);
  PdfLayoutResult clientGrid = grid.draw(
          page: page,
          bounds:
              Rect.fromLTWH(0, upperGrid.bounds.bottom + 20, width / 2 - 10, 0))
      as PdfLayoutResult;
  // ---------VENDOR TABLE---------
  final PdfGrid grid2 = PdfGrid();
  addVendorTable(grid2, fontSmall, vendor, clientVendor);
  PdfLayoutResult vendorGrid = grid2.draw(
          page: page,
          bounds: Rect.fromLTWH(
              width / 2 + 10, upperGrid.bounds.bottom + 20, width, 0))
      as PdfLayoutResult;

  graphics.drawString(
    'توصيف السلعة أو الخدمة - Line Items',
    font,
    brush: PdfBrushes.black,
    bounds: Rect.fromLTWH(
        width,
        clientGrid.bounds.bottom >= vendorGrid.bounds.bottom
            ? clientGrid.bounds.bottom + 20
            : vendorGrid.bounds.bottom + 20,
        0,
        0),
    format: PdfStringFormat(
      textDirection: PdfTextDirection.rightToLeft,
      alignment: PdfTextAlignment.right,
    ),
  );

  // ---------PRODUCTS TABLE---------
  final PdfGrid productsGrid = PdfGrid();
  productsGrid.style.font = fontSmall;
  productsGrid.columns.add(count: 10);
  final PdfGridRow productsHeaderRow = productsGrid.headers.add(1)[0];
  productsHeaderRow.cells[0].value =
      'Item Subtotal Including VAT\nالمجموع شامل ضريبة القيمة المضافة';
  productsHeaderRow.cells[1].value = 'Tax Amount\nمبلغ الضريبة';
  productsHeaderRow.cells[2].value = 'Tax Rate\nنسبة الضريبة';
  productsHeaderRow.cells[3].value = 'Taxable Amount\nالمبلغ الخاضع للضريبة';
  productsHeaderRow.cells[4].value = 'Discount\nالخصومات';
  productsHeaderRow.cells[5].value = 'Quantity\nالكمية';
  productsHeaderRow.cells[6].value = 'Unit Price\nسعر الوحدة';
  productsHeaderRow.cells[7].value = 'UOM\nالوحدة';
  productsHeaderRow.cells[8].value =
      'Nature of Goods or Service\nتفاصيل السلعة او الخدمة';
  productsHeaderRow.cells[9].value = '#';
  productsHeaderRow.style.backgroundBrush = PdfBrushes.lightGray;

  productsGrid.columns[0].width = width * 0.10;
  productsGrid.columns[8].width = width * 0.23;
  for (var i = 0; i < productsGrid.columns.count; i++) {
    productsGrid.columns[i].format = PdfStringFormat(
      textDirection: PdfTextDirection.rightToLeft,
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );
  }
  items.sort((a, b) => a.orderNo.compareTo(b.orderNo));
  items.forEach((item) {
    PdfGridRow productsRow = productsGrid.rows.add();
    productsRow.cells[0].value = '${item.totalPlusTax}';
    productsRow.cells[1].value = '${item.taxRate1_Total}';
    productsRow.cells[2].value = '${item.taxRate1_Percentage * 100}%';
    productsRow.cells[3].value = '${item.total}';
    productsRow.cells[4].value = '${item.discount}';
    productsRow.cells[5].value = '${item.quantity}';
    productsRow.cells[6].value = '${item.price}';
    productsRow.cells[7].value = 'Unit';
    productsRow.cells[8].value = '${item.aName}\n${item.eName}';
    productsRow.cells[9].value = '${item.orderNo}';
  });
  productsGrid.style.cellPadding = PdfPaddings(left: 5, top: 5, right: 5);
  PdfLayoutResult itemsGrid = productsGrid.draw(
      page: page,
      bounds: Rect.fromLTWH(
          0,
          clientGrid.bounds.bottom >= vendorGrid.bounds.bottom
              ? clientGrid.bounds.bottom + 40
              : vendorGrid.bounds.bottom + 40,
          width,
          0)) as PdfLayoutResult;

  late PdfPage page2;
  if (itemsGrid.bounds.bottom > 585.5 && items.length < 2) {
    page2 = document.pages.add();
    page2.graphics.drawString(
      'اجمالى المبلغ - Total Amount:',
      font,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(width, 0, 0, 0),
      format: PdfStringFormat(
        textDirection: PdfTextDirection.rightToLeft,
        alignment: PdfTextAlignment.right,
      ),
    );
  } else if (itemsGrid.bounds.bottom > 585.5 && items.length <= 8) {
    page2 = document.pages.add();
    page2.graphics.drawString(
      'اجمالى المبلغ - Total Amount:',
      font,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(width, 0, 0, 0),
      format: PdfStringFormat(
        textDirection: PdfTextDirection.rightToLeft,
        alignment: PdfTextAlignment.right,
      ),
    );
  } else if (items.length > 8) {
    document.pages[document.pages.count - 1].graphics.drawString(
      'اجمالى المبلغ - Total Amount:',
      font,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(width, itemsGrid.bounds.bottom + 20, 0, 0),
      format: PdfStringFormat(
        textDirection: PdfTextDirection.rightToLeft,
        alignment: PdfTextAlignment.right,
      ),
    );
  } else {
    document.pages[document.pages.count - 1].graphics.drawString(
      'اجمالى المبلغ - Total Amount:',
      font,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(width, itemsGrid.bounds.bottom + 20, 0, 0),
      format: PdfStringFormat(
        textDirection: PdfTextDirection.rightToLeft,
        alignment: PdfTextAlignment.right,
      ),
    );
  }

  // ------BOTTOM TABLE--------
  final PdfGrid bottomTable = PdfGrid();
  addBottomTable(bottomTable, fontSmall, width, invoice);
  if (itemsGrid.bounds.bottom > 585.5 && items.length < 2) {
    bottomTable.draw(
        page: document.pages[document.pages.count - 1],
        bounds: Rect.fromLTWH(0, 20, width, 0));
  } else if (itemsGrid.bounds.bottom > 585.5 && items.length <= 8) {
    bottomTable.draw(
        page: document.pages[document.pages.count - 1],
        bounds: Rect.fromLTWH(0, 20, width, 0));
  } else if (items.length > 8) {
    bottomTable.draw(
        page: document.pages[document.pages.count - 1],
        bounds: Rect.fromLTWH(0, itemsGrid.bounds.bottom + 40, width, 0));
  } else {
    bottomTable.draw(
        page: document.pages[document.pages.count - 1],
        bounds: Rect.fromLTWH(0, itemsGrid.bounds.bottom + 40, width, 0));
  }
  addFooter(document, width, height, fontSmall);

  File('${directory.path}pdfFile.pdf').writeAsBytes(await document.save());
  document.dispose();
  OpenFile.open('${directory.path}pdfFile.pdf');

  print('${directory.path}pdfFile.pdf');
}
