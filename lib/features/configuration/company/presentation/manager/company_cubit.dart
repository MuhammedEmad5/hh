import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/logger.dart';
import '../../domain/entities/company_general_entity/company_entity.dart';
import '../../domain/use_cases/create_company_use_case.dart';
import '../../domain/use_cases/delete_company_use_case.dart';
import '../../domain/use_cases/read_all_company_use_case.dart';
import '../../domain/use_cases/read_company_use_case.dart';
import '../../domain/use_cases/update_company_use_case.dart';

part 'company_state.dart';
part 'company_cubit.freezed.dart';


class CompanyCubit extends Cubit<CompanyState> {
  final CreateCompanyUseCase _createCompanyUseCase;
  final ReadCompanyUseCase _readCompanyUseCase;
  final DeleteCompanyUseCase _deleteCompanyUseCase;
  final UpdateCompanyUseCase _updateCompanyUseCase;
  final ReadAllCompanyUseCase _readAllCompanyUseCase;

  CompanyCubit(
      this._createCompanyUseCase,
      this._readCompanyUseCase,
      this._deleteCompanyUseCase,
      this._updateCompanyUseCase,
      this._readAllCompanyUseCase
     )
      : super(const CompanyState.loading());


  void getAllCompanies() async {
    try {
      final companies = await _readAllCompanyUseCase.execute();
      LoggerSingleton.logger.e(companies.length);
      emit(CompanyState.success(companies));
    } catch (e) {
      LoggerSingleton.logger.e(e);
      emit(CompanyState.error(e.toString()));
    }
  }




  void insertBranch(CompanyEntity companyEntity) async {
    try {
      await _createCompanyUseCase.execute(companyEntity);
      getAllCompanies();
     // emit(const CompanyState.success(true));
    } catch (e) {
      emit(CompanyState.error(e.toString()));
    }
  }

void updateBranch( CompanyEntity companyEntity) async {
  try {
    await _updateCompanyUseCase.execute(companyEntity, id: companyEntity.companyNo);
    getAllCompanies();
    //emit(CompanyState.success(true));
  } catch (e) {
    emit(CompanyState.error(e.toString()));
  }
}


}