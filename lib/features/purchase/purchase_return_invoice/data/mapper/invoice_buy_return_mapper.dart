import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/mapper/invoice_buy_return_mapper.auto_mappr.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/models/invoice_buy_return_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/domain/entities/invoice_buy_return_entity/invoice_buy_return_entity_model.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

@AutoMappr([
  MapType<InvoiceBuyReturn, InvoiceBuyReturnEntity>(fields: [
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
  MapType<InvoiceBuyReturnEntity, InvoiceBuyReturn>(
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
          custom: InvoiceBuyReturnMapper.handlegaztInvoiceNumber),
    ],
  )
])
class InvoiceBuyReturnMapper extends $InvoiceBuyReturnMapper {
  static String handlegaztInvoiceNumber(
          InvoiceBuyReturnEntity invoiceBuyReturnEntity) =>
      '1/${invoiceBuyReturnEntity.invoiceNo}';
}
