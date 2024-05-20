import 'package:InvoiceF/features/configuration/device_options/domain/entities/device_option_entity/device_option_entity_model.dart';

import '../../data/repositories/device_options_repo_impl.dart';


class GetDeviceOptionInSharedPrefUseCase {
  final DeviceOptionRepo deviceOptionRepo;

  GetDeviceOptionInSharedPrefUseCase(this.deviceOptionRepo);


  Future<DeviceOptionEntity> execute(String key) async {
    DeviceOptionEntity deviceOptionEntity=await deviceOptionRepo.getDeviceOptionsFromSf(key);
    return deviceOptionEntity;
  }

}
