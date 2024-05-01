import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/repositories/purchase_return_invoice_repo.dart';

class GetInvoiceDataPurchaseReturnInvoiceUseCase {
  final PurchaseReturnInvoiceRepo purchaseReturnInvoiceRepo;

  GetInvoiceDataPurchaseReturnInvoiceUseCase(
      {required this.purchaseReturnInvoiceRepo});
  Future<InvoiceBuyEntity> execute(
      String invoiceNo, String buildingNo, String table) async {
    final res = await purchaseReturnInvoiceRepo.getInvoiceData(
        invoiceNo, buildingNo, table);
    late InvoiceBuyEntity invoiceData;
    try {
      invoiceData = InvoiceBuyEntity.fromJson(res[0]);
    } catch (e) {
      throw Exception(e.toString());
    }
    return invoiceData;
  }
}
