import 'package:InvoiceF/features/configuration/banks/domain/entities/bank_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/use_cases/create_bank_use_case.dart';
import '../../domain/use_cases/read_all_banks_use_case.dart';
import '../../domain/use_cases/update_bank_use_case.dart';

part 'bank_state.dart';
part 'bank_cubit.freezed.dart';

class BankCubit extends Cubit<BankState> {
  final CreateBankUseCase _createBankUseCase;
  final UpdateBankUseCase _updateBankUseCase;
  final ReadAllBankUseCase _readAllBanksUseCase;

  BankCubit(this._createBankUseCase, this._updateBankUseCase,
      this._readAllBanksUseCase)
      : super(const BankState.initial());

  void getAllBanks() async {
    emit(const BankState.loading());
    try {
      final bankList = await _readAllBanksUseCase.execute();

      bankList.isEmpty
          ? emit(const BankState.empty())
          : emit(BankState.success(bankList));
    } catch (e) {
      emit(BankState.error(e.toString()));
    }
  }

  void insertBank(BankEntity bankEntity) async {
    try {
      await _createBankUseCase.execute(bankEntity);
      getAllBanks();
    } catch (e) {
      emit(BankState.error(e.toString()));
    }
  }

  void updateBank(BankEntity bankEntity) async {
    try {
      await _updateBankUseCase.execute(bankEntity,
          id: bankEntity.bankAccountNumber);
      getAllBanks();
    } catch (e) {
      emit(BankState.error(e.toString()));
    }
  }
}
