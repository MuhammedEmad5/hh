import 'package:InvoiceF/features/tax/tax_declaration/domain/use_cases/get_brances_use_case.dart';
import 'package:InvoiceF/features/tax/tax_declaration/domain/use_cases/get_data_use_case.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_declaration_state.dart';
part 'tax_declaration_cubit.freezed.dart';

class TaxDeclarationCubit extends Cubit<TaxDeclarationState> {
  final GetBranchesTaxDeclarationUseCase getBranchesTaxDeclarationUseCase;
  final GetDataTaxDeclarationUseCase getDataTaxDeclarationUseCase;

  TaxDeclarationCubit(
    this.getBranchesTaxDeclarationUseCase,
    this.getDataTaxDeclarationUseCase,
  ) : super(const TaxDeclarationState.initial());

  reset() {
    emit(TaxDeclarationState.initial());
  }

  Future<List> getBranches() async {
    List branches = await getBranchesTaxDeclarationUseCase.execute();
    return branches;
  }

  getData(String dateTo, String dateFrom, String buildingNo) async {
    try {
      emit(const TaxDeclarationState.loading());
      List data = await getDataTaxDeclarationUseCase.execute(
          dateTo, dateFrom, buildingNo);
      data.isEmpty
          ? emit(TaxDeclarationState.empty())
          : emit(TaxDeclarationState.success(data));
    } catch (e) {
      emit(TaxDeclarationState.error(e.toString()));
    }
  }
}
