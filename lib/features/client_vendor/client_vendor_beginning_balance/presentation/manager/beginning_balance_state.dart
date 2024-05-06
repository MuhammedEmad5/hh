part of 'beginning_balance_cubit.dart';

@freezed
class BeginningBalanceState with _$BeginningBalanceState {
  const factory BeginningBalanceState.initial() = _Initial;
  const factory BeginningBalanceState.loading() = _Loading;
 const factory BeginningBalanceState.success(dynamic data) = _Success;
  const factory BeginningBalanceState.empty() = _Empty;
  const factory BeginningBalanceState.error( String message) = _Error;
}
