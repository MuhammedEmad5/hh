abstract class IInvoiceSaleReturnRepo {
  Future<dynamic> getBranches();
  Future<dynamic> getLastIndex(String tName, String key);
  Future<dynamic> getInvoiceData(
      String invoiceNo, String buildingNo, String table);
}
