import '../../data/repositories/product_repo_impl.dart';

class GetDataCountProductUseCase {
  final ProductRepo productRepo;

  GetDataCountProductUseCase({required this.productRepo});
  Future<int> execute() async {
    final res = await productRepo.getDataCount();
    int dataCount = 0;
    try {
      dataCount = res[0].values.first;
    } catch (e) {
      print(e);
    }
    return dataCount;
  }
}
