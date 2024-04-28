
import '../../../data/repositories/invoice_sell_repo_impl.dart';

class GetLastIndexUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  GetLastIndexUseCase({required this.invoiceSellRepo});
  Future<String> execute(String tName, String key) async {
    final index = await invoiceSellRepo.getLastIndex(tName, key);
    return index;
  }
}
