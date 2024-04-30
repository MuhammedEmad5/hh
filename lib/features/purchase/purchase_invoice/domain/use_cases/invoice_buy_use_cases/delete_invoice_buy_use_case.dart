
import '../../../data/models/invoice_buy_model.dart';
import '../../../data/repositories/invoice_buy_repo_impl.dart';

class DeleteInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  DeleteInvoiceBuyUseCase({required this.invoiceBuyRepo});

  Future<void> execute({required num id}) async {
    await invoiceBuyRepo.delete<InvoiceBuy>(id: id);
  }
}
