import 'package:InvoiceF/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';
import 'package:InvoiceF/features/purchase/purchase_invoice/domain/entities/invoice_buy_unit/invoice_buy_unit_entity_model.dart';
import 'package:InvoiceF/features/shared/shared_entities/item_entity/item_entity_model.dart';

class SearchItemInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  SearchItemInvoiceBuyUseCase({required this.invoiceBuyRepo});
  Future<InvoiceBuyUnitEntity> execute(String barCode, String invoiceNo) async {
    final itemDataRes = await invoiceBuyRepo.searchItem(barCode, invoiceNo);
    late InvoiceBuyUnitEntity item;
    try {
      var itemData = ItemEntity.fromJson(itemDataRes[0]);
      item = InvoiceBuyUnitEntity(
          invoiceNo: int.parse(invoiceNo),
          orderNo: 1,
          quantity: 1,
          aName: itemData.aName,
          eName: itemData.eName,
          itemNo: itemData.itemNo,
          price: itemData.sellPrice);
    } catch (e) {
      print(e);
    }
    return item;
  }
}
