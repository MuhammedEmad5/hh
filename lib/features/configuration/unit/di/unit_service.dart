import 'package:InvoiceF_Configuration/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/unit_repo.dart';
import '../domain/use_cases/unit_use_cases/read_all_units_use_case.dart';
import '../presentation/manager/unit_cubit.dart';

class UnitService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<UnitRepo>(
      () => UnitRepo(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllUnitsUseCase>(
      () => ReadAllUnitsUseCase(unitRepo: sl()),
    );
    sl.registerLazySingletonSafely<UnitCubit>(
      () => UnitCubit(
        sl(),
      ),
    );
  }
}
