import 'package:InvoiceF/core/utils/logger.dart';
import 'package:InvoiceF/features/sales/invoice_sale_return/data/models/invoice_sell_return_model.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_entity/invoice_sell_entity_model.dart';
import 'package:InvoiceF/features/sales/pos_sell_invoice/domain/entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_sell_state.dart';
part 'invoice_sell_cubit.freezed.dart';

class InvoiceSellCubit extends Cubit<InvoiceSellState> {
  final ReadAllInvoiceSalesUseCase readAllInvoiceSalesUseCase;
  final CreateInvoiceSellUseCase createInvoiceSellUseCase;
  final ReadInvoiceSellUseCase readInvoiceSellUseCase;
  final UpdateInvoiceSellUseCase updateInvoiceSellUseCase;
  final DeleteInvoiceSellUseCase deleteInvoiceSellUseCase;
  final GetLastIndexInvoiceSellUseCase getLastIndexInvoiceSellUseCase;
  final GetClientsVendorsInvoiceSellUseCase getClientsVendorsInvoiceSellUseCase;
  final GetBranchesInvoiceSellUseCase getBranchesInvoiceSellUseCase;
  final GetItemsInvoiceSellUseCase getItemsInvoiceSellUseCase;
  final SearchItemInvoiceSellUseCase searchItemInvoiceSellUseCase;
  final GetDataCountInvoiceSellUseCase getDataCountInvoiceSellUseCase;
  final CreateInvoiceSellUnitUseCase createInvoiceSellUnitUseCase;
  final InsertInvoiceSaleReturnUseCase insertInvoiceSaleReturnUseCase;
  final RemoveInvoiceSellUnitUseCase removeInvoiceSellUnitUseCase;
  final UpdateInvoiceSellUnitQuantityUseCase
      updateInvoiceSellUnitQuantityUseCase;

  InvoiceSellCubit(
    this.readAllInvoiceSalesUseCase,
    this.createInvoiceSellUseCase,
    this.readInvoiceSellUseCase,
    this.updateInvoiceSellUseCase,
    this.deleteInvoiceSellUseCase,
    this.getLastIndexInvoiceSellUseCase,
    this.getClientsVendorsInvoiceSellUseCase,
    this.getBranchesInvoiceSellUseCase,
    this.getItemsInvoiceSellUseCase,
    this.searchItemInvoiceSellUseCase,
    this.getDataCountInvoiceSellUseCase,
    this.createInvoiceSellUnitUseCase,
    this.insertInvoiceSaleReturnUseCase,
    this.removeInvoiceSellUnitUseCase,
    this.updateInvoiceSellUnitQuantityUseCase,
  ) : super(const InvoiceSellState.loading());

  void insertInvoiceSell(InvoiceSellEntity invoiceSellEntity) async {
    try {
      await createInvoiceSellUseCase.execute(invoiceSellEntity);
      emit(const InvoiceSellState.success(true));
    } catch (e) {
      emit(InvoiceSellState.error(e.toString()));
    }
  }

  void insertInvoiceSellUnit(InvoiceSellUnitEntity invoiceSellUnitEntity,
      int orderNo, int quantity) async {
    try {
      await createInvoiceSellUnitUseCase.execute(
          invoiceSellUnitEntity, orderNo, quantity);
    } catch (e) {
      emit(InvoiceSellState.error(e.toString()));
    }
  }

  void insertInvoiceSellReturn(
      InvoiceSellReturn invoiceSellReturnEntity) async {
    try {
      await insertInvoiceSaleReturnUseCase.execute(invoiceSellReturnEntity);
      emit(const InvoiceSellState.success(true));
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

  void removeItem(InvoiceSellUnitEntity invoiceSellUnitEntity) async {
    try {
      await removeInvoiceSellUnitUseCase.execute(invoiceSellUnitEntity);
      // emit(const InvoiceSellState.success(true));
    } catch (e) {
      emit(InvoiceSellState.error(e.toString()));
    }
  }

  void updateItemQuantity(
      InvoiceSellUnitEntity invoiceSellUnitEntity, String quantity) async {
    try {
      await updateInvoiceSellUnitQuantityUseCase.execute(
          invoiceSellUnitEntity, quantity);
      // emit(const InvoiceSellState.success(true));
    } catch (e) {
      emit(InvoiceSellState.error(e.toString()));
    }
  }

  Future<int> getDataCount() async {
    int dataCount = await getDataCountInvoiceSellUseCase.execute();
    return dataCount;
  }

  void getInvoiceData(String invoiceNo, bool isEdit) async {
    var data = {};
    try {
      var index = await getLastIndexInvoiceSellUseCase.execute(
          'InvoiceSell', 'invoiceNo');
      var clientsVendors = await getClientsVendorsInvoiceSellUseCase.execute();
      var branches = await getBranchesInvoiceSellUseCase.execute();
      List<InvoiceSellUnitEntity> items = [];
      if (isEdit) {
        items = await getItemsInvoiceSellUseCase.execute(invoiceNo);
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
        await searchItemInvoiceSellUseCase.execute(barCode, invoiceNo);
    return item;
  }
}
