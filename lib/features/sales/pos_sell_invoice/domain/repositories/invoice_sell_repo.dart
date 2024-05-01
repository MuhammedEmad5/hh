abstract class IInvoiceSellRepo {
  Future<dynamic> getClientsVendors();
  Future<dynamic> getBranches();
  Future<dynamic> getItems(String invoiceNo);
  Future<dynamic> searchItem(String barCode, String invoiceNo);
  Future<dynamic> getLastIndex(String tName, String key);
  Future<dynamic> getDataCount();
}
