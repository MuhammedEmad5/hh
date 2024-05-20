import '../../data/repositories/device_options_repo_impl.dart';


class SaveDeviceOptionInSharedPrefUseCase {
  final DeviceOptionRepo deviceOptionRepo;

  SaveDeviceOptionInSharedPrefUseCase(this.deviceOptionRepo);


  Future<void> execute(Object object , String key) async {
    deviceOptionRepo.saveDeviceOptionsInSf(object, key);
  }

}
