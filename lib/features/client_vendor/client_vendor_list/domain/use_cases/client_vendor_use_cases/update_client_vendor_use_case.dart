import '../../../data/mapper/client_vendor_mapper.dart';
import '../../../data/models/client_vendor_model.dart';
import '../../../data/repositories/client_vendor_repo.dart';
import '../../entities/client_vendor_entity/client_vendor_entity_model.dart';

class UpdateClientVendorUseCase {
  final ClientVendorRepo clientVendorRepo;

  UpdateClientVendorUseCase({required this.clientVendorRepo});

  Future<void> execute(ClientVendorEntity clientVendorEntity,
      {required id}) async {
    final ClientVendor clientVendor =
        ClientVendorMapper().convert(clientVendorEntity);
    await clientVendorRepo.update<ClientVendor>(clientVendor, id: id);
  }
}
