
import '../../../data/mapper/invoice_buy_mapper.dart';
import '../../../data/models/invoice_buy_model.dart';
import '../../../data/repositories/invoice_buy_repo_impl.dart';
import '../../entities/invoice_buy_entity/invoice_buy_entity_model.dart';

class UpdateInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  UpdateInvoiceBuyUseCase({required this.invoiceBuyRepo});

  Future<void> execute(InvoiceBuyEntity invoiceBuyEntity, {required id}) async {
    final InvoiceBuy invoiceBuy = InvoiceBuyMapper().convert(invoiceBuyEntity);
    await invoiceBuyRepo.update<InvoiceBuy>(invoiceBuy, id: id);
  }
}
