part of 'invoice_a4_cubit.dart';

@freezed
class InvoiceA4State<T> with _$InvoiceA4State {
  const factory InvoiceA4State.initial() = Initial;
  const factory InvoiceA4State.loading() = Loading;
  const factory InvoiceA4State.success(T data) = Success;
  const factory InvoiceA4State.a4DataFetched() = A4DataFetched;
  const factory InvoiceA4State.error(String errorMessage) = Error;
}
