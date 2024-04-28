part of 'branch_cubit.dart';

@freezed
class BranchState<T> with _$BranchState {
  const factory BranchState.initial() = Initial;
  const factory BranchState.loading() = Loading;
  const factory BranchState.empty() = Empty;
  const factory BranchState.success(T data) = Success;
  const factory BranchState.error(String errorMessage) = Error;
}
