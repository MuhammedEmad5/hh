import '../../exceptions/sqlLite_Exception.dart';
import '../../utils/logger.dart';

class QueryHelper{
  static String writeFullQuery(
      {required List<dynamic> columnsNamesList,
        required String sqlQuery,
        required num id}) {
    String fullQuery = sqlQuery;
    for (int i = 0; i < columnsNamesList.length && i < 3; i++) {
      final columnName = columnsNamesList[i];
      fullQuery += "$columnName = $id";
      if (i < 2) {
        fullQuery += " OR ";
      }
    }
    return fullQuery;
  }



}