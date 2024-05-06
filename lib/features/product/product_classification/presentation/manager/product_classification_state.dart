part of 'product_classification_cubit.dart';


@freezed
class ProductClassificationState<T> with _$ProductClassificationState {
  const factory ProductClassificationState.initial() = Initial;
  const factory ProductClassificationState.loading() = Loading;
  const factory ProductClassificationState.success(T? data) = Success;
  const factory ProductClassificationState.error(String errorMessage) = Error;
}