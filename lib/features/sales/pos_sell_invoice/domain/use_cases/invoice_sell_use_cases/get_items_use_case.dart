
import '../../../data/repositories/invoice_sell_repo_impl.dart';
import '../../entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';

class GetItemsUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  GetItemsUseCase({required this.invoiceSellRepo});
  Future<List<InvoiceSellUnitEntity>> execute(String invoiceNo) async {
    final items = await invoiceSellRepo.getItems(invoiceNo);
    return items;
  }
}
