import 'package:InvoiceF_Sales/core/utils/logger.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/data/models/invoice_sell_return_model.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/entities/invoice_sell_return_entity/invoice_sell_return_entity_model.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/create_invoice_sale_return_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/delete_invoice_sale_return_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/get_brances_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/get_invoice_data_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/get_last_index_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/read_all_invoice_sale_return_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/read_invoice_sale_return_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/invoice_sale_return/domain/use_cases/update_invoice_sale_return_use_case.dart';
import 'package:InvoiceF_Sales/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_sale_return_state.dart';
part 'invoice_sale_return_cubit.freezed.dart';

class InvoiceSaleReturnCubit extends Cubit<InvoiceSaleReturnState> {
  final ReadAllInvoiceSalesReturnUseCase readAllInvoiceSalesReturnUseCase;
  final CreateInvoiceSaleReturnUseCase createInvoiceSaleReturnUseCase;
  final ReadInvoiceSaleReturnUseCase readInvoiceSaleReturnUseCase;
  final UpdateInvoiceSaleReturnUseCase updateInvoiceSaleReturnUseCase;
  final DeleteInvoiceSaleReturnUseCase deleteInvoiceSaleReturnUseCase;
  final GetBranchesInvoiceSaleReturnUseCase getBranchesInvoiceSaleReturnUseCase;
  final GetLastIndexInvoiceSaleReturnUseCase
      getLastIndexInvoiceSaleReturnUseCase;
  final GetInvoiceDataInvoiceSaleReturnUseCase
      getInvoiceDataInvoiceSaleReturnUseCase;

  InvoiceSaleReturnCubit(
    this.readAllInvoiceSalesReturnUseCase,
    this.createInvoiceSaleReturnUseCase,
    this.readInvoiceSaleReturnUseCase,
    this.updateInvoiceSaleReturnUseCase,
    this.deleteInvoiceSaleReturnUseCase,
    this.getBranchesInvoiceSaleReturnUseCase,
    this.getLastIndexInvoiceSaleReturnUseCase,
    this.getInvoiceDataInvoiceSaleReturnUseCase,
  ) : super(const InvoiceSaleReturnState.loading());

  void insertInvoiceSaleReturn(
      InvoiceSellReturn invoiceSellReturnEntity) async {
    try {
      await createInvoiceSaleReturnUseCase.execute(invoiceSellReturnEntity);
      // emit(const InvoiceSaleReturnState.success(true));
    } catch (e) {
      emit(InvoiceSaleReturnState.error(e.toString()));
    }
  }

  void getAllInvoiceSalesReturn() async {
    try {
      emit(InvoiceSaleReturnState.loading());
      final invoice = await readAllInvoiceSalesReturnUseCase.execute();
      LoggerSingleton.logger.e(invoice.length);
      invoice.isEmpty
          ? emit(InvoiceSaleReturnState.empty())
          : emit(InvoiceSaleReturnState.success(invoice));
    } catch (e) {
      emit(InvoiceSaleReturnState.error(e.toString()));
    }
  }

  void getInvoiceSaleReturn({required double id}) async {
    try {
      final incvoiceSellEntity =
          await readInvoiceSaleReturnUseCase.execute(id: id);
      emit(InvoiceSaleReturnState.success([incvoiceSellEntity]));
    } catch (e) {
      emit(InvoiceSaleReturnState.error(e.toString()));
    }
  }

  void updateInvoiceSaleReturn(
      {required InvoiceSellReturnEntity invoiceSellReturnEntity}) async {
    try {
      await updateInvoiceSaleReturnUseCase.execute(invoiceSellReturnEntity,
          id: invoiceSellReturnEntity.invoiceNo);
      // emit(const InvoiceSaleReturnState.success(true));
    } catch (e) {
      emit(InvoiceSaleReturnState.error(e.toString()));
    }
  }

  void deleteInvoiceSaleReturn({required num id}) async {
    try {
      await deleteInvoiceSaleReturnUseCase.execute(id: id);
      // emit(const InvoiceSaleReturnState.success(true));
    } catch (e) {
      emit(InvoiceSaleReturnState.error(e.toString()));
    }
  }

  Future<String> getLastIndex() async {
    String dataCount = await getLastIndexInvoiceSaleReturnUseCase.execute(
        'InvoiceSellReturn', 'invoiceNo');
    return dataCount;
  }

  Future<List> getBranches() async {
    List branches = await getBranchesInvoiceSaleReturnUseCase.execute();
    return branches;
  }

  Future<InvoiceSellEntity> getInvoiceData(
      String invoiceNo, String buildingNo, String table) async {
    InvoiceSellEntity invoiceData = await getInvoiceDataInvoiceSaleReturnUseCase
        .execute(invoiceNo, buildingNo, table);
    return invoiceData;
  }
}
