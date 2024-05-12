import 'package:InvoiceF/core/model/business_model.dart';
import 'package:InvoiceF/core/model/json_model.dart';
import 'package:InvoiceF/core/navigation/navigation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/src/datagrid_widget/sfdatagrid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'tax_declaration_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TaxDeclaration implements BusinessModel {
  int? buildingNo;
  int VATTypeNo;
  int VATBillType;
  String aName;
  String eName;
  num PurchaseAmount;
  num PurchaseAmount_Tax_Total;
  num SalesAmount;
  num SalesAmount_Tax_Total;
  int countBills;
  TaxDeclaration({
    this.buildingNo,
    required this.VATTypeNo,
    required this.VATBillType,
    required this.aName,
    required this.eName,
    required this.PurchaseAmount,
    required this.PurchaseAmount_Tax_Total,
    required this.SalesAmount,
    required this.SalesAmount_Tax_Total,
    required this.countBills,
  });

  @override
  factory TaxDeclaration.fromJson(Map<String, dynamic> json) =>
      _$TaxDeclarationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TaxDeclarationToJson(this);

  @override
  List<String> getColumnNames() => [
        AppLocalizations.of(AppNavigation.context)!.number,
        AppLocalizations.of(AppNavigation.context)!.arabic_name,
        AppLocalizations.of(AppNavigation.context)!.english_name,
        AppLocalizations.of(AppNavigation.context)!.purchase_amount,
        AppLocalizations.of(AppNavigation.context)!.purchase_tax_total,
        AppLocalizations.of(AppNavigation.context)!.sales_amount,
        AppLocalizations.of(AppNavigation.context)!.sales_tax_total,
        AppLocalizations.of(AppNavigation.context)!.no_of_bills,
      ];

  int getColumnNumber(String columnName) {
    return getColumnNames().indexOf(columnName);
  }

  @override
  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<int>(
          columnName: AppLocalizations.of(AppNavigation.context)!.number,
          value: VATTypeNo),
      DataGridCell<String>(
          columnName: AppLocalizations.of(AppNavigation.context)!.arabic_name,
          value: aName),
      DataGridCell<String>(
          columnName: AppLocalizations.of(AppNavigation.context)!.english_name,
          value: eName),
      DataGridCell<num>(
          columnName:
              AppLocalizations.of(AppNavigation.context)!.purchase_amount,
          value: PurchaseAmount),
      DataGridCell<num>(
          columnName:
              AppLocalizations.of(AppNavigation.context)!.purchase_tax_total,
          value: PurchaseAmount_Tax_Total),
      DataGridCell<num>(
          columnName: AppLocalizations.of(AppNavigation.context)!.sales_amount,
          value: SalesAmount),
      DataGridCell<num>(
          columnName:
              AppLocalizations.of(AppNavigation.context)!.sales_tax_total,
          value: SalesAmount_Tax_Total),
      DataGridCell<int>(
          columnName: AppLocalizations.of(AppNavigation.context)!.no_of_bills,
          value: countBills),
    ]);
  }
}
