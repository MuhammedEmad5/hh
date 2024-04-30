
import '../../../data/mapper/invoice_buy_mapper.dart';
import '../../../data/models/invoice_buy_model.dart';
import '../../../data/repositories/invoice_buy_repo_impl.dart';
import '../../entities/invoice_buy_entity/invoice_buy_entity_model.dart';

class ReadAllInvoiceBuyUseCase {
  final InvoiceBuyRepo invoiceBuyRepo;

  ReadAllInvoiceBuyUseCase({required this.invoiceBuyRepo});

  Future<List<InvoiceBuyEntity>> execute() async {
    final List<dynamic> invoiceBuyJsonArr =
        await invoiceBuyRepo.getAll<InvoiceBuy>();
    final invoiceBuyObjects = invoiceBuyJsonArr
        .map((invoiceBuy) => InvoiceBuy.fromJson(invoiceBuy))
        .toList();
    List<InvoiceBuyEntity> invoiceBuyEntity = [];
    for (InvoiceBuy invoiceBuy in invoiceBuyObjects) {
      invoiceBuyEntity.add(InvoiceBuyMapper().convert(invoiceBuy));
    }

    return invoiceBuyEntity;
  }
}
