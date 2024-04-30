part of 'purchase_return_invoice_cubit.dart';

@freezed
class PurchaseReturnInvoiceState<T> with _$PurchaseReturnInvoiceState {
  const factory PurchaseReturnInvoiceState.initial() = Initial;
  const factory PurchaseReturnInvoiceState.loading() = Loading;
  const factory PurchaseReturnInvoiceState.success(T data) = Success;
  const factory PurchaseReturnInvoiceState.empty() = Empty;
  const factory PurchaseReturnInvoiceState.error(String errorMessage) = Error;
}
