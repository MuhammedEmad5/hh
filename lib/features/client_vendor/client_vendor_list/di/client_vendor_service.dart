import 'package:InvoiceF_ClientVendor/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';
import '../data/repositories/client_vendor_repo.dart';
import '../domain/use_cases/client_vendor_use_cases/create_client_vendor_use_case.dart';
import '../domain/use_cases/client_vendor_use_cases/delete_client_vendor_use_case.dart';
import '../domain/use_cases/client_vendor_use_cases/read_all_client_vendor_use_case.dart';
import '../domain/use_cases/client_vendor_use_cases/read_client_vendor_use_case.dart';
import '../domain/use_cases/client_vendor_use_cases/update_client_vendor_use_case.dart';
import '../presentation/manager/client_vendor_cubit.dart';

class ClientVendorService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<ClientVendorRepo>(
      () => ClientVendorRepo(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllClientVendorsUseCase>(
      () => ReadAllClientVendorsUseCase(clientVendorRepo: sl()),
    );
    sl.registerLazySingletonSafely<ReadClientVendorUseCase>(
      () => ReadClientVendorUseCase(clientVendorRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdateClientVendorUseCase>(
      () => UpdateClientVendorUseCase(clientVendorRepo: sl()),
    );
    sl.registerLazySingletonSafely<CreateClientVendorUseCase>(
      () => CreateClientVendorUseCase(clientVendorRepo: sl()),
    );
    sl.registerLazySingletonSafely<DeleteClientVendorUseCase>(
      () => DeleteClientVendorUseCase(clientVendorRepo: sl()),
    );
    sl.registerLazySingletonSafely<ClientVendorCubit>(
      () => ClientVendorCubit(sl(), sl(), sl(), sl(), sl()),
    );
  }
}
