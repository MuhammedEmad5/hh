class SellInvoiceQueries {
  static String getItems(String invoiceNo) {
    return 'SELECT * FROM invoicesellunit WHERE invoiceNo = $invoiceNo';
  }

  static String searchItems(String barcode) {
    return 'SELECT * FROM item WHERE barCode = \'$barcode\'';
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
    return 'SELECT Count(invoiceNo) FROM InvoiceSell';
  }

  static String removeItem(
      String invoiceNo, String buildingNo, String orderNo) {
    return 'DELETE FROM InvoiceSellUnit WHERE invoiceNo = $invoiceNo AND buildingNo = $buildingNo AND orderNo = $orderNo';
  }

  static String updateItemQuantity(
      String invoiceNo, String buildingNo, String orderNo, String quantity) {
    return 'UPDATE InvoiceSellUnit SET quantity = $quantity WHERE invoiceNo = $invoiceNo AND buildingNo = $buildingNo AND orderNo = $orderNo';
  }
}
