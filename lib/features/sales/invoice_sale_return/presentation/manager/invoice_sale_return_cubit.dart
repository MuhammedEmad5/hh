import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/logger.dart';
import '../../data/models/invoice_sell_return_model.dart';
import '../../domain/entities/invoice_sell_return_entity/invoice_sell_return_entity_model.dart';
import '../../domain/use_cases/create_invoice_sale_return_use_case.dart';
import '../../domain/use_cases/delete_invoice_sale_return_use_case.dart';
import '../../domain/use_cases/read_all_invoice_sale_return_use_case.dart';
import '../../domain/use_cases/read_invoice_sale_return_use_case.dart';
import '../../domain/use_cases/update_invoice_sale_return_use_case.dart';

part 'invoice_sale_return_state.dart';
part 'invoice_sale_return_cubit.freezed.dart';

class InvoiceSaleReturnCubit extends Cubit<InvoiceSaleReturnState> {
  final ReadAllInvoiceSalesReturnUseCase readAllInvoiceSalesReturnUseCase;
  final CreateInvoiceSaleReturnUseCase createInvoiceSaleReturnUseCase;
  final ReadInvoiceSaleReturnUseCase readInvoiceSaleReturnUseCase;
  final UpdateInvoiceSaleReturnUseCase updateInvoiceSaleReturnUseCase;
  final DeleteInvoiceSaleReturnUseCase deleteInvoiceSaleReturnUseCase;

  InvoiceSaleReturnCubit(
      this.readAllInvoiceSalesReturnUseCase,
      this.createInvoiceSaleReturnUseCase,
      this.readInvoiceSaleReturnUseCase,
      this.updateInvoiceSaleReturnUseCase,
      this.deleteInvoiceSaleReturnUseCase)
      : super(const InvoiceSaleReturnState.loading());

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
}
