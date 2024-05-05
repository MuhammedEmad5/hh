import 'package:InvoiceF/features/shared/shared_entities/client_vendor_entity/client_vendor_entity_model.dart';
import 'package:InvoiceF/features/shared/shared_entities/invoice_sell/invoice_sell_model.dart';
import 'package:InvoiceF/features/shared/shared_entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/use_cases/get_brances_use_case.dart';
import '../../domain/use_cases/get_client_vendor_data_use_case.dart';
import '../../domain/use_cases/get_company_data_use_case.dart';
import '../../domain/use_cases/get_invoice_data.dart';
import '../../domain/use_cases/get_items_use_case.dart';

part 'invoice_a4_state.dart';
part 'invoice_a4_cubit.freezed.dart';

class InvoiceA4Cubit extends Cubit<InvoiceA4State> {
  final GetBranchesInvoiceA4UseCase getBranchesInvoiceA4UseCase;
  final GetCompanyDataInvoiceA4UseCase getCompanyDataInvoiceA4UseCase;
  final GetClientVendorDataInvoiceA4UseCase getClientVendorDataInvoiceA4UseCase;
  final GetInvoiceDataInvoiceA4UseCase getInvoiceDataInvoiceA4UseCase;
  final GetInvoiceItemsInvoiceA4UseCase getInvoiceItemsInvoiceA4UseCase;
  InvoiceA4Cubit(
    this.getBranchesInvoiceA4UseCase,
    this.getCompanyDataInvoiceA4UseCase,
    this.getClientVendorDataInvoiceA4UseCase,
    this.getInvoiceDataInvoiceA4UseCase,
    this.getInvoiceItemsInvoiceA4UseCase,
  ) : super(const InvoiceA4State.loading());

  Future<List> getBranches() async {
    var res = await getBranchesInvoiceA4UseCase.execute();
    return res;
  }

  Future getData(String invoiceNo, String buildingNo, String table,
      String unitTable) async {
    ClientVendorEntity companyData =
        await getCompanyDataInvoiceA4UseCase.execute();
    InvoiceSell invoiceData = await getInvoiceDataInvoiceA4UseCase.execute(
        invoiceNo, buildingNo, table);
    ClientVendorEntity clientVendorData =
        await getClientVendorDataInvoiceA4UseCase
            .execute('${invoiceData.clientVendorNo}');
    List<InvoiceSellUnitEntity> items = await getInvoiceItemsInvoiceA4UseCase
        .execute(invoiceNo, buildingNo, unitTable);
    var data = {
      'company': companyData,
      'clientVendor': clientVendorData,
      'invoice': invoiceData,
      'items': items,
    };
    emit(InvoiceA4State.a4DataFetched(data));
  }

  Future<ClientVendorEntity> getCompanyData() async {
    var res = await getCompanyDataInvoiceA4UseCase.execute();
    return res;
  }

  Future<ClientVendorEntity> getClientVendorData(String clientVendorNo) async {
    var res = await getClientVendorDataInvoiceA4UseCase.execute(clientVendorNo);
    return res;
  }

  Future<List<InvoiceSellUnitEntity>> getInvoiceItems(
      String invoiceNo, String buildingNo, String table) async {
    var res = await getInvoiceItemsInvoiceA4UseCase.execute(
        invoiceNo, buildingNo, table);
    return res;
  }

  Future<InvoiceSell> getInvoiceData(
      String invoiceNo, String buildingNo, String table) async {
    var res = await getInvoiceDataInvoiceA4UseCase.execute(
        invoiceNo, buildingNo, table);
    return res;
  }
}
