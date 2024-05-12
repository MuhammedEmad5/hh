import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/company_unit_entity/company_unit_entity_model.dart';
import '../../domain/use_cases/create_company_unit_use_case.dart';
import '../../domain/use_cases/delete_company_unit_use_case.dart';
import '../../domain/use_cases/read_all_company_units_use_case.dart';
import '../../domain/use_cases/read_company_unit_use_case.dart';
import '../../domain/use_cases/update_company_unit_use_case.dart';

part 'company_unit_state.dart';
part 'company_unit_cubit.freezed.dart';

class CompanyUnitCubit extends Cubit<CompanyUnitState> {
  final CreateCompanyUnitUseCase createCompanyUnitUseCase;
  final ReadCompanyUnitUseCase readCompanyUnitUseCase;
  final DeleteCompanyUnitUseCase deleteCompanyUnitUseCase;
  final UpdateCompanyUnitUseCase updateCompanyUnitUseCase;
  final ReadAllCompanyUnitsUseCase readAllCompanyUnitsUseCase;

  CompanyUnitCubit(
      this.createCompanyUnitUseCase,
      this.readCompanyUnitUseCase,
      this.deleteCompanyUnitUseCase,
      this.updateCompanyUnitUseCase,
      this.readAllCompanyUnitsUseCase)
      : super(const CompanyUnitState.loading());

  void insertCompanyUnit(CompanyUnitEntity companyUnit) async {
    try {
      await createCompanyUnitUseCase.execute(companyUnit);
      // getAllCompanyUnits();
    } catch (e) {
      emit(CompanyUnitState.error(e.toString()));
    }
  }

  void getAllCompanyUnits() async {
    try {
      final companyUnits = await readAllCompanyUnitsUseCase.execute();
      emit(CompanyUnitState.success(companyUnits));
    } catch (e) {
      emit(CompanyUnitState.error(e.toString()));
    }
  }

  void getCompanyUnit({required double id}) async {
    try {
      final companyUnit = await readCompanyUnitUseCase.execute(id: id);
      emit(CompanyUnitState.success([companyUnit]));
    } catch (e) {
      emit(CompanyUnitState.error(e.toString()));
    }
  }

  void updateCompanyUnit({required CompanyUnitEntity companyUnit}) async {
    try {
      await updateCompanyUnitUseCase.execute(companyUnit,
          id: companyUnit.unitNo);
      // getAllCompanyUnits();
      // emit(CompanyUnitState.success(true));
    } catch (e) {
      emit(CompanyUnitState.error(e.toString()));
    }
  }

  void deleteCompanyUnit({required double id}) async {
    try {
      await deleteCompanyUnitUseCase.execute(id: id);
      // getAllCompanyUnits();
      //emit(CompanyUnitState.success(true));
    } catch (e) {
      emit(CompanyUnitState.error(e.toString()));
    }
  }
}
