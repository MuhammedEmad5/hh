
import '../../data/models/invoice_sell_return_model.dart';
import '../../data/repositories/invoice_sale_return_repo.dart';

class CreateInvoiceSaleReturnUseCase {
  final InvoiceSaleReturnRepo invoiceSaleReturnRepo;

  CreateInvoiceSaleReturnUseCase({required this.invoiceSaleReturnRepo});

  Future<void> execute(InvoiceSellReturn invoiceSellReturnEntity) async {
    // final InvoiceSellReturn invoiceSellReturn =
    //     InvoiceSellMapper().convert(invoiceSellReturnEntity);
    await invoiceSaleReturnRepo.insert(invoiceSellReturnEntity);
  }
}
