class PurchaseReturnInvoiceQueries {
  static String getBranches() {
    return 'SELECT aName, eName, buildingNo FROM building';
  }

  static String getLastIndex(String tName, String key) {
    return 'SELECT MAX($key) AS maxNo FROM $tName';
  }

  static String getDataCount() {
    return 'SELECT Count(invoiceNo) FROM InvoiceBuyReturn';
  }

  static String getInvoiceData(
      String invoiceNo, String buildingNo, String table) {
    return 'SELECT * FROM InvoiceBuyReturn WHERE invoiceNo = $invoiceNo AND buildingNo = $buildingNo';
  }
}
