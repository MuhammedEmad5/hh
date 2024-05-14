part of 'bank_cubit.dart';

@freezed
class BankState with _$BankState {
  const factory BankState.initial() = _Initial;
  const factory BankState.loading() = _Loading;
  const factory BankState.success(dynamic data) = _Success;
  const factory BankState.empty() = _Empty;
  const factory BankState.error(String message) = _Error;
}
