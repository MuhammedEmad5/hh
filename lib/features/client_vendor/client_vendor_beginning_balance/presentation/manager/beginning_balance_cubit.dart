import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../client_vendor_list/domain/use_cases/client_vendor_use_cases/read_all_client_vendor_use_case.dart';
import '../../domain/entities/beginning_balance_entity.dart';
import '../../domain/use_cases/create_beginning_balance_use_case.dart';
import '../../domain/use_cases/read_all_beginning_balance_use_case.dart';
import '../../domain/use_cases/update_beginning_balance_use_case.dart';

part 'beginning_balance_state.dart';
part 'beginning_balance_cubit.freezed.dart';

class BeginningBalanceCubit extends Cubit<BeginningBalanceState> {
  final CreateBeginningBalanceUseCase _createBeginningBalanceUseCase;
  final ReadAllBeginningBalanceUseCase _readAllBeginningBalanceUseCase;

  final UpdateBeginningBalanceUseCase _updateBeginningBalanceUseCase;


  BeginningBalanceCubit(
      this._createBeginningBalanceUseCase,
      this._readAllBeginningBalanceUseCase,
      this._updateBeginningBalanceUseCase,
      )
      : super(const BeginningBalanceState.initial());

  void getAllBeginningBalance() async {
    emit(const BeginningBalanceState.loading());
    try {
      final beginningBalanceList =
          await _readAllBeginningBalanceUseCase.execute();

      beginningBalanceList.isEmpty
          ? emit(const BeginningBalanceState.empty())
          : emit(BeginningBalanceState.success(beginningBalanceList));
    } catch (e) {
      emit(BeginningBalanceState.error(e.toString()));
    }
  }


  void insertBeginningBalance(BeginningBalanceEntity balanceEntity)async{

    try {
      await _createBeginningBalanceUseCase.execute(balanceEntity);
      getAllBeginningBalance();

    }catch(e){
      emit(BeginningBalanceState.error(e.toString()));
    }


  }

  void updateBeginningBalance(BeginningBalanceEntity balanceEntity) async {
    try {
      await _updateBeginningBalanceUseCase .execute(balanceEntity,
          id: balanceEntity.transactionNumber);
      getAllBeginningBalance();
    } catch (e) {
      emit(BeginningBalanceState.error(e.toString()));
    }
  }





}
