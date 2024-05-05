import 'package:InvoiceF/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';
import 'package:InvoiceF/features/purchase/purchase_invoice/domain/entities/invoice_buy_unit/invoice_buy_unit_entity_model.dart';

class GetItemsInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  GetItemsInvoiceBuyUseCase({required this.invoiceBuyRepo});
  Future<List<InvoiceBuyUnitEntity>> execute(String invoiceNo) async {
    final itemsData = await invoiceBuyRepo.getItems(invoiceNo);
    List<InvoiceBuyUnitEntity> items = [];
    try {
      for (var element in itemsData) {
        items.add(InvoiceBuyUnitEntity.fromJson(element));
      }
    } catch (e) {
      print(e);
    }
    return items;
  }
}
