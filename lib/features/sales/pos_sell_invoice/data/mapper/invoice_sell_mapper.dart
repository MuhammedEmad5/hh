import 'package:InvoiceF/features/sales/pos_sell_invoice/data/mapper/invoice_sell_mapper.auto_mappr.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/data/models/invoice_sell_model.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

@AutoMappr([
  MapType<InvoiceSell, InvoiceSellEntity>(fields: [
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
  MapType<InvoiceSellEntity, InvoiceSell>(fields: [
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
        custom: InvoiceSellMapper.handlegaztInvoiceNumber),
  ])
])
class InvoiceSellMapper extends $InvoiceSellMapper {
  static String handlegaztInvoiceNumber(InvoiceSellEntity invoiceSellEntity) =>
      '1/${invoiceSellEntity.invoiceNo}';
}
