import 'package:InvoiceF_Configuration/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/company_bill_type_repo.dart';
import '../domain/use_cases/create_company_bill_type_use_case.dart';
import '../domain/use_cases/delete_company_bill_type_use_case.dart';
import '../domain/use_cases/read_all_company_bill_type_use_case.dart';
import '../domain/use_cases/read_company_bill_type_use_case.dart';
import '../domain/use_cases/update_company_bill_type_use_case.dart';
import '../presentation/manager/company_bill_type_options_cubit.dart';

class CompanyBillTypeService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<CompanyBillTypeRepo>(
      () => CompanyBillTypeRepo(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllCompanyBillTypesUseCase>(
      () => ReadAllCompanyBillTypesUseCase(companyBillTypeRepo: sl()),
    );
    sl.registerLazySingletonSafely<ReadCompanyBillTypeUseCase>(
      () => ReadCompanyBillTypeUseCase(companyBillTypeRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdateCompanyBillTypeUseCase>(
      () => UpdateCompanyBillTypeUseCase(companyBillTypeRepo: sl()),
    );
    sl.registerLazySingletonSafely<CreateCompanyBillTypeUseCase>(
      () => CreateCompanyBillTypeUseCase(companyBillTypeRepo: sl()),
    );
    sl.registerLazySingletonSafely<DeleteCompanyBillTypeUseCase>(
      () => DeleteCompanyBillTypeUseCase(companyBillTypeRepo: sl()),
    );
    sl.registerLazySingletonSafely<CompanyBillTypeCubit>(
      () => CompanyBillTypeCubit(sl(), sl(), sl(), sl(), sl()),
    );
  }
}
