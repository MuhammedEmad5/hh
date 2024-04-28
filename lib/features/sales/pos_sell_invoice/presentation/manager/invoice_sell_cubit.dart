import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/logger.dart';
import '../../domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import '../../domain/entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
import '../../domain/use_cases/invoice_sell_use_cases/create_invoice_sell_use_case.dart';
import '../../domain/use_cases/invoice_sell_use_cases/delete_invoice_sell_use_case.dart';
import '../../domain/use_cases/invoice_sell_use_cases/get_brances_use_case.dart';
import '../../domain/use_cases/invoice_sell_use_cases/get_clients_vendors_use_case.dart';
import '../../domain/use_cases/invoice_sell_use_cases/get_items_use_case.dart';
import '../../domain/use_cases/invoice_sell_use_cases/get_last_index_use_case.dart';
import '../../domain/use_cases/invoice_sell_use_cases/read_all_invoice_sells_use_case.dart';
import '../../domain/use_cases/invoice_sell_use_cases/read_invoice_sell_use_case.dart';
import '../../domain/use_cases/invoice_sell_use_cases/search_item_use_case.dart';
import '../../domain/use_cases/invoice_sell_use_cases/update_invoice_sell_use_case.dart';

part 'invoice_sell_state.dart';
part 'invoice_sell_cubit.freezed.dart';

class InvoiceSellCubit extends Cubit<InvoiceSellState> {
  final ReadAllInvoiceSalesUseCase readAllInvoiceSalesUseCase;
  final CreateInvoiceSellUseCase createInvoiceSellUseCase;
  final ReadInvoiceSellUseCase readInvoiceSellUseCase;
  final UpdateInvoiceSellUseCase updateInvoiceSellUseCase;
  final DeleteInvoiceSellUseCase deleteInvoiceSellUseCase;
  final GetLastIndexUseCase getLastIndexUseCase;
  final GetClientsVendorsUseCase getClientsVendorsUseCase;
  final GetBranchesUseCase getBranchesUseCase;
  final GetItemsUseCase getItemsUseCase;
  final SearchItemUseCase searchItemUseCase;

  InvoiceSellCubit(
    this.readAllInvoiceSalesUseCase,
    this.createInvoiceSellUseCase,
    this.readInvoiceSellUseCase,
    this.updateInvoiceSellUseCase,
    this.deleteInvoiceSellUseCase,
    this.getLastIndexUseCase,
    this.getClientsVendorsUseCase,
    this.getBranchesUseCase,
    this.getItemsUseCase,
    this.searchItemUseCase,
  ) : super(const InvoiceSellState.loading());

  void insertInvoiceSell(InvoiceSellEntity invoiceSellEntity) async {
    try {
      await createInvoiceSellUseCase.execute(invoiceSellEntity);
      // emit(const InvoiceSellState.success(true));
    } catch (e) {
      emit(InvoiceSellState.error(e.toString()));
    }
  }

  void getInvoiceSells() async {
    try {
      final invoice = await readAllInvoiceSalesUseCase.execute();
      LoggerSingleton.logger.e(invoice.length);
      emit(InvoiceSellState.success(invoice));
    } catch (e) {
      emit(InvoiceSellState.error(e.toString()));
    }
  }

  void getInvoiceSell({required double id}) async {
    try {
      final incvoiceSellEntity = await readInvoiceSellUseCase.execute(id: id);
      emit(InvoiceSellState.success([incvoiceSellEntity]));
    } catch (e) {
      emit(InvoiceSellState.error(e.toString()));
    }
  }

  void updateInvoiceSell({required InvoiceSellEntity invoiceSellEntity}) async {
    try {
      await updateInvoiceSellUseCase.execute(invoiceSellEntity,
          id: invoiceSellEntity.invoiceNo);
      // emit(const InvoiceSellState.success(true));
    } catch (e) {
      emit(InvoiceSellState.error(e.toString()));
    }
  }

  void deleteInvoiceSell({required num id}) async {
    try {
      await deleteInvoiceSellUseCase.execute(id: id);
      // emit(const InvoiceSellState.success(true));
    } catch (e) {
      emit(InvoiceSellState.error(e.toString()));
    }
  }

  void getInvoiceData(String invoiceNo, bool isEdit) async {
    var data = {};
    try {
      var index = await getLastIndexUseCase.execute('InvoiceSell', 'invoiceNo');
      var clientsVendors = await getClientsVendorsUseCase.execute();
      var branches = await getBranchesUseCase.execute();
      List<InvoiceSellUnitEntity> items = [];
      if (isEdit) {
        items = await getItemsUseCase.execute(invoiceNo);
      }
      data = {
        'index': index,
        'clientsVendors': clientsVendors,
        'branches': branches,
        'items': items,
      };
      emit(InvoiceSellState.invoiceSellDataLoaded(data));
    } catch (e) {
      emit(InvoiceSellState.error(e.toString()));
    }
  }

  Future<InvoiceSellUnitEntity> searchItem(
      String barCode, String invoiceNo) async {
    InvoiceSellUnitEntity item =
        await searchItemUseCase.execute(barCode, invoiceNo);
    return item;
  }
}
