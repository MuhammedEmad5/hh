
import '../../../data/mapper/invoice_sell_mapper.dart';
import '../../../data/models/invoice_sell_model.dart';
import '../../../data/repositories/invoice_sell_repo_impl.dart';
import '../../entities/invoice_sell_entity/invoice_sell_entity_model.dart';

class CreateInvoiceSellUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  CreateInvoiceSellUseCase({required this.invoiceSellRepo});

  Future<void> execute(InvoiceSellEntity invoiceSellEntity) async {
    final InvoiceSell invoiceSell =
        InvoiceSellMapper().convert(invoiceSellEntity);
    await invoiceSellRepo.insert(invoiceSell);
  }
}
