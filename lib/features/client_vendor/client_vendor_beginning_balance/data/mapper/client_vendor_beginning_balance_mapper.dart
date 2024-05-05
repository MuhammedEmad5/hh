import 'package:InvoiceF/features/client_vendor/client_vendor_beginning_balance/data/models/client_vendor_beginning_balance_model.dart';
import 'package:InvoiceF/features/client_vendor/client_vendor_beginning_balance/domain/entities/beginning_balance_entity.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'client_vendor_beginning_balance_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<BeginningBalanceEntity, ClientVendorBeginningBalance>(fields: [
    Field('buildingNo', from: 'branchNumber'),
    Field('clientVendorNo', from: 'clientVendorNumber'),
    Field('transactionNo', from: 'transactionNumber'),
    Field('aName', from: 'arabicName'),
    Field('eName', custom: ClientVendorBeginningBalanceMapper.englishName),
    Field('paperBillNum', custom: ClientVendorBeginningBalanceMapper.originalPaperBillNumber),
    Field('invoiceVATID', custom: ClientVendorBeginningBalanceMapper.invoiceVatId),
    Field('dateG', from: 'date'),
    Field('note', custom: ClientVendorBeginningBalanceMapper.note),


  ]),
  MapType<ClientVendorBeginningBalance, BeginningBalanceEntity>(fields: [
    Field('branchNumber', from: 'buildingNo'),
    Field('clientVendorNumber', from: 'clientVendorNo'),
    Field('transactionNumber', from: 'transactionNo'),
    Field('arabicName', from: 'aName'),
    Field('englishName', from: 'eName'),
    Field('originalPaperBillNumber', from: 'paperBillNum'),
    Field('invoiceVatId', from: 'invoiceVATID'),
    Field('date', from: 'dateG'),




  ])
])
class ClientVendorBeginningBalanceMapper extends $ClientVendorBeginningBalanceMapper {



  static String? englishName(BeginningBalanceEntity balanceEntity) {

    if( balanceEntity.englishName == ""){
      return null;
    }
    return balanceEntity.englishName;

  }
  static String? originalPaperBillNumber(BeginningBalanceEntity balanceEntity) {

    if( balanceEntity.originalPaperBillNumber == ""){
      return null;
    }
    return balanceEntity.originalPaperBillNumber;

  }
  static String? invoiceVatId(BeginningBalanceEntity balanceEntity) {

    if( balanceEntity.invoiceVatId == ""){
      return null;
    }
    return balanceEntity.invoiceVatId;

  }
  static String? note(BeginningBalanceEntity balanceEntity) {

    if( balanceEntity.note == ""){
      return null;
    }
    return balanceEntity.note;

  }


}