
import '../../data/models/invoice_sell_return_model.dart';
import '../../data/repositories/invoice_sale_return_repo.dart';

class DeleteInvoiceSaleReturnUseCase {
  final InvoiceSaleReturnRepo invoiceSaleReturnRepo;

  DeleteInvoiceSaleReturnUseCase({required this.invoiceSaleReturnRepo});

  Future<void> execute({required num id}) async {
    await invoiceSaleReturnRepo.delete<InvoiceSellReturn>(id: id);
  }
}
