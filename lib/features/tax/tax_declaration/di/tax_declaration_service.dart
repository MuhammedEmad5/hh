import 'package:InvoiceF/core/extensions/getit_extension.dart';
import 'package:InvoiceF/features/tax/tax_declaration/data/repositories/tax_declaration_repo.dart';
import 'package:InvoiceF/features/tax/tax_declaration/domain/use_cases/get_brances_use_case.dart';
import 'package:InvoiceF/features/tax/tax_declaration/domain/use_cases/get_data_use_case.dart';
import 'package:InvoiceF/features/tax/tax_declaration/presentation/manager/tax_declaration_cubit.dart';

import 'package:get_it/get_it.dart';

class TaxDeclarationService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<TaxDeclarationRepo>(
      () => TaxDeclarationRepo(sl()),
    );
    sl.registerLazySingletonSafely<GetBranchesTaxDeclarationUseCase>(
      () => GetBranchesTaxDeclarationUseCase(taxDeclarationRepo: sl()),
    );

    sl.registerLazySingletonSafely<GetDataTaxDeclarationUseCase>(
      () => GetDataTaxDeclarationUseCase(taxDeclarationRepo: sl()),
    );
    sl.registerLazySingletonSafely<TaxDeclarationCubit>(
      () => TaxDeclarationCubit(
        sl(),
        sl(),
      ),
    );
  }
}
