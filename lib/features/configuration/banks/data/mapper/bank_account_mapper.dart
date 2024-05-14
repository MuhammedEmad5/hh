import 'package:InvoiceF/features/configuration/banks/data/models/bank_account.dart';
import 'package:InvoiceF/features/configuration/banks/domain/entities/bank_entity.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import 'bank_account_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<BankEntity, BankAccount>(fields: [
    Field('bankAccountNo', from: 'bankAccountNumber'),
    Field('userNumber', custom: BankAccountMapper.userNumber),
    Field('aName', from: 'arabicName'),
    Field('eName', custom: BankAccountMapper.englishName),
  ]),
  MapType<BankAccount, BankEntity>(fields: [
    Field('bankAccountNumber', from: 'bankAccountNo'),
    Field('arabicName', from: 'aName'),
    Field('englishName', from: 'eName'),
  ])
])
class BankAccountMapper extends $BankAccountMapper {
  static String? englishName(BankEntity bankEntity) {
    if (bankEntity.englishName == "") {
      return null;
    }
    return bankEntity.englishName;
  }

  static String userNumber(BankEntity bankEntity) {
    return bankEntity.bankAccountNumber.toString();
  }
}
