import 'package:InvoiceF_ClientVendor/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/purchase_return_invoice_repo.dart';
import '../domain/use_cases/create_purchase_return_invoice_use_case.dart';
import '../domain/use_cases/delete_purchase_return_invoice_use_case.dart';
import '../domain/use_cases/read_all_purchase_return_invoice_use_case.dart';
import '../domain/use_cases/read_purchase_return_invoice_use_case.dart';
import '../domain/use_cases/update_purchase_return_invoice_use_case.dart';
import '../presentation/manager/purchase_return_invoice_cubit.dart';

class PurchaseReturnInvoiceService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<PurchaseReturnInvoiceRepo>(
      () => PurchaseReturnInvoiceRepo(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllPurchaseReturnInvoiceUseCase>(
      () =>
          ReadAllPurchaseReturnInvoiceUseCase(purchaseReturnInvoiceRepo: sl()),
    );
    sl.registerLazySingletonSafely<ReadPurchaseReturnInvoiceUseCase>(
      () => ReadPurchaseReturnInvoiceUseCase(purchaseReturnInvoiceRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdatePurchaseReturnInvoiceUseCase>(
      () => UpdatePurchaseReturnInvoiceUseCase(purchaseReturnInvoiceRepo: sl()),
    );
    sl.registerLazySingletonSafely<CreatePurchaseReturnInvoiceUseCase>(
      () => CreatePurchaseReturnInvoiceUseCase(purchaseReturnInvoiceRepo: sl()),
    );
    sl.registerLazySingletonSafely<DeletePurchaseReturnInvoiceUseCase>(
      () => DeletePurchaseReturnInvoiceUseCase(purchaseReturnInvoiceRepo: sl()),
    );
    sl.registerLazySingletonSafely<PurchaseReturnInvoiceCubit>(
      () => PurchaseReturnInvoiceCubit(sl(), sl(), sl(), sl(), sl()),
    );
  }
}
