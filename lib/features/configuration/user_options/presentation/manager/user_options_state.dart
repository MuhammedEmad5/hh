part of 'user_options_cubit.dart';

@freezed
class UserOptionsState with _$UserOptionsState {
  const factory UserOptionsState.initial() = _Initial;
  const factory UserOptionsState.loading() = _Loading;
  const factory UserOptionsState.success(dynamic data) = _Successs;
  const factory UserOptionsState.empty() = _Empty;
  const factory UserOptionsState.error(String msg) = _Error;
}
