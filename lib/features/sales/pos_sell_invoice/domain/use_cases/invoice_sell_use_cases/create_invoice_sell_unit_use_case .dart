import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/data/models/invoice_sell_unit_model.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/domain/entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';

class CreateInvoiceSellUnitUseCase {
  final InvoiceSellRepo invoiceSellRepo;

  CreateInvoiceSellUnitUseCase({required this.invoiceSellRepo});

  Future<void> execute(
      InvoiceSellUnitEntity invUnit, int orderNo, int quantity) async {
    await invoiceSellRepo.insert(
      InvoiceSellUnit(
          invoiceNo: invUnit.invoiceNo,
          orderNo: orderNo,
          quantity: quantity,
          buildingNo: invUnit.buildingNo,
          aName: invUnit.aName,
          eName: invUnit.eName,
          itemNo: invUnit.itemNo!,
          price: invUnit.price,
          discount: invUnit.discount,
          discountPercent: invUnit.discountPercent,
          discountTotal: invUnit.discountTotal,
          taxRate1_Percentage: invUnit.taxRate1_Percentage,
          taxRate1_Total: invUnit.taxRate1_Total,
          barCode: invUnit.barCode,
          totalPlusTax: quantity *
              (invUnit.price +
                  ((invUnit.price - invUnit.discount) *
                      invUnit.taxRate1_Percentage)),
          total: quantity * invUnit.price),
    );
  }
}
