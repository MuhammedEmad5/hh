import 'package:InvoiceF_ClientVendor/features/shared/shared_entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/transaction_reporting/presentation/pages/invoice_a4/data/repositories/invoice_a4_repo_impl.dart';

class GetInvoiceItemsInvoiceA4UseCase {
  final InvoiceA4Repo invoiceA4Repo;

  GetInvoiceItemsInvoiceA4UseCase({required this.invoiceA4Repo});
  Future<List<InvoiceSellUnitEntity>> execute(
      String invoiceNo, String buildingNo, String table) async {
    final items =
        await invoiceA4Repo.getInvoiceItems(invoiceNo, buildingNo, table);
    List<InvoiceSellUnitEntity> invoiceSellUnits = [];
    try {
      if (items.isNotEmpty) {
        for (var element in items) {
          invoiceSellUnits.add(InvoiceSellUnitEntity.fromJson(element));
          print(InvoiceSellUnitEntity.fromJson(element));
        }
      }
    } catch (e) {
      print(e);
      invoiceSellUnits = [];
      invoiceSellUnits.add(
        InvoiceSellUnitEntity(
          invoiceNo: 0,
          aName: '',
          eName: '',
        ),
      );
    }
    return invoiceSellUnits;
  }
}
