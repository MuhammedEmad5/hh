import 'package:InvoiceF/features/sales/invoice_sale_return/data/mapper/invoice_sell_return_mapper.auto_mappr.dart';
import 'package:InvoiceF/features/sales/invoice_sale_return/data/models/invoice_sell_return_model.dart';
import 'package:InvoiceF/features/sales/invoice_sale_return/domain/entities/invoice_sell_return_entity/invoice_sell_return_entity_model.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

@AutoMappr([
  MapType<InvoiceSellReturn, InvoiceSellReturnEntity>(fields: [
    Field('invoiceNo', from: 'invoiceNo'),
    Field('userNumber', from: 'userNumber'),
    Field('clientVendorNo', from: 'clientVendorNo'),
    Field('aName', from: 'aName'),
    Field('eName', from: 'eName'),
    Field('subNetTotal', from: 'subNetTotal'),
    Field('subNetTotalPlusTax', from: 'subNetTotalPlusTax'),
    Field('subTotalDiscount', from: 'subTotalDiscount'),
    Field('dateG', from: 'dateG'),
    Field('invoiceVATID', from: 'invoiceVATID'),
    Field('telephone', from: 'telephone'),
    Field('buildingNo', from: 'buildingNo'),
    Field('amountLeft', from: 'amountLeft'),
    Field('amountPayed', from: 'amountPayed'),
    Field('paperBillNum', from: 'paperBillNum'),
    Field('StoreNo', from: 'StoreNo'), // Set default value
    Field('VATTypeNO', from: 'VATTypeNo'), // Set default value
    Field('isPosted', from: 'isPosted'),
    Field('note', from: 'note'),
  ]),
  MapType<InvoiceSellReturnEntity, InvoiceSellReturn>(
    fields: [
      Field('invoiceNo', from: 'invoiceNo'),
      Field('Inv_invoiceNo', from: 'Inv_invoiceNo'),
      Field('Inv_buildingNo', from: 'Inv_buildingNo'),
      Field('userNumber', from: 'userNumber'),
      Field('clientVendorNo', from: 'clientVendorNo'),
      Field('aName', from: 'aName'),
      Field('eName', from: 'eName'),
      Field('subNetTotal', from: 'subNetTotal'),
      Field('subNetTotalPlusTax', from: 'subNetTotalPlusTax'),
      Field('subTotalDiscount', from: 'subTotalDiscount'),
      Field('dateG', from: 'dateG'),
      Field('invoiceVATID', from: 'invoiceVATID'),
      Field('telephone', from: 'telephone'),
      Field('buildingNo', from: 'buildingNo'),
      Field('amountLeft', from: 'amountLeft'),
      Field('amountPayed', from: 'amountPayed'),
      Field('paperBillNum', from: 'paperBillNum'),
      Field('StoreNo', from: 'StoreNo'),
      Field('VATTypeNO', from: 'VATTypeNO'),
      Field('isPosted', from: 'isPosted'),
      Field('note', from: 'note'),
      Field('gaztInvoiceNumber',
          custom: InvoiceSellReturnMapper.handlegaztInvoiceNumber),
    ],
  )
])
class InvoiceSellReturnMapper extends $InvoiceSellReturnMapper {
  static String handlegaztInvoiceNumber(
          InvoiceSellReturnEntity invoiceSellReturnEntity) =>
      '1/${invoiceSellReturnEntity.invoiceNo}';
}
