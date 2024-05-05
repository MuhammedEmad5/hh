import 'package:InvoiceF/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';

class GetItemsInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  GetItemsInvoiceSellUseCase({required this.invoiceSellRepo});
  Future<List<InvoiceSellUnitEntity>> execute(String invoiceNo) async {
    final itemsData = await invoiceSellRepo.getItems(invoiceNo);
    List<InvoiceSellUnitEntity> items = [];
    try {
      for (var element in itemsData) {
        items.add(InvoiceSellUnitEntity.fromJson(element));
      }
    } catch (e) {
      print(e);
    }
    return items;
  }
}
