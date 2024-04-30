part of 'invoice_buy_cubit.dart';

@freezed
class InvoiceBuyState<T> with _$InvoiceBuyState {
  const factory InvoiceBuyState.initial() = Initial;
  const factory InvoiceBuyState.loading() = Loading;
  const factory InvoiceBuyState.success(T data) = Success;
  const factory InvoiceBuyState.invoiceBuyDataLoaded(T data) =
      InvoiceBuyDataLoaded;
  const factory InvoiceBuyState.error(String errorMessage) = Error;
}
