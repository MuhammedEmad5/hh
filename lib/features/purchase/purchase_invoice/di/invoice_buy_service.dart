import 'package:InvoiceF_ClientVendor/core/extensions/getit_extension.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/data/repositories/invoice_buy_repo_impl.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/create_invoice_buy_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/create_purchase_return_invoice_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/delete_invoice_buy_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/get_brances_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/get_clients_vendors_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/get_data_count_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/get_items_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/get_last_index_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/read_all_invoice_buy_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/read_invoice_buy_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/search_item_use_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/use_cases/invoice_buy_use_cases/update_invoice_sell_buy_case.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/presentation/manager/invoice_buy_cubit.dart';
import 'package:get_it/get_it.dart';

class InvoiceBuyService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<InvoiceBuyRepo>(
      () => InvoiceBuyRepo(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllInvoiceBuyUseCase>(
      () => ReadAllInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<ReadInvoiceBuyUseCase>(
      () => ReadInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdateInvoiceBuyUseCase>(
      () => UpdateInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<CreateInvoiceBuyUseCase>(
      () => CreateInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<DeleteInvoiceBuyUseCase>(
      () => DeleteInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetLastIndexInvoiceBuyUseCase>(
      () => GetLastIndexInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetClientsVendorsInvoiceBuyUseCase>(
      () => GetClientsVendorsInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetBranchesInvoiceBuyUseCase>(
      () => GetBranchesInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetItemsInvoiceBuyUseCase>(
      () => GetItemsInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<SearchItemInvoiceBuyUseCase>(
      () => SearchItemInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetDataCountInvoiceBuyUseCase>(
      () => GetDataCountInvoiceBuyUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<InsertPurchaseReturnInvoiceUseCase>(
      () => InsertPurchaseReturnInvoiceUseCase(invoiceBuyRepo: sl()),
    );
    sl.registerLazySingletonSafely<InvoiceBuyCubit>(
      () => InvoiceBuyCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(),
          sl(), sl(), sl(), sl()),
    );
  }
}
