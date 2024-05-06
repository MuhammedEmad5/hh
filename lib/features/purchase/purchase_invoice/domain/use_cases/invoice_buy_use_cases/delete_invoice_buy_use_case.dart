import 'package:InvoiceF/features/purchase/purchase_invoice/data/models/invoice_buy_model.dart';
import 'package:InvoiceF/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';

class DeleteInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  DeleteInvoiceBuyUseCase({required this.invoiceBuyRepo});

  Future<void> execute({required num id}) async {
    await invoiceBuyRepo.delete<InvoiceBuy>(id: id);
  }
}
