import 'package:InvoiceF/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
import 'package:InvoiceF/features/shared/shared_entities/item_entities/item_entity_model.dart';

class SearchItemInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  SearchItemInvoiceSellUseCase({required this.invoiceSellRepo});
  Future<InvoiceSellUnitEntity> execute(
      String barcode, String invoiceNo) async {
    final itemDataRes = await invoiceSellRepo.searchItem(barcode, invoiceNo);
    late InvoiceSellUnitEntity item;
    try {
      var itemData = ItemEntity.fromJson(itemDataRes[0]);
      item = InvoiceSellUnitEntity(
        invoiceNo: int.parse(invoiceNo),
        orderNo: 1,
        quantity: 1,
        aName: itemData.aName,
        eName: itemData.eName,
        itemNo: itemData.itemNo,
        price: itemData.sellPrice,
        taxRate1_Percentage: itemData.taxPercent,
        taxRate1_Total:
            itemData.taxPercent * (itemData.sellPrice - itemData.discount),
        discountPercent: itemData.discount_Percentage,
        discount: itemData.discount,
        barCode: itemData.barCode,
      );
    } catch (e) {
      print(e);
    }
    return item;
  }
}
