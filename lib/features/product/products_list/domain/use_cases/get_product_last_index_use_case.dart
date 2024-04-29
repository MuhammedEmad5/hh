
import '../../data/repositories/product_repo_impl.dart';

class GetLastIndexProductUseCase {
  final ProductRepo productRepo;

  GetLastIndexProductUseCase({required this.productRepo});
  Future<String> execute(String tName, String key) async {
    final index = await productRepo.getLastIndex(tName, key);
    String itemNo;
    try {
      itemNo = (index[0].values.first + 1).round().toString();
    } catch (e) {
      print(e);
      itemNo = '1';
    }
    return itemNo;
  }
}
