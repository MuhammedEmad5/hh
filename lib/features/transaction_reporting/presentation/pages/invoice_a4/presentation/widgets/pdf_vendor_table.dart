import 'package:syncfusion_flutter_pdf/pdf.dart';

addVendorTable(grid2, fontSmall, vendor, clientVendor) {
  grid2.style.font = fontSmall;
  grid2.columns.add(count: 2);
  final PdfGridRow headerRow2 = grid2.headers.add(1)[0];
  headerRow2.cells[0].value = 'ٍSeller';
  headerRow2.cells[1].value = 'المورد';
  headerRow2.style.backgroundBrush = PdfBrushes.lightGray;
  PdfStringFormat format2 = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.right,
  );
  grid2.columns[1].format = format2;
  PdfGridRow row2 = grid2.rows.add();
  row2.cells[0].value = 'Name\t${vendor.eName ?? ""}';
  row2.cells[1].value = 'الاسم\t${vendor.aName ?? ""}';
  row2 = grid2.rows.add();
  row2.cells[0].value = 'Building No.\t${vendor.apartmentNum ?? ""}';
  row2.cells[1].value = 'رقم المبنى\t${vendor.apartmentNum ?? ""}';
  row2 = grid2.rows.add();
  row2.cells[0].value = 'Street Name\t${vendor.street_Eng ?? ""}';
  row2.cells[1].value = 'اسم الشارع\t${vendor.street_Arb ?? ""}';
  row2 = grid2.rows.add();
  row2.cells[0].value = 'District\t${vendor.district_Eng ?? ""}';
  row2.cells[1].value = 'الحى\t${vendor.district_Arb ?? ""}';
  row2 = grid2.rows.add();
  row2.cells[0].value = 'City\t${vendor.city_Eng ?? ""}';
  row2.cells[1].value = 'المدينة\t${vendor.city_Arb ?? ""}';
  row2 = grid2.rows.add();
  row2.cells[0].value = 'Country\t${vendor.country_Eng}';
  row2.cells[1].value = 'البلد\t${vendor.country_Arb}';
  row2 = grid2.rows.add();
  row2.cells[0].value = 'Postal Code\t${vendor.POBox ?? ""}';
  row2.cells[1].value = 'الرمز البريدى\t${vendor.POBox ?? ""}';
  row2 = grid2.rows.add();
  row2.cells[0].value = 'Additional No.\t${vendor.POBoxAdditionalNum ?? ""}';
  row2.cells[1].value =
      'الرقم الاضافى للعنوان\t${vendor.POBoxAdditionalNum ?? ""}';
  row2 = grid2.rows.add();
  row2.cells[0].value = 'VAT No.\n${vendor.VATID ?? ""}';
  row2.cells[1].value = 'رقم تسجيل ضريبة القيمة المضافة\t${vendor.VATID ?? ""}';
  row2 = grid2.rows.add();
  row2.cells[0].value =
      'Other Seller ID\t${clientVendor.secondBusinessID ?? ""}';
  row2.cells[1].value = 'معرف اخر\t${clientVendor.secondBusinessID ?? ""}';
  grid2.style.cellPadding = PdfPaddings(left: 5, top: 5, right: 5);
}
