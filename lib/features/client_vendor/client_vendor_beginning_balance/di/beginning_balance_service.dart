import 'package:InvoiceF_ClientVendor/core/extensions/getit_extension.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/repositories/beginning_balance_repo.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/domain/use_cases/create_beginning_balance_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/domain/use_cases/read_all_beginning_balance_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/domain/use_cases/update_beginning_balance_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/presentation/manager/beginning_balance_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../client_vendor_list/domain/use_cases/client_vendor_use_cases/read_all_client_vendor_use_case.dart';

class  BeginningBalanceService{
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<BeginningBalanceRepo>(
          () => BeginningBalanceRepo( sl()),
    );
    sl.registerLazySingletonSafely<ReadAllBeginningBalanceUseCase>(
          () => ReadAllBeginningBalanceUseCase( sl()),
    );
    sl.registerLazySingletonSafely<UpdateBeginningBalanceUseCase>(
          () => UpdateBeginningBalanceUseCase( sl()),
    );

    sl.registerLazySingletonSafely<CreateBeginningBalanceUseCase>(
          () => CreateBeginningBalanceUseCase( sl()),
    );


    sl.registerLazySingletonSafely<BeginningBalanceCubit>(
          () => BeginningBalanceCubit(
          sl(),
          sl(),
          sl(),
      ),
    );
  }
}