part of 'unit_cubit.dart';

@freezed
class UnitState<T> with _$UnitState {
  const factory UnitState.initial() = Initial;
  const factory UnitState.loading() = Loading;
  const factory UnitState.success(T data) = Success;
  const factory UnitState.empty() = Empty;
  const factory UnitState.error(String errorMessage) = Error;
}
