import 'package:InvoiceF/core/extensions/getit_extension.dart';
import 'package:InvoiceF/features/configuration/banks/data/repositories/banks_repo.dart';
import 'package:InvoiceF/features/configuration/banks/domain/use_cases/create_bank_use_case.dart';
import 'package:InvoiceF/features/configuration/banks/domain/use_cases/read_all_banks_use_case.dart';
import 'package:InvoiceF/features/configuration/banks/domain/use_cases/update_bank_use_case.dart';
import 'package:InvoiceF/features/configuration/banks/presentation/manager/bank_cubit.dart';
import 'package:get_it/get_it.dart';


class  BankService{
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<BanksRepo>(
          () => BanksRepo( sl()),
    );
    sl.registerLazySingletonSafely<ReadAllBankUseCase>(
          () => ReadAllBankUseCase( sl()),
    );
    sl.registerLazySingletonSafely<UpdateBankUseCase>(
          () => UpdateBankUseCase( sl()),
    );

    sl.registerLazySingletonSafely<CreateBankUseCase>(
          () => CreateBankUseCase( sl()),
    );


    sl.registerLazySingletonSafely<BankCubit>(
          () => BankCubit(
          sl(),
          sl(),
          sl(),
      ),
    );
  }
}