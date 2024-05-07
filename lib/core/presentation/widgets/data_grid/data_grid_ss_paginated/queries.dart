class DataGridQueries {
  static String localQuery(
      String tableName, String orderBy, int rowsPerPage, int newPageIndex) {
    return 'SELECT * FROM $tableName ORDER BY $orderBy LIMIT $rowsPerPage OFFSET ${rowsPerPage * newPageIndex}';
  }

  static String remoteQuery(
      String tableName, String orderBy, int rowsPerPage, int newPageIndex) {
    return 'SELECT * FROM $tableName ORDER BY $orderBy OFFSET ${rowsPerPage * newPageIndex} ROWS FETCH NEXT $rowsPerPage ROWS ONLY;';
  }
}
