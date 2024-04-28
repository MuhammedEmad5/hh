
import '../../../data/repositories/invoice_sell_repo_impl.dart';
import '../../entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';

class SearchItemUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  SearchItemUseCase({required this.invoiceSellRepo});
  Future<InvoiceSellUnitEntity> execute(
      String barCode, String invoiceNo) async {
    final item = await invoiceSellRepo.searchItem(barCode, invoiceNo);
    return item;
  }
}
