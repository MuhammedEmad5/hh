class ProductQueries {
  static String getLastIndex(String tName, String key) {
    return 'SELECT MAX($key) AS maxNo FROM $tName';
  }

  static String getDataCount() {
    return 'SELECT Count(itemNo) FROM Item';
  }
}
