
import '../../../../../../core/utils/logger.dart';
import '../../../data/mapper/invoice_buy_mapper.dart';
import '../../../data/models/invoice_buy_model.dart';
import '../../../data/repositories/invoice_buy_repo_impl.dart';
import '../../entities/invoice_buy_entity/invoice_buy_entity_model.dart';

class ReadInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  ReadInvoiceBuyUseCase({required this.invoiceBuyRepo});

  Future<InvoiceBuyEntity> execute({required double id}) async {
    final invoiceBuyJsonArr = await invoiceBuyRepo.getOne<InvoiceBuy>(id: id);
    final invoiceBuyData = invoiceBuyJsonArr.first;
    final invoiceBuyObject = InvoiceBuy.fromJson(invoiceBuyData);
    final InvoiceBuyEntity invoiceBuyEntityObject =
        InvoiceBuyMapper().convert(invoiceBuyObject);
    LoggerSingleton.logger.i(invoiceBuyEntityObject.toJson());

    return invoiceBuyEntityObject;
  }
}
