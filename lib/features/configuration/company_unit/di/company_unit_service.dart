import 'package:InvoiceF_Configuration/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/company_unit_repo.dart';
import '../domain/use_cases/create_company_unit_use_case.dart';
import '../domain/use_cases/delete_company_unit_use_case.dart';
import '../domain/use_cases/read_all_company_units_use_case.dart';
import '../domain/use_cases/read_company_unit_use_case.dart';
import '../domain/use_cases/update_company_unit_use_case.dart';
import '../presentation/manager/company_unit_cubit.dart';

class CompanyUnitService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<CompanyUnitRepo>(
      () => CompanyUnitRepo(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllCompanyUnitsUseCase>(
      () => ReadAllCompanyUnitsUseCase(companyUnitRepo: sl()),
    );
    sl.registerLazySingletonSafely<ReadCompanyUnitUseCase>(
      () => ReadCompanyUnitUseCase(companyUnitRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdateCompanyUnitUseCase>(
      () => UpdateCompanyUnitUseCase(companyUnitRepo: sl()),
    );
    sl.registerLazySingletonSafely<CreateCompanyUnitUseCase>(
      () => CreateCompanyUnitUseCase(companyUnitRepo: sl()),
    );
    sl.registerLazySingletonSafely<DeleteCompanyUnitUseCase>(
      () => DeleteCompanyUnitUseCase(companyUnitRepo: sl()),
    );
    sl.registerLazySingletonSafely<CompanyUnitCubit>(
      () => CompanyUnitCubit(sl(), sl(), sl(), sl(), sl()),
    );
  }
}
