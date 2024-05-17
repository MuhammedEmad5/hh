part of 'device_option_cubit.dart';

@freezed
class DeviceOptionState<T> with _$DeviceOptionState {
  const factory DeviceOptionState.initial() = Initial;
  const factory DeviceOptionState.loading() = Loading;
  const factory DeviceOptionState.success(T? data) = Success;
  const factory DeviceOptionState.empty() = Empty;
  const factory DeviceOptionState.error(String errorMessage) = Error;
}
