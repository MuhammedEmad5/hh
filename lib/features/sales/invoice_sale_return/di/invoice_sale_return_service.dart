import 'package:InvoiceF_Sales/core/extensions/getit_extension.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/repositories/invoice_sale_return_repo.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/create_invoice_sale_return_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/delete_invoice_sale_return_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/get_brances_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/get_invoice_data_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/get_last_index_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/read_all_invoice_sale_return_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/read_invoice_sale_return_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/update_invoice_sale_return_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/presentation/manager/invoice_sale_return_cubit.dart';
import 'package:get_it/get_it.dart';

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
    sl.registerLazySingletonSafely<GetBranchesInvoiceSaleReturnUseCase>(
      () => GetBranchesInvoiceSaleReturnUseCase(invoiceSaleReturnRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetLastIndexInvoiceSaleReturnUseCase>(
      () => GetLastIndexInvoiceSaleReturnUseCase(invoiceSaleReturnRepo: sl()),
    );
    sl.registerLazySingletonSafely<GetInvoiceDataInvoiceSaleReturnUseCase>(
      () => GetInvoiceDataInvoiceSaleReturnUseCase(invoiceSaleReturnRepo: sl()),
    );
    sl.registerLazySingletonSafely<InvoiceSaleReturnCubit>(
      () => InvoiceSaleReturnCubit(
          sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
    );
  }
}
