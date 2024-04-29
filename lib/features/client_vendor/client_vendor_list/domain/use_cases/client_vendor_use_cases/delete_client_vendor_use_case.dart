
import '../../../data/models/client_vendor_model.dart';
import '../../../data/repositories/client_vendor_repo.dart';

class DeleteClientVendorUseCase {
  final ClientVendorRepo clientVendorRepo;

  DeleteClientVendorUseCase({required this.clientVendorRepo});

  Future<void> execute({required num id}) async {
    await clientVendorRepo.delete<ClientVendor>(id: id);
  }
}
