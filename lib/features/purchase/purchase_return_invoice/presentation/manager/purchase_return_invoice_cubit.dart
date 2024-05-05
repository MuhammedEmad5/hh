import 'package:InvoiceF/core/utils/logger.dart';
import 'package:InvoiceF/features/purchase/purchase_invoice/domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/data/models/invoice_buy_return_model.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/entities/invoice_buy_return_entity/invoice_buy_return_entity_model.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/use_cases/create_purchase_return_invoice_use_case.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/use_cases/delete_purchase_return_invoice_use_case.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/use_cases/get_brances_use_case.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/use_cases/get_invoice_data_use_case.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/use_cases/get_last_index_use_case.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/use_cases/read_all_purchase_return_invoice_use_case.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/use_cases/read_purchase_return_invoice_use_case.dart';
import 'package:InvoiceF/features/purchase/purchase_return_invoice/domain/use_cases/update_purchase_return_invoice_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_return_invoice_state.dart';
part 'purchase_return_invoice_cubit.freezed.dart';

class PurchaseReturnInvoiceCubit extends Cubit<PurchaseReturnInvoiceState> {
  final ReadAllPurchaseReturnInvoiceUseCase readAllPurchaseReturnInvoiceUseCase;
  final CreatePurchaseReturnInvoiceUseCase createPurchaseReturnInvoiceUseCase;
  final ReadPurchaseReturnInvoiceUseCase readPurchaseReturnInvoiceUseCase;
  final UpdatePurchaseReturnInvoiceUseCase updatePurchaseReturnInvoiceUseCase;
  final DeletePurchaseReturnInvoiceUseCase deletePurchaseReturnInvoiceUseCase;
  final GetBranchesPurchaseReturnInvoiceUseCase
      getBranchesPurchaseReturnInvoiceUseCase;
  final GetLastIndexPurchaseReturnInvoiceUseCase
      getLastIndexPurchaseReturnInvoiceUseCase;
  final GetInvoiceDataPurchaseReturnInvoiceUseCase
      getInvoiceDataPurchaseReturnInvoiceUseCase;

  PurchaseReturnInvoiceCubit(
    this.readAllPurchaseReturnInvoiceUseCase,
    this.createPurchaseReturnInvoiceUseCase,
    this.readPurchaseReturnInvoiceUseCase,
    this.updatePurchaseReturnInvoiceUseCase,
    this.deletePurchaseReturnInvoiceUseCase,
    this.getBranchesPurchaseReturnInvoiceUseCase,
    this.getLastIndexPurchaseReturnInvoiceUseCase,
    this.getInvoiceDataPurchaseReturnInvoiceUseCase,
  ) : super(const PurchaseReturnInvoiceState.loading());

  void insertPurchaseReturnInvoice(
      InvoiceBuyReturn invoiceBuyReturnEntity) async {
    try {
      await createPurchaseReturnInvoiceUseCase.execute(invoiceBuyReturnEntity);
      // emit(const PurchaseReturnInvoiceState.success(true));
    } catch (e) {
      emit(PurchaseReturnInvoiceState.error(e.toString()));
    }
  }

  void getAllPurchaseReturnInvoice() async {
    try {
      emit(const PurchaseReturnInvoiceState.loading());
      final invoice = await readAllPurchaseReturnInvoiceUseCase.execute();
      LoggerSingleton.logger.e(invoice.length);
      invoice.isEmpty
          ? emit(const PurchaseReturnInvoiceState.empty())
          : emit(PurchaseReturnInvoiceState.success(invoice));
    } catch (e) {
      emit(PurchaseReturnInvoiceState.error(e.toString()));
    }
  }

  void getPurchaseReturnInvoice({required double id}) async {
    try {
      final incvoiceBuyEntity =
          await readPurchaseReturnInvoiceUseCase.execute(id: id);
      emit(PurchaseReturnInvoiceState.success([incvoiceBuyEntity]));
    } catch (e) {
      emit(PurchaseReturnInvoiceState.error(e.toString()));
    }
  }

  void updatePurchaseReturnInvoice(
      {required InvoiceBuyReturnEntity invoiceBuyReturnEntity}) async {
    try {
      await updatePurchaseReturnInvoiceUseCase.execute(invoiceBuyReturnEntity,
          id: invoiceBuyReturnEntity.invoiceNo);
      // emit(const PurchaseReturnInvoiceState.success(true));
    } catch (e) {
      emit(PurchaseReturnInvoiceState.error(e.toString()));
    }
  }

  void deletePurchaseReturnInvoice({required num id}) async {
    try {
      await deletePurchaseReturnInvoiceUseCase.execute(id: id);
      // emit(const PurchaseReturnInvoiceState.success(true));
    } catch (e) {
      emit(PurchaseReturnInvoiceState.error(e.toString()));
    }
  }

  Future<String> getLastIndex() async {
    String dataCount = await getLastIndexPurchaseReturnInvoiceUseCase.execute(
        'InvoiceBuyReturn', 'invoiceNo');
    return dataCount;
  }

  Future<List> getBranches() async {
    List branches = await getBranchesPurchaseReturnInvoiceUseCase.execute();
    return branches;
  }

  Future<InvoiceBuyEntity> getInvoiceData(
      String invoiceNo, String buildingNo, String table) async {
    InvoiceBuyEntity invoiceData =
        await getInvoiceDataPurchaseReturnInvoiceUseCase.execute(
            invoiceNo, buildingNo, table);
    return invoiceData;
  }
}
