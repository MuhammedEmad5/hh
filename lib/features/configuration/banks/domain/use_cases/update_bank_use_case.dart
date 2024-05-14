import 'package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart';
import 'package:InvoiceF/features/configuration/banks/data/models/bank_account.dart';
import 'package:InvoiceF/features/configuration/banks/data/repositories/banks_repo.dart';
import 'package:InvoiceF/features/configuration/banks/domain/entities/bank_entity.dart';

class UpdateBankUseCase {
  final BanksRepo banksRepo;

  UpdateBankUseCase( this.banksRepo);

  Future<void> execute(BankEntity bankEntity,{required id}) async {
    final BankAccount bankAccount = BankAccountMapper().convert(bankEntity);
    await banksRepo.update<BankAccount>(bankAccount, id: id);
  }
}