import 'package:InvoiceF/core/extensions/getit_extension.dart';
import 'package:InvoiceF/features/configuration/device_options/domain/use_cases/pick_image_device_option_use_cases.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../data/repositories/device_options_repo_impl.dart';
import '../domain/entities/device_option_entity/device_option_entity_model.dart';
import '../domain/use_cases/get_device_option_in_sf_use_cases.dart';
import '../domain/use_cases/save_device_option_in_sf_use_cases.dart';
import '../presentation/manager/device_option_cubit.dart';

class DeviceOptionService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<SfManager>(
      () => SfManager(),
    );

    sl.registerLazySingletonSafely<DeviceOptionRepo>(
      () => DeviceOptionRepo(sl(), sl()),
    );

    sl.registerLazySingletonSafely<PickImageDeviceOptionUseCase>(
      () => PickImageDeviceOptionUseCase(sl()),
    );
    sl.registerLazySingletonSafely<SaveDeviceOptionInSharedPrefUseCase>(
          () => SaveDeviceOptionInSharedPrefUseCase(sl()),
    );

    sl.registerLazySingletonSafely<GetDeviceOptionInSharedPrefUseCase>(
          () => GetDeviceOptionInSharedPrefUseCase(sl()),
    );

    sl.registerLazySingletonSafely<DeviceOptionCubit>(
      () => DeviceOptionCubit(
          sl<PickImageDeviceOptionUseCase>(),
          sl<SaveDeviceOptionInSharedPrefUseCase>(),
          sl<GetDeviceOptionInSharedPrefUseCase>(),
      ),
    );
  }
}
