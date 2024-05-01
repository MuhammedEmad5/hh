import 'package:InvoiceF_ClientVendor/core/utils/logger.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_invoice/domain/entities/invoice_buy_unit/invoice_buy_unit_entity_model.dart';
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
import 'package:InvoiceF_ClientVendor/features/purchase/purchase_return_invoice/data/models/invoice_buy_return_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_buy_state.dart';
part 'invoice_buy_cubit.freezed.dart';

class InvoiceBuyCubit extends Cubit<InvoiceBuyState> {
  final ReadAllInvoiceBuyUseCase readAllInvoiceBuyUseCase;
  final CreateInvoiceBuyUseCase createInvoiceBuyUseCase;
  final ReadInvoiceBuyUseCase readInvoiceBuyUseCase;
  final UpdateInvoiceBuyUseCase updateInvoiceBuyUseCase;
  final DeleteInvoiceBuyUseCase deleteInvoiceBuyUseCase;
  final GetLastIndexInvoiceBuyUseCase getLastIndexInvoiceBuyUseCase;
  final GetClientsVendorsInvoiceBuyUseCase getClientsVendorsInvoiceBuyUseCase;
  final GetBranchesInvoiceBuyUseCase getBranchesInvoiceBuyUseCase;
  final GetItemsInvoiceBuyUseCase getItemsInvoiceBuyUseCase;
  final SearchItemInvoiceBuyUseCase searchItemInvoiceBuyUseCase;
  final GetDataCountInvoiceBuyUseCase getDataCountInvoiceBuyUseCase;
  final InsertPurchaseReturnInvoiceUseCase insertPurchaseReturnInvoiceUseCase;

  InvoiceBuyCubit(
    this.readAllInvoiceBuyUseCase,
    this.createInvoiceBuyUseCase,
    this.readInvoiceBuyUseCase,
    this.updateInvoiceBuyUseCase,
    this.deleteInvoiceBuyUseCase,
    this.getLastIndexInvoiceBuyUseCase,
    this.getClientsVendorsInvoiceBuyUseCase,
    this.getBranchesInvoiceBuyUseCase,
    this.getItemsInvoiceBuyUseCase,
    this.searchItemInvoiceBuyUseCase,
    this.getDataCountInvoiceBuyUseCase,
    this.insertPurchaseReturnInvoiceUseCase,
  ) : super(const InvoiceBuyState.loading());

  void insertInvoiceBuy(InvoiceBuyEntity invoiceBuyEntity) async {
    try {
      await createInvoiceBuyUseCase.execute(invoiceBuyEntity);
      emit(const InvoiceBuyState.success(true));
    } catch (e) {
      emit(InvoiceBuyState.error(e.toString()));
    }
  }

  void insertPurchaseReturnInvoice(
      InvoiceBuyReturn invoiceBuyReturnEntity) async {
    try {
      await insertPurchaseReturnInvoiceUseCase.execute(invoiceBuyReturnEntity);
      emit(const InvoiceBuyState.success(true));
    } catch (e) {
      emit(InvoiceBuyState.error(e.toString()));
    }
  }

  void getInvoiceBuys() async {
    try {
      final invoice = await readAllInvoiceBuyUseCase.execute();
      LoggerSingleton.logger.e(invoice.length);
      emit(InvoiceBuyState.success(invoice));
    } catch (e) {
      emit(InvoiceBuyState.error(e.toString()));
    }
  }

  void getInvoiceBuy({required double id}) async {
    try {
      final incvoiceBuyEntity = await readInvoiceBuyUseCase.execute(id: id);
      emit(InvoiceBuyState.success([incvoiceBuyEntity]));
    } catch (e) {
      emit(InvoiceBuyState.error(e.toString()));
    }
  }

  void updateInvoiceBuy({required InvoiceBuyEntity invoiceBuyEntity}) async {
    try {
      await updateInvoiceBuyUseCase.execute(invoiceBuyEntity,
          id: invoiceBuyEntity.invoiceNo);
      // emit(const InvoiceBuyState.success(true));
    } catch (e) {
      emit(InvoiceBuyState.error(e.toString()));
    }
  }

  void deleteInvoiceBuy({required num id}) async {
    try {
      await deleteInvoiceBuyUseCase.execute(id: id);
      emit(const InvoiceBuyState.success(true));
    } catch (e) {
      emit(InvoiceBuyState.error(e.toString()));
    }
  }

  Future<int> getDataCount() async {
    int dataCount = await getDataCountInvoiceBuyUseCase.execute();
    return dataCount;
  }

  void getInvoiceData(String invoiceNo, bool isEdit) async {
    var data = {};
    try {
      var index = await getLastIndexInvoiceBuyUseCase.execute(
          'InvoiceBuy', 'invoiceNo');
      var clientsVendors = await getClientsVendorsInvoiceBuyUseCase.execute();
      var branches = await getBranchesInvoiceBuyUseCase.execute();
      List<InvoiceBuyUnitEntity> items = [];
      if (isEdit) {
        items = await getItemsInvoiceBuyUseCase.execute(invoiceNo);
      }
      data = {
        'index': index,
        'clientsVendors': clientsVendors,
        'branches': branches,
        'items': items,
      };
      emit(InvoiceBuyState.invoiceBuyDataLoaded(data));
    } catch (e) {
      emit(InvoiceBuyState.error(e.toString()));
    }
  }

  Future<InvoiceBuyUnitEntity> searchItem(
      String barCode, String invoiceNo) async {
    InvoiceBuyUnitEntity item =
        await searchItemInvoiceBuyUseCase.execute(barCode, invoiceNo);
    return item;
  }
}
