
import '../../data/models/invoice_buy_return_model.dart';
import '../../data/repositories/purchase_return_invoice_repo.dart';

class CreatePurchaseReturnInvoiceUseCase {
  final PurchaseReturnInvoiceRepo purchaseReturnInvoiceRepo;

  CreatePurchaseReturnInvoiceUseCase({required this.purchaseReturnInvoiceRepo});

  Future<void> execute(InvoiceBuyReturn invoiceBuyReturnEntity) async {
    // final InvoiceBuyReturn invoiceBuyReturn =
    //     InvoiceBuyMapper().convert(invoiceBuyReturnEntity);
    await purchaseReturnInvoiceRepo.insert(invoiceBuyReturnEntity);
  }
}
