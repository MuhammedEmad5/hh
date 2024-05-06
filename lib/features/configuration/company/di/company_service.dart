import 'package:InvoiceF/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/company_repo_impl.dart';
import '../domain/use_cases/create_company_use_case.dart';
import '../domain/use_cases/delete_company_use_case.dart';
import '../domain/use_cases/read_all_company_use_case.dart';
import '../domain/use_cases/read_company_use_case.dart';
import '../domain/use_cases/update_company_use_case.dart';
import '../presentation/manager/company_cubit.dart';



class CompanyService {
  final sl = GetIt.instance;


  Future<void> initDi() async {




    sl.registerLazySingletonSafely<CompanyRepo>(
          () => CompanyRepo( sl()),
    );
    sl.registerLazySingletonSafely<ReadAllCompanyUseCase>(
          () => ReadAllCompanyUseCase( sl()),
    );
    sl.registerLazySingletonSafely<ReadCompanyUseCase>(
          () => ReadCompanyUseCase( sl()),
    );
    sl.registerLazySingletonSafely<UpdateCompanyUseCase>(
          () => UpdateCompanyUseCase( sl()),
    );
    sl.registerLazySingletonSafely<CreateCompanyUseCase>(
          () => CreateCompanyUseCase( sl()),
    );
    sl.registerLazySingletonSafely<DeleteCompanyUseCase>(
          () => DeleteCompanyUseCase( sl()),
    );
    sl.registerLazySingletonSafely<CompanyCubit>(
          () => CompanyCubit(
          sl(),
          sl(),
          sl(),
          sl(),
          sl()
      ),
    );
  }
}