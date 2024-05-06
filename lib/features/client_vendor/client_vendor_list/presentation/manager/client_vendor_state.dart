part of 'client_vendor_cubit.dart';

@freezed
class ClientVendorState<T> with _$ClientVendorState {
  const factory ClientVendorState.initial() = Initial;
  const factory ClientVendorState.loading() = Loading;
  const factory ClientVendorState.success(T data) = Success;
  const factory ClientVendorState.empty() = Empty;
  const factory ClientVendorState.error(String errorMessage) = Error;
}
