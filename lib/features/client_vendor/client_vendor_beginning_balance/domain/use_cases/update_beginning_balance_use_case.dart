import 'package:InvoiceF/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart';
import 'package:InvoiceF/features/client_vendor/client_vendor_beginning_balance/data/models/client_vendor_beginning_balance_model.dart';
import 'package:InvoiceF/features/client_vendor/client_vendor_beginning_balance/data/repositories/beginning_balance_repo.dart';
import 'package:InvoiceF/features/client_vendor/client_vendor_beginning_balance/domain/entities/beginning_balance_entity.dart';

class UpdateBeginningBalanceUseCase {
  final BeginningBalanceRepo beginningBalanceRepo;

  UpdateBeginningBalanceUseCase( this.beginningBalanceRepo);

  Future<void> execute(BeginningBalanceEntity beginningBalanceEntity,{required id}) async {
    final ClientVendorBeginningBalance clientVendorBeginningBalance = ClientVendorBeginningBalanceMapper().convert(beginningBalanceEntity);
    await beginningBalanceRepo.update<ClientVendorBeginningBalance>(clientVendorBeginningBalance, id: id);
  }
}