part of 'invoice_sale_return_cubit.dart';

@freezed
class InvoiceSaleReturnState<T> with _$InvoiceSaleReturnState {
  const factory InvoiceSaleReturnState.initial() = Initial;
  const factory InvoiceSaleReturnState.loading() = Loading;
  const factory InvoiceSaleReturnState.success(T data) = Success;
  const factory InvoiceSaleReturnState.empty() = Empty;
  const factory InvoiceSaleReturnState.error(String errorMessage) = Error;
}
