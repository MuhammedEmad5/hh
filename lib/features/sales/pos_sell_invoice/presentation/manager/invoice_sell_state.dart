part of 'invoice_sell_cubit.dart';

@freezed
class InvoiceSellState<T> with _$InvoiceSellState {
  const factory InvoiceSellState.initial() = Initial;
  const factory InvoiceSellState.loading() = Loading;
  const factory InvoiceSellState.success(T data) = Success;
  const factory InvoiceSellState.invoiceSellDataLoaded(T data) =
      InvoiceSellDataLoaded;
  const factory InvoiceSellState.error(String errorMessage) = Error;
}
