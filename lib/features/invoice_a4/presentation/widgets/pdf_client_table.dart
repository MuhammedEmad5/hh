import 'package:syncfusion_flutter_pdf/pdf.dart';

addClientTable(grid, client, fontSmall) {
  grid.style.font = fontSmall;
  grid.columns.add(count: 2);
  final PdfGridRow headerRow = grid.headers.add(1)[0];
  headerRow.cells[0].value = 'Buyer';
  headerRow.cells[1].value = 'العميل';
  headerRow.style.backgroundBrush = PdfBrushes.lightGray;
  PdfStringFormat format = PdfStringFormat(
    textDirection: PdfTextDirection.rightToLeft,
    alignment: PdfTextAlignment.right,
  );
  grid.columns[1].format = format;
  PdfGridRow row = grid.rows.add();
  row.cells[0].value = 'Name\t${client.eName ?? ""}';
  row.cells[1].value = 'الاسم\t${client.aName ?? ""}';
  row = grid.rows.add();
  row.cells[0].value = 'Building No.\t${client.apartmentNum ?? ""}';
  row.cells[1].value = 'رقم المبنى\t${client.apartmentNum ?? ""}';
  row = grid.rows.add();
  row.cells[0].value = 'Street Name\t${client.street_Eng ?? ""}';
  row.cells[1].value = 'اسم الشارع\t${client.street_Arb ?? ""}';
  row = grid.rows.add();
  row.cells[0].value = 'District\t${client.district_Eng ?? ""}';
  row.cells[1].value = 'الحى\t${client.district_Arb ?? ""}';
  row = grid.rows.add();
  row.cells[0].value = 'City\t${client.city_Eng ?? ""}';
  row.cells[1].value = 'المدينة\t${client.city_Arb ?? ""}';
  row = grid.rows.add();
  row.cells[0].value = 'Country\t${client.country_Eng}';
  row.cells[1].value = 'البلد\t${client.country_Arb}';
  row = grid.rows.add();
  row.cells[0].value = 'Postal Code\t${client.POBox ?? ""}';
  row.cells[1].value = 'الرمز البريدى\t${client.POBox ?? ""}';
  row = grid.rows.add();
  row.cells[0].value = 'Additional No.\t${client.POBoxAdditionalNum ?? ""}';
  row.cells[1].value =
      'الرقم الاضافى للعنوان\t${client.POBoxAdditionalNum ?? ""}';
  row = grid.rows.add();
  row.cells[0].value = 'VAT No.\n${client.VATID ?? ""}';
  row.cells[1].value = 'رقم تسجيل ضريبة القيمة المضافة\t${client.VATID ?? ""}';
  row = grid.rows.add();
  row.cells[0].value = 'Other Seller ID\t${client.secondBusinessID ?? ""}';
  row.cells[1].value = 'معرف اخر\t${client.secondBusinessID ?? ""}';
  grid.style.cellPadding = PdfPaddings(left: 5, top: 5, right: 5);
}
