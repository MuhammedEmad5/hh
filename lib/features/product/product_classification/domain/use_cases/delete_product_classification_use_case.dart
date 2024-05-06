

import '../../data/model/item_classification_tree_model.dart';
import '../../data/repositories/product_classification_impl.dart';

class DeleteProductClassificationUseCase {
  final ProductClassificationRepo productClassificationRepo;

  DeleteProductClassificationUseCase({required this.productClassificationRepo});


  Future<void> execute({required double id}) async {
    await productClassificationRepo.delete<ItemClassificationTree>(id: id);
  }


}