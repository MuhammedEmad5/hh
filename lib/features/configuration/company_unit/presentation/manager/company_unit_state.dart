part of 'company_unit_cubit.dart';

@freezed
class CompanyUnitState<T> with _$CompanyUnitState {
  const factory CompanyUnitState.initial() = Initial;
  const factory CompanyUnitState.loading() = Loading;
  const factory CompanyUnitState.success(T? data) = Success;
  const factory CompanyUnitState.empty() = Empty;
  const factory CompanyUnitState.error(String errorMessage) = Error;
}
