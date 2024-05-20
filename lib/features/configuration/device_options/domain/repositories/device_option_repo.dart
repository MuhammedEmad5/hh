import '../entities/device_option_entity/device_option_entity_model.dart';

abstract class IDeviceOptionRepo {
  void saveDeviceOptionsInSf(Object object, String key);
  Future<DeviceOptionEntity> getDeviceOptionsFromSf(String key);
}
