import '../../data/models/item_model.dart';
import '../../data/repositories/product_repo_impl.dart';

class DeleteProductUseCase {
  final ProductRepo productRepo;

  DeleteProductUseCase({required this.productRepo});

  Future<void> execute({required num id}) async {
    await productRepo.delete<Item>(id: id);
  }
}
