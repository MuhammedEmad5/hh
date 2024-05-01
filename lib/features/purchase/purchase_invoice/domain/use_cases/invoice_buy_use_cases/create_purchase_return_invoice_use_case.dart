import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/models/invoice_buy_return_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/repositories/purchase_return_invoice_repo.dart';

class InsertPurchaseReturnInvoiceUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  InsertPurchaseReturnInvoiceUseCase({required this.invoiceBuyRepo});

  Future<void> execute(InvoiceBuyReturn invoiceBuyReturnEntity) async {
    await invoiceBuyRepo.insert(invoiceBuyReturnEntity);
  }
}
