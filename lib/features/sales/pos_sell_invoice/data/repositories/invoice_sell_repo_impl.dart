import '../../../../../core/data/datasources/connection.dart';
import '../../../../../core/data/repos/base_repo_class.dart';
import '../../../../shared/shared_entities/item_entities/item_entity_model.dart';
import '../../domain/entities/invoice_sell_unit/invoice_sell_unit_entity_model.dart';
import '../../domain/repositories/invoice_sell_repo.dart';
import '../../queries/sell_invoice_queries.dart';

class InvoiceSellRepo extends BaseRepoClass implements IInvoiceSellRepo {
  InvoiceSellRepo(IConnection connection) : super(connection) {
    _connection = connection;
  }

  late IConnection _connection;
  @override
  Future<List> getBranches() async {
    var res = await _connection.readQuery(SellInvoiceQueries.getBranches());
    List<String> branchNames = [];
    List<int> buildingNumbers = [];
    try {
      if (res.isNotEmpty) {
        for (var element in res) {
          if (!branchNames
              .contains('${element['aName']} - ${element['eName']}')) {
            branchNames.add('${element['aName']} - ${element['eName']}');
            buildingNumbers.add(element['buildingNo'].round());
          }
        }
      }
    } catch (e) {
      print(e);
    }
    if (buildingNumbers.isEmpty) {
      branchNames = ['None'];
      buildingNumbers = [0];
    }
    return [branchNames, buildingNumbers];
  }

  @override
  Future<List> getClientsVendors() async {
    List<String> clientVendorNamesList = [];
    List<int> clientVendorNumbers = [];
    var res =
        await _connection.readQuery(SellInvoiceQueries.getClientsVendors());
    try {
      if (res.isNotEmpty) {
        for (var element in res) {
          if (!clientVendorNamesList
              .contains('${element['aName']} - ${element['eName']}')) {
            clientVendorNamesList
                .add('${element['aName']} - ${element['eName']}');
            clientVendorNumbers.add(element['clientVendorNo'].round());
          }
        }
      }
    } catch (e) {
      print(e);
    }
    if (clientVendorNumbers.isEmpty) {
      clientVendorNamesList = ['None'];
      clientVendorNumbers = [0];
    }
    return [clientVendorNamesList, clientVendorNumbers];
  }

  @override
  Future<List<InvoiceSellUnitEntity>> getItems(String invoiceNo) async {
    List<InvoiceSellUnitEntity> items = [];
    var res =
        await _connection.readQuery(SellInvoiceQueries.getItems(invoiceNo));
    try {
      for (var element in res) {
        items.add(InvoiceSellUnitEntity.fromJson(element));
      }
    } catch (e) {
      print(e);
    }
    return items;
  }

  @override
  Future<String> getLastIndex(String tName, String key) async {
    String invoiceNo;
    var res = await _connection
        .readQuery(SellInvoiceQueries.getLastIndex(tName, key));
    try {
      invoiceNo = (res[0].values.first + 1).toString();
    } catch (e) {
      print(e);
      invoiceNo = '-1';
    }
    return invoiceNo;
  }

  @override
  Future<InvoiceSellUnitEntity> searchItem(
      String barCode, String invoiceNo) async {
    late InvoiceSellUnitEntity item;
    var res =
        await _connection.readQuery(SellInvoiceQueries.searchItems(barCode));
    try {
      //todo : uncomment after merge model
      var itemData = ItemEntity.fromJson(res[0]);
      item = InvoiceSellUnitEntity(
          invoiceNo: int.parse(invoiceNo),
          orderNo: 1,
          quantity: 1,
          aName: itemData.aName,
          eName: itemData.eName,
          itemNo: itemData.itemNo,
          price: itemData.sellPrice);
    } catch (e) {
      print(e);
    }
    return item;
  }
}
