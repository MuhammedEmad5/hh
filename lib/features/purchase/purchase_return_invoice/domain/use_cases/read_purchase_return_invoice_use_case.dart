
import '../../../../../core/utils/logger.dart';
import '../../data/mapper/invoice_buy_return_mapper.dart';
import '../../data/models/invoice_buy_return_model.dart';
import '../../data/repositories/purchase_return_invoice_repo.dart';
import '../entities/invoice_buy_return_entity/invoice_buy_return_entity_model.dart';

class ReadPurchaseReturnInvoiceUseCase {
  final PurchaseReturnInvoiceRepo purchaseReturnInvoiceRepo;

  ReadPurchaseReturnInvoiceUseCase({required this.purchaseReturnInvoiceRepo});

  Future<InvoiceBuyReturnEntity> execute({required double id}) async {
    final invoiceBuyReturnJsonArr =
        await purchaseReturnInvoiceRepo.getOne<InvoiceBuyReturn>(id: id);
    final invoiceBuyReturnData = invoiceBuyReturnJsonArr.first;
    final invoiceBuyReturnObject =
        InvoiceBuyReturn.fromJson(invoiceBuyReturnData);
    final InvoiceBuyReturnEntity invoiceBuyReturnEntityObject =
        InvoiceBuyReturnMapper().convert(invoiceBuyReturnObject);
    LoggerSingleton.logger.i(invoiceBuyReturnEntityObject.toJson());

    return invoiceBuyReturnEntityObject;
  }
}
