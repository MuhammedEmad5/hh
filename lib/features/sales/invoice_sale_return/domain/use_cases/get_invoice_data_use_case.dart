import 'package:InvoiceF/features/sales/invoice_sale_return/data/repositories/invoice_sale_return_repo.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';

class GetInvoiceDataInvoiceSaleReturnUseCase {
  final InvoiceSaleReturnRepo invoiceSaleReturnRepo;

  GetInvoiceDataInvoiceSaleReturnUseCase({required this.invoiceSaleReturnRepo});
  Future<InvoiceSellEntity> execute(
      String invoiceNo, String buildingNo, String table) async {
    final res = await invoiceSaleReturnRepo.getInvoiceData(
        invoiceNo, buildingNo, table);
    print(res);
    late InvoiceSellEntity invoiceData;
    try {
      invoiceData = InvoiceSellEntity.fromJson(res[0]);
    } catch (e) {
      throw Exception(e.toString());
    }
    return invoiceData;
  }
}
