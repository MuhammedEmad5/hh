import 'package:InvoiceF/features/sales/pos_sell_invoice/data/models/invoice_sell_model.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';

class DeleteInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  DeleteInvoiceSellUseCase({required this.invoiceSellRepo});

  Future<void> execute({required num id}) async {
    await invoiceSellRepo.delete<InvoiceSell>(id: id);
  }
}
