abstract class IInvoiceA4Repo {
  Future<dynamic> getBranches();
  Future<dynamic> getCompanyData();
  Future<dynamic> getClientVendorData(String clientVendorNo);
  Future<dynamic> getInvoiceData(
      String invoiceNo, String buildingNo, String table);
  Future<dynamic> getInvoiceItems(
      String invoiceNo, String buildingNo, String table);
}
