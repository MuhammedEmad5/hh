import 'package:InvoiceF_ClientVendor/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/blocs/connection_type_bloc/connection_bloc.dart';
import '../../../../core/data/datasources/connection.dart';
import '../../../../core/data/datasources/local_data_source/sqlLite/local_connection.dart';
import '../../../../core/data/datasources/remote_data_source/remote_connection.dart';
import '../data/repositories/user_registration_impl.dart';
import '../domain/use_cases/create_user_use_case.dart';
import '../domain/use_cases/read_all_users_use_case.dart';
import '../domain/use_cases/update_user_use_case.dart';
import '../presentation/manager/user_registration_cubit.dart';

class UserRegistrationService {
  final sl = GetIt.instance;

  Future<void> initDi() async {

    sl.registerLazySingletonSafely<UserRegistrationRepo>(
      () => UserRegistrationRepo(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllUsersUseCase>(
      () => ReadAllUsersUseCase(sl()),
    );
    sl.registerLazySingletonSafely<CreateUserUseCase>(
      () => CreateUserUseCase(sl()),
    );
    sl.registerLazySingletonSafely<UpdateUserUseCase>(
      () => UpdateUserUseCase(sl()),
    );

    sl.registerLazySingletonSafely<UserRegistrationCubit>(
      () => UserRegistrationCubit(
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
