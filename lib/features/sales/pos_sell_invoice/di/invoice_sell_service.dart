import 'package:InvoiceF/core/extensions/getit_extension.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/data/repositories/invoice_sell_repo_impl.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/create_invoice_sell_unit_use_case%20.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/create_invoice_sell_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/insert_invoice_sale_return_invoice_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/delete_invoice_sell_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/get_brances_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/get_clients_vendors_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/get_data_count_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/get_items_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/get_last_index_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/read_all_invoice_sells_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/read_invoice_sell_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/remove_invoice_sell_unit_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/search_item_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/update_invoice_sell_unit_quantity_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/use_cases/invoice_sell_use_cases/update_invoice_sell_use_case.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/presentation/manager/invoice_sell_cubit.dart';
import 'package:get_it/get_it.dart';

class InvoiceSellService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<InvoiceSellRepo>(
      () => InvoiceSellRepo(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllInvoiceSalesUseCase>(
      () => ReadAllInvoiceSalesUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<ReadInvoiceSellUseCase>(
      () => ReadInvoiceSellUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdateInvoiceSellUseCase>(
      () => UpdateInvoiceSellUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<CreateInvoiceSellUseCase>(
      () => CreateInvoiceSellUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<DeleteInvoiceSellUseCase>(
      () => DeleteInvoiceSellUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetLastIndexInvoiceSellUseCase>(
      () => GetLastIndexInvoiceSellUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetClientsVendorsInvoiceSellUseCase>(
      () => GetClientsVendorsInvoiceSellUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetBranchesInvoiceSellUseCase>(
      () => GetBranchesInvoiceSellUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetItemsInvoiceSellUseCase>(
      () => GetItemsInvoiceSellUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<SearchItemInvoiceSellUseCase>(
      () => SearchItemInvoiceSellUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetDataCountInvoiceSellUseCase>(
      () => GetDataCountInvoiceSellUseCase(invoiceSellRepo: sl()),
    );

    sl.registerLazySingletonSafely<CreateInvoiceSellUnitUseCase>(
      () => CreateInvoiceSellUnitUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<InsertInvoiceSaleReturnUseCase>(
      () => InsertInvoiceSaleReturnUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<RemoveInvoiceSellUnitUseCase>(
      () => RemoveInvoiceSellUnitUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdateInvoiceSellUnitQuantityUseCase>(
      () => UpdateInvoiceSellUnitQuantityUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<InvoiceSellCubit>(() => InvoiceSellCubit(
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
        ));
  }
}
