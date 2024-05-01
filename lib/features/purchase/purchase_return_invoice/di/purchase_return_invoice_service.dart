import 'package:InvoiceF_ClientVendor/core/extensions/getit_extension.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/repositories/purchase_return_invoice_repo.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/domain/use_cases/create_purchase_return_invoice_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/domain/use_cases/delete_purchase_return_invoice_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/domain/use_cases/get_brances_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/domain/use_cases/get_invoice_data_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/domain/use_cases/get_last_index_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/domain/use_cases/read_all_purchase_return_invoice_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/domain/use_cases/read_purchase_return_invoice_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/domain/use_cases/update_purchase_return_invoice_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/presentation/manager/purchase_return_invoice_cubit.dart';
import 'package:get_it/get_it.dart';

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
    sl.registerLazySingletonSafely<GetBranchesPurchaseReturnInvoiceUseCase>(
      () => GetBranchesPurchaseReturnInvoiceUseCase(
          purchaseReturnInvoiceRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetLastIndexPurchaseReturnInvoiceUseCase>(
      () => GetLastIndexPurchaseReturnInvoiceUseCase(
          purchaseReturnInvoiceRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetInvoiceDataPurchaseReturnInvoiceUseCase>(
      () => GetInvoiceDataPurchaseReturnInvoiceUseCase(
          purchaseReturnInvoiceRepo: sl()),
    );
    sl.registerLazySingletonSafely<PurchaseReturnInvoiceCubit>(
      () => PurchaseReturnInvoiceCubit(
          sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
    );
  }
}
