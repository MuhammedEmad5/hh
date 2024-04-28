import 'package:InvoiceF_Sales/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';
import '../data/repositories/invoice_sell_repo_impl.dart';
import '../domain/use_cases/invoice_sell_use_cases/create_invoice_sell_use_case.dart';
import '../domain/use_cases/invoice_sell_use_cases/delete_invoice_sell_use_case.dart';
import '../domain/use_cases/invoice_sell_use_cases/get_brances_use_case.dart';
import '../domain/use_cases/invoice_sell_use_cases/get_clients_vendors_use_case.dart';
import '../domain/use_cases/invoice_sell_use_cases/get_items_use_case.dart';
import '../domain/use_cases/invoice_sell_use_cases/get_last_index_use_case.dart';
import '../domain/use_cases/invoice_sell_use_cases/read_all_invoice_sells_use_case.dart';
import '../domain/use_cases/invoice_sell_use_cases/read_invoice_sell_use_case.dart';
import '../domain/use_cases/invoice_sell_use_cases/search_item_use_case.dart';
import '../domain/use_cases/invoice_sell_use_cases/update_invoice_sell_use_case.dart';
import '../presentation/manager/invoice_sell_cubit.dart';

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
    sl.registerLazySingletonSafely<GetLastIndexUseCase>(
      () => GetLastIndexUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetClientsVendorsUseCase>(
      () => GetClientsVendorsUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetBranchesUseCase>(
      () => GetBranchesUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetItemsUseCase>(
      () => GetItemsUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<SearchItemUseCase>(
      () => SearchItemUseCase(invoiceSellRepo: sl()),
    );
    sl.registerLazySingletonSafely<InvoiceSellCubit>(
      () => InvoiceSellCubit(
          sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
    );
  }
}
