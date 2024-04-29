
import '../../../data/mapper/client_vendor_mapper.dart';
import '../../../data/models/client_vendor_model.dart';
import '../../../data/repositories/client_vendor_repo.dart';
import '../../entities/client_vendor_entity/client_vendor_entity_model.dart';

class CreateClientVendorUseCase {
  final ClientVendorRepo clientVendorRepo;

  CreateClientVendorUseCase({required this.clientVendorRepo});

  Future<void> execute(ClientVendorEntity clientVendorEntity) async {
    final ClientVendor clientVendor =
        ClientVendorMapper().convert(clientVendorEntity);
    await clientVendorRepo.insert(clientVendor);
  }
}
