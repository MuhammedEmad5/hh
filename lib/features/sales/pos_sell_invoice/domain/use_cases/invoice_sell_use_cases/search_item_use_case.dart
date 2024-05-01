import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/domain/entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
import 'package:InvoiceF_Sales/features/shared/shared_entities/item_entities/item_entity_model.dart';

class SearchItemInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  SearchItemInvoiceSellUseCase({required this.invoiceSellRepo});
  Future<InvoiceSellUnitEntity> execute(
      String barCode, String invoiceNo) async {
    final itemDataRes = await invoiceSellRepo.searchItem(barCode, invoiceNo);
    late InvoiceSellUnitEntity item;
    try {
      var itemData = ItemEntity.fromJson(itemDataRes[0]);
      item = InvoiceSellUnitEntity(
          invoiceNo: int.parse(invoiceNo),
          orderNo: 1,
          quantity: 1,
          // buildingNo: itemData.,
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
