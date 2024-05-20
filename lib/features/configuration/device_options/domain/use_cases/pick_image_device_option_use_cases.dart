import 'package:image_picker/image_picker.dart';
import '../../data/repositories/device_options_repo_impl.dart';

class PickImageDeviceOptionUseCase {
  final DeviceOptionRepo deviceOptionRepo;
  final ImagePicker _picker = ImagePicker();

  PickImageDeviceOptionUseCase(this.deviceOptionRepo);

  Future<String?> execute() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image.path;
    } else {
      return null;
    }
  }
}
