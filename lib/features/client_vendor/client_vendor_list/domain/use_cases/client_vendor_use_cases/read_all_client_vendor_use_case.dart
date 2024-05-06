import '../../../data/mapper/client_vendor_mapper.dart';
import '../../../data/models/client_vendor_model.dart';
import '../../../data/repositories/client_vendor_repo.dart';
import '../../entities/client_vendor_entity/client_vendor_entity_model.dart';

class ReadAllClientVendorsUseCase {
  final ClientVendorRepo clientVendorRepo;

  ReadAllClientVendorsUseCase({required this.clientVendorRepo});

  Future<List<ClientVendorEntity>> execute() async {
    final List<dynamic> clientVendorJsonArr =
        await clientVendorRepo.getAll<ClientVendor>();
    final clientVendorObjects = clientVendorJsonArr
        .map((clientVendor) => ClientVendor.fromJson(clientVendor))
        .toList();
    List<ClientVendorEntity> clientVendors = [];
    for (ClientVendor clientVendor in clientVendorObjects) {
      clientVendors.add(ClientVendorMapper().convert(clientVendor));
    }
    return clientVendors;
  }
}
