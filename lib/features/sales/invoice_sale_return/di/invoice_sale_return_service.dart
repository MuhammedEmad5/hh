import 'package:InvoiceF_Sales/core/extensions/getit_extension.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/invoice_sale_return_repo.dart';
import '../domain/use_cases/create_invoice_sale_return_use_case.dart';
import '../domain/use_cases/delete_invoice_sale_return_use_case.dart';
import '../domain/use_cases/read_all_invoice_sale_return_use_case.dart';
import '../domain/use_cases/read_invoice_sale_return_use_case.dart';
import '../domain/use_cases/update_invoice_sale_return_use_case.dart';
import '../presentation/manager/invoice_sale_return_cubit.dart';

class InvoiceSaleReturnService {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely<InvoiceSaleReturnRepo>(
      () => InvoiceSaleReturnRepo(sl()),
    );
    sl.registerLazySingletonSafely<ReadAllInvoiceSalesReturnUseCase>(
      () => ReadAllInvoiceSalesReturnUseCase(invoiceSaleReturnRepo: sl()),
    );
    sl.registerLazySingletonSafely<ReadInvoiceSaleReturnUseCase>(
      () => ReadInvoiceSaleReturnUseCase(invoiceSaleReturnRepo: sl()),
    );
    sl.registerLazySingletonSafely<UpdateInvoiceSaleReturnUseCase>(
      () => UpdateInvoiceSaleReturnUseCase(invoiceSaleReturnRepo: sl()),
    );
    sl.registerLazySingletonSafely<CreateInvoiceSaleReturnUseCase>(
      () => CreateInvoiceSaleReturnUseCase(invoiceSaleReturnRepo: sl()),
    );
    sl.registerLazySingletonSafely<DeleteInvoiceSaleReturnUseCase>(
      () => DeleteInvoiceSaleReturnUseCase(invoiceSaleReturnRepo: sl()),
    );
    sl.registerLazySingletonSafely<InvoiceSaleReturnCubit>(
      () => InvoiceSaleReturnCubit(sl(), sl(), sl(), sl(), sl()),
    );
  }
}
