part of 'company_cubit.dart';

@freezed
class CompanyState<T> with _$CompanyState{
  const factory CompanyState.initial() = Initial;
  const factory CompanyState.loading() = Loading;
  const factory CompanyState.success(T data) = Success;
  const factory CompanyState.error(String errorMessage) = Error;
}
