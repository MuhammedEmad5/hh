part of 'product_cubit.dart';

@freezed
class ProductState<T> with _$ProductState {
  const factory ProductState.initial() = Initial;
  const factory ProductState.loading() = Loading;
  const factory ProductState.success(T data) = Success;
  const factory ProductState.getLastIndex(T data) = ProductIndexLoaded;
  const factory ProductState.empty() = Empty;
  const factory ProductState.error(String errorMessage) = Error;
}
