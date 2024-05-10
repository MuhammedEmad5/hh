part of 'company_bill_type_options_cubit.dart';

@freezed
class CompanyBillTypeState<T> with _$CompanyBillTypeState {
  const factory CompanyBillTypeState.initial() = Initial;
  const factory CompanyBillTypeState.loading() = Loading;
  const factory CompanyBillTypeState.success(T? data) = Success;
  const factory CompanyBillTypeState.empty() = Empty;
  const factory CompanyBillTypeState.error(String errorMessage) = Error;
}
