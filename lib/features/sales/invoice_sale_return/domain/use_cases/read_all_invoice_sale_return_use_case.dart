
import '../../data/mapper/invoice_sell_return_mapper.dart';
import '../../data/models/invoice_sell_return_model.dart';
import '../../data/repositories/invoice_sale_return_repo.dart';
import '../entities/invoice_sell_return_entity/invoice_sell_return_entity_model.dart';

class ReadAllInvoiceSalesReturnUseCase {
  final InvoiceSaleReturnRepo invoiceSaleReturnRepo;

  ReadAllInvoiceSalesReturnUseCase({required this.invoiceSaleReturnRepo});

  Future<List<InvoiceSellReturnEntity>> execute() async {
    final List<dynamic> invoiceSellReturnJsonArr =
        await invoiceSaleReturnRepo.getAll<InvoiceSellReturn>();
    final invoiceSellReturnObjects = invoiceSellReturnJsonArr
        .map((invoiceSellReturn) =>
            InvoiceSellReturn.fromJson(invoiceSellReturn))
        .toList();
    List<InvoiceSellReturnEntity> invoiceSellReturnEntity = [];
    for (InvoiceSellReturn invoiceSellReturn in invoiceSellReturnObjects) {
      invoiceSellReturnEntity
          .add(InvoiceSellReturnMapper().convert(invoiceSellReturn));
    }

    return invoiceSellReturnEntity;
  }
}
