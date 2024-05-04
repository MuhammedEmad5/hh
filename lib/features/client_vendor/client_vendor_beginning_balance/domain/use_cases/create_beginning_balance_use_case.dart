import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/models/client_vendor_beginning_balance_model.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/repositories/beginning_balance_repo.dart';
import 'package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/domain/entities/beginning_balance_entity.dart';

class CreateBeginningBalanceUseCase {
  final BeginningBalanceRepo beginningBalanceRepo;

  CreateBeginningBalanceUseCase( this.beginningBalanceRepo);

  Future<void> execute(BeginningBalanceEntity beginningBalance) async {
    final ClientVendorBeginningBalance clientVendorBeginningBalance = ClientVendorBeginningBalanceMapper().convert(beginningBalance);
    await beginningBalanceRepo.insert(clientVendorBeginningBalance);
  }
}