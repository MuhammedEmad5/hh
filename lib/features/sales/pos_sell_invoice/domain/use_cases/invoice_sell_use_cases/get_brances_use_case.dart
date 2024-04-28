
import '../../../data/repositories/invoice_sell_repo_impl.dart';

class GetBranchesUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  GetBranchesUseCase({required this.invoiceSellRepo});
  Future<List> execute() async {
    final branches = await invoiceSellRepo.getBranches();
    return branches;
  }
}
