import 'package:InvoiceF_Configuration/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/blocs/connection_type_bloc/connection_bloc.dart';
import '../../../../core/blocs/connection_type_bloc/connection_event.dart';
import '../../../../core/data/datasources/connection.dart';
import '../data/repositories/branch_repo_impl.dart';
import '../domain/use_cases/create_branch_use_case.dart';
import '../domain/use_cases/delete_branch_use_case.dart';
import '../domain/use_cases/read_all_branch_use_case.dart';
import '../domain/use_cases/read_branch_use_case.dart';
import '../domain/use_cases/update_branch_use_case.dart';
import '../presentation/manager/branch_cubit.dart';

class BranchService {
  final sl = GetIt.instance;

  Future<void> initDi() async {

    sl.registerLazySingletonSafely<BranchRepo>(
      () => BranchRepo( sl()),
    );

    sl.registerLazySingletonSafely<ReadAllBranchesUseCase>(
      () => ReadAllBranchesUseCase(branchRepo: sl()),
    );
    sl.registerLazySingletonSafely<ReadBranchUseCase>(
      () => ReadBranchUseCase(branchRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdateBranchUseCase>(
      () => UpdateBranchUseCase(branchRepo: sl()),
    );
    sl.registerLazySingletonSafely<CreateBranchUseCase>(
      () => CreateBranchUseCase(branchRepo: sl()),
    );
    sl.registerLazySingletonSafely<DeleteBranchUseCase>(
      () => DeleteBranchUseCase(branchRepo: sl()),
    );
    sl.registerLazySingletonSafely<BranchCubit>(
      () => BranchCubit(sl(), sl(), sl(), sl(), sl()),
    );
  }

  void unregisterBranchRepo() {

    sl.unregister<BranchRepo>();
  }
  void unregisterBranchCubit() {
    sl<BranchCubit>().dispose();
    sl.unregister<BranchRepo>();
  }
}
