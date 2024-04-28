part of 'user_registration_cubit.dart';

@freezed
class UserRegistrationState<T> with _$UserRegistrationState{
  const factory UserRegistrationState.initial() = Initial;
  const factory UserRegistrationState.loading() = Loading;
  const factory UserRegistrationState.success(T data) = Success;
  const factory UserRegistrationState.empty() = Empty;
  const factory UserRegistrationState.error(String errorMessage) = Error;
}