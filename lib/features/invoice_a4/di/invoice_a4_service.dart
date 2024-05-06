import 'package:InvoiceF/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/invoice_a4_repo_impl.dart';
import '../domain/use_cases/get_brances_use_case.dart';
import '../domain/use_cases/get_client_vendor_data_use_case.dart';
import '../domain/use_cases/get_company_data_use_case.dart';
import '../domain/use_cases/get_invoice_data.dart';
import '../domain/use_cases/get_items_use_case.dart';
import '../presentation/manager/invoice_a4_cubit.dart';

class InvoiceA4Service {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<InvoiceA4Repo>(
      () => InvoiceA4Repo(sl()),
    );
    sl.registerLazySingletonSafely<GetBranchesInvoiceA4UseCase>(
      () => GetBranchesInvoiceA4UseCase(invoiceA4Repo: sl()),
    );
    sl.registerLazySingletonSafely<GetCompanyDataInvoiceA4UseCase>(
      () => GetCompanyDataInvoiceA4UseCase(invoiceA4Repo: sl()),
    );
    sl.registerLazySingletonSafely<GetClientVendorDataInvoiceA4UseCase>(
      () => GetClientVendorDataInvoiceA4UseCase(invoiceA4Repo: sl()),
    );
    sl.registerLazySingletonSafely<GetInvoiceDataInvoiceA4UseCase>(
      () => GetInvoiceDataInvoiceA4UseCase(invoiceA4Repo: sl()),
    );

    sl.registerLazySingletonSafely<GetInvoiceItemsInvoiceA4UseCase>(
      () => GetInvoiceItemsInvoiceA4UseCase(invoiceA4Repo: sl()),
    );
    sl.registerLazySingletonSafely<InvoiceA4Cubit>(
      () => InvoiceA4Cubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
