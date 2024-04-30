class PurchaseInvoiceQueries {
  static String getItems(String invoiceNo) {
    return 'SELECT * FROM invoicebuyunit WHERE invoiceNo = $invoiceNo';
  }

  static String searchItems(String barcode) {
    return 'SELECT * FROM item WHERE itemNo = $barcode';
  }

  static String getClientsVendors() {
    return 'SELECT aName, eName, clientVendorNo FROM clientVendor';
  }

  static String getBranches() {
    return 'SELECT aName, eName, buildingNo FROM building';
  }

  static String getLastIndex(String tName, String key) {
    return 'SELECT MAX($key) AS maxNo FROM $tName';
  }

  static String getDataCount() {
    return 'SELECT Count(invoiceNo) FROM InvoiceBuy';
  }
}
