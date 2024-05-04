import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/models/client_vendor_beginning_balance_model.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/repositories/beginning_balance_repo.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/domain/entities/beginning_balance_entity.dart';

class ReadAllBeginningBalanceUseCase {
  final BeginningBalanceRepo beginningBalanceRepo;

  ReadAllBeginningBalanceUseCase(this.beginningBalanceRepo);

  Future<List<BeginningBalanceEntity>> execute() async {

    final List<dynamic> clientVendorBeginningBalanceJsonArr =
    await beginningBalanceRepo.getAll<ClientVendorBeginningBalance>();
    final clientVendorBeginningBalanceObjects =
    clientVendorBeginningBalanceJsonArr.map((clientVendorBeginningBalance) => ClientVendorBeginningBalance.fromJson(clientVendorBeginningBalance)).toList();
    List<BeginningBalanceEntity> beginningBalanceList = [];
    for (ClientVendorBeginningBalance clientVendorBeginningBalance in clientVendorBeginningBalanceObjects) {
      beginningBalanceList.add(ClientVendorBeginningBalanceMapper().convert(clientVendorBeginningBalance));
    }

    return beginningBalanceList;
  }
}
