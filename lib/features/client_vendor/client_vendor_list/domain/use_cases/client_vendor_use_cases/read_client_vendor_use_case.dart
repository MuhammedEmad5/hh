import '../../../../../../core/utils/logger.dart';
import '../../../data/mapper/client_vendor_mapper.dart';
import '../../../data/models/client_vendor_model.dart';
import '../../../data/repositories/client_vendor_repo.dart';
import '../../entities/client_vendor_entity/client_vendor_entity_model.dart';

class ReadClientVendorUseCase {
  final ClientVendorRepo clientVendorRepo;

  ReadClientVendorUseCase({required this.clientVendorRepo});

  Future<ClientVendorEntity> execute({required double id}) async {
    final clientVendorJsonArr =
        await clientVendorRepo.getOne<ClientVendor>(id: id);
    final clientVendorData = clientVendorJsonArr.first;
    final clientVendorObject = ClientVendor.fromJson(clientVendorData);
    final ClientVendorEntity clientVendorEntityObject =
        ClientVendorMapper().convert(clientVendorObject);
    LoggerSingleton.logger.i(clientVendorEntityObject.toJson());

    return clientVendorEntityObject;
  }
}
