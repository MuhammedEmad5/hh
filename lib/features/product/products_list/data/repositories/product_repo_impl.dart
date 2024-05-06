import '../../../../../../core/data/repos/base_repo_class.dart';
import '../../../../../core/data/datasources/connection.dart';
import '../../domain/repositories/product_repo.dart';
import '../../queries/product_queries.dart';

class ProductRepo extends BaseRepoClass implements IProductRepo {
  ProductRepo(IConnection connection) : super(connection) {
    _connection = connection;
  }

  late IConnection _connection;

  @override
  Future<dynamic> getDataCount() async {
    var res = await _connection.readQuery(ProductQueries.getDataCount());
    return res;
  }

  @override
  Future<dynamic> getLastIndex(String tName, String key) async {
    var res =
        await _connection.readQuery(ProductQueries.getLastIndex(tName, key));
    return res;
  }
}
