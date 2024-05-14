
import 'package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart';
import 'package:InvoiceF/features/configuration/banks/data/models/bank_account.dart';
import 'package:InvoiceF/features/configuration/banks/data/repositories/banks_repo.dart';
import 'package:InvoiceF/features/configuration/banks/domain/entities/bank_entity.dart';

class ReadAllBankUseCase {
  final BanksRepo bankRepo;

  ReadAllBankUseCase(this.bankRepo);

  Future<List<BankEntity>> execute() async {

    final List<dynamic> bankAccountJsonArr =
    await bankRepo.getAll<BankAccount>();
    final bankAccountObjects =
    bankAccountJsonArr.map((bankAccount) => BankAccount.fromJson(bankAccount)).toList();
    List<BankEntity> bankList = [];
    for (BankAccount bankAccount in bankAccountObjects) {
      bankList.add(BankAccountMapper().convert(bankAccount));
    }

    return bankList;
  }
}
