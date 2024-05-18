import 'package:InvoiceF/core/extensions/getit_extension.dart';
import 'package:InvoiceF/features/configuration/device_options/domain/use_cases/pick_image_device_option_use_cases.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/device_options_repo_impl.dart';
import '../presentation/manager/device_option_cubit.dart';

class DeviceOptionService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<DeviceOptionRepo>(
          () => DeviceOptionRepo(sl()),
    );

    sl.registerLazySingletonSafely<PickImageDeviceOptionUseCase>(
          () => PickImageDeviceOptionUseCase(sl()),
    );

    sl.registerLazySingletonSafely<DeviceOptionCubit>(
          () => DeviceOptionCubit(sl<PickImageDeviceOptionUseCase>()),
    );
  }
}
