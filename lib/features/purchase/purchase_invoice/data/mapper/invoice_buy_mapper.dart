import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.auto_mappr.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/data/models/invoice_buy_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

@AutoMappr([
  MapType<InvoiceBuy, InvoiceBuyEntity>(fields: [
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
    Field('amountPayed01', from: 'amountPayed01'),
    Field('amountPayed02', from: 'amountPayed02'),
    Field('amountPayed03', from: 'amountPayed03'),
    Field('taxRate1_Total', from: 'taxRate1_Total'),
    Field('amountCalculatedPayed', from: 'amountCalculatedPayed'),
  ]),
  MapType<InvoiceBuyEntity, InvoiceBuy>(fields: [
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
    Field('StoreNo', from: 'StoreNo'),
    Field('VATTypeNO', from: 'VATTypeNO'),
    Field('isPosted', from: 'isPosted'),
    Field('note', from: 'note'),
    Field('amountPayed01', from: 'amountPayed01'),
    Field('amountPayed02', from: 'amountPayed02'),
    Field('amountPayed03', from: 'amountPayed03'),
    Field('taxRate1_Total', from: 'taxRate1_Total'),
    Field('amountCalculatedPayed', from: 'amountCalculatedPayed'),
    Field('gaztInvoiceNumber',
        custom: InvoiceBuyMapper.handlegaztInvoiceNumber),
  ])
])
class InvoiceBuyMapper extends $InvoiceBuyMapper {
  static String handlegaztInvoiceNumber(InvoiceBuyEntity invoiceBuyEntity) =>
      '1/${invoiceBuyEntity.invoiceNo}';
}
