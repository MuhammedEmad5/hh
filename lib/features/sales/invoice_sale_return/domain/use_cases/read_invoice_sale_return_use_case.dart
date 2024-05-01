import 'package:InvoiceF_Sales/core/utils/logger.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/mapper/invoice_sell_return_mapper.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/models/invoice_sell_return_model.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/repositories/invoice_sale_return_repo.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/entities/invoice_sell_return_entity/invoice_sell_return_entity_model.dart';

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
