
import '../../data/models/invoice_buy_return_model.dart';
import '../../data/repositories/purchase_return_invoice_repo.dart';

class DeletePurchaseReturnInvoiceUseCase {
  final PurchaseReturnInvoiceRepo purchaseReturnInvoiceRepo;

  DeletePurchaseReturnInvoiceUseCase({required this.purchaseReturnInvoiceRepo});

  Future<void> execute({required num id}) async {
    await purchaseReturnInvoiceRepo.delete<InvoiceBuyReturn>(id: id);
  }
}
