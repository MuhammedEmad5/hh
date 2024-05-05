import 'package:InvoiceF/core/utils/logger.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/data/mapper/invoice_sell_mapper.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/data/models/invoice_sell_model.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';

class ReadInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  ReadInvoiceSellUseCase({required this.invoiceSellRepo});

  Future<InvoiceSellEntity> execute({required double id}) async {
    final invoiceSellJsonArr =
        await invoiceSellRepo.getOne<InvoiceSell>(id: id);
    final invoiceSellData = invoiceSellJsonArr.first;
    final invoiceSellObject = InvoiceSell.fromJson(invoiceSellData);
    final InvoiceSellEntity invoiceSellEntityObject =
        InvoiceSellMapper().convert(invoiceSellObject);
    LoggerSingleton.logger.i(invoiceSellEntityObject.toJson());

    return invoiceSellEntityObject;
  }
}
