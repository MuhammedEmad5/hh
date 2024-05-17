import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounting_options_state.dart';
part 'accounting_options_cubit.freezed.dart';

class AccountingOptionsCubit extends Cubit<AccountingOptionsState> {
  AccountingOptionsCubit() : super(AccountingOptionsState.initial());
}
