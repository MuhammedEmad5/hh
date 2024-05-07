part of 'tax_declaration_cubit.dart';

@freezed
class TaxDeclarationState<T> with _$TaxDeclarationState {
  const factory TaxDeclarationState.initial() = Initial;
  const factory TaxDeclarationState.loading() = Loading;
  const factory TaxDeclarationState.success(T data) = Success;
  const factory TaxDeclarationState.empty() = Empty;
  const factory TaxDeclarationState.error(String errorMessage) = Error;
}
