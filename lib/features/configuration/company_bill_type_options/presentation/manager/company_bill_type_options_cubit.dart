import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/company_bill_type_entity/company_bill_type_entity_model.dart';
import '../../domain/use_cases/create_company_bill_type_use_case.dart';
import '../../domain/use_cases/delete_company_bill_type_use_case.dart';
import '../../domain/use_cases/read_all_company_bill_type_use_case.dart';
import '../../domain/use_cases/read_company_bill_type_use_case.dart';
import '../../domain/use_cases/update_company_bill_type_use_case.dart';

part 'company_bill_type_options_state.dart';
part 'company_bill_type_options_cubit.freezed.dart';

class CompanyBillTypeCubit extends Cubit<CompanyBillTypeState> {
  final CreateCompanyBillTypeUseCase createCompanyBillTypeUseCase;
  final ReadCompanyBillTypeUseCase readCompanyBillTypeUseCase;
  final DeleteCompanyBillTypeUseCase deleteCompanyBillTypeUseCase;
  final UpdateCompanyBillTypeUseCase updateCompanyBillTypeUseCase;
  final ReadAllCompanyBillTypesUseCase readAllCompanyBillTypesUseCase;

  CompanyBillTypeCubit(
      this.createCompanyBillTypeUseCase,
      this.readCompanyBillTypeUseCase,
      this.deleteCompanyBillTypeUseCase,
      this.updateCompanyBillTypeUseCase,
      this.readAllCompanyBillTypesUseCase)
      : super(const CompanyBillTypeState.loading());

  void insertCompanyBillType(CompanyBillTypeEntity companyBillType) async {
    try {
      await createCompanyBillTypeUseCase.execute(companyBillType);
      // getAllCompanyBillTypes();
    } catch (e) {
      emit(CompanyBillTypeState.error(e.toString()));
    }
  }

  void getAllCompanyBillTypes() async {
    try {
      final companyBillTypes = await readAllCompanyBillTypesUseCase.execute();
      emit(CompanyBillTypeState.success(companyBillTypes));
    } catch (e) {
      emit(CompanyBillTypeState.error(e.toString()));
    }
  }

  void getCompanyBillType({required double id}) async {
    try {
      final companyBillType = await readCompanyBillTypeUseCase.execute(id: id);
      emit(CompanyBillTypeState.success([companyBillType]));
    } catch (e) {
      emit(CompanyBillTypeState.error(e.toString()));
    }
  }

  void updateCompanyBillType(
      {required CompanyBillTypeEntity companyBillType}) async {
    try {
      await updateCompanyBillTypeUseCase.execute(companyBillType,
          id: companyBillType.billTypeNo);
      // getAllCompanyBillTypes();
      // emit(CompanyBillTypeState.success(true));
    } catch (e) {
      emit(CompanyBillTypeState.error(e.toString()));
    }
  }

  void deleteCompanyBillType({required double id}) async {
    try {
      await deleteCompanyBillTypeUseCase.execute(id: id);
      // getAllCompanyBillTypes();
      //emit(CompanyBillTypeState.success(true));
    } catch (e) {
      emit(CompanyBillTypeState.error(e.toString()));
    }
  }
}
