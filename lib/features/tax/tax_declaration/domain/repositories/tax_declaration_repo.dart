abstract class ITaxDeclarationRepo {
  Future<dynamic> getBranches();
  Future<dynamic> getDataFiltered(
      String dateTo, String dateFrom, String buildingNo);
}
