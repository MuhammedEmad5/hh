import 'package:open_file_plus/open_file_plus.dart';
import '../../data/repositories/device_options_repo_impl.dart';


class PickImageDeviceOptionUseCase {
  final DeviceOptionRepo deviceOptionRepo;

  PickImageDeviceOptionUseCase(this.deviceOptionRepo);
  var openResult = 'Unknown';
  Future<void> execute() async {
    const filePath = '/storage/emulated/0/update.apk';
    final result = await OpenFile.open(filePath);
    openResult = "type=${result.type}  message=${result.message}";
    print(openResult);
  }
}
