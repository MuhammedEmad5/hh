import 'package:InvoiceF/features/configuration/device_options/domain/repositories/device_option_repo.dart';
import '../../../../../core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import '../../../../../core/data/repos/base_repo_class.dart';
import '../../domain/entities/device_option_entity/device_option_entity_model.dart';


class DeviceOptionRepo extends BaseRepoClass implements IDeviceOptionRepo {
  final SfManager sfManager;

  DeviceOptionRepo(super.connection, this.sfManager);

  @override
  void saveDeviceOptionsInSf(Object object, String key) async {
    await sfManager.saveObject(key, object);
  }

  @override
  Future<DeviceOptionEntity> getDeviceOptionsFromSf(String key) async {
    final result = await sfManager.getObject(key, (p0) => DeviceOptionEntity.fromJson(p0));
    if (result != null) {
      return result;
    } else {
      return DeviceOptionEntity();
    }
  }
}

