import 'package:InvoiceF/features/purchase/purchase_return_invoice/data/models/invoice_buy_return_model.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/data/repositories/purchase_return_invoice_repo.dart';

class CreatePurchaseReturnInvoiceUseCase {
  final PurchaseReturnInvoiceRepo purchaseReturnInvoiceRepo;

  CreatePurchaseReturnInvoiceUseCase({required this.purchaseReturnInvoiceRepo});

  Future<void> execute(InvoiceBuyReturn invoiceBuyReturnEntity) async {
    // final InvoiceBuyReturn invoiceBuyReturn =
    //     InvoiceBuyMapper().convert(invoiceBuyReturnEntity);
    await purchaseReturnInvoiceRepo.insert(invoiceBuyReturnEntity);
  }
}
