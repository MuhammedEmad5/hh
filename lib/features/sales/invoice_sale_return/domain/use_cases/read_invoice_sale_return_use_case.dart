import '../../../../../core/utils/logger.dart';
import '../../data/mapper/invoice_sell_return_mapper.dart';
import '../../data/models/invoice_sell_return_model.dart';
import '../../data/repositories/invoice_sale_return_repo.dart';
import '../entities/invoice_sell_return_entity/invoice_sell_return_entity_model.dart';

class ReadInvoiceSaleReturnUseCase {
  final InvoiceSaleReturnRepo invoiceSaleReturnRepo;

  ReadInvoiceSaleReturnUseCase({required this.invoiceSaleReturnRepo});

  Future<InvoiceSellReturnEntity> execute({required double id}) async {
    final invoiceSellReturnJsonArr =
        await invoiceSaleReturnRepo.getOne<InvoiceSellReturn>(id: id);
    final invoiceSellReturnData = invoiceSellReturnJsonArr.first;
    final invoiceSellReturnObject =
        InvoiceSellReturn.fromJson(invoiceSellReturnData);
    final InvoiceSellReturnEntity invoiceSellReturnEntityObject =
        InvoiceSellReturnMapper().convert(invoiceSellReturnObject);
    LoggerSingleton.logger.i(invoiceSellReturnEntityObject.toJson());

    return invoiceSellReturnEntityObject;
  }
}
