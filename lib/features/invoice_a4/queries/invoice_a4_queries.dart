class InvoiceA4Queries {
  static String getBranches() {
    return 'SELECT aName, eName, buildingNo FROM building';
  }

  static String getInvoiceData(
      String invoiceNo, String buildingNo, String table) {
    return 'SELECT * FROM $table WHERE invoiceNo = $invoiceNo AND buildingNo = $buildingNo';
  }

  static String getClientVendorData(String clientVendorNo) {
    return 'SELECT * FROM clientvendor WHERE clientVendorNo = $clientVendorNo';
  }

  static String getInvoiceItems(
      String invoiceNo, String buildingNo, String table) {
    return 'SELECT * FROM $table WHERE invoiceNo = $invoiceNo AND buildingNo = $buildingNo';
  }

  static String getCompanyData() {
    return 'SELECT * FROM company';
  }
}
