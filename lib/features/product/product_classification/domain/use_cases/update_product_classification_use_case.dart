
import '../../data/mapper/item_classification_tree_mapper.dart';
import '../../data/model/item_classification_tree_model.dart';
import '../../data/repositories/product_classification_impl.dart';
import '../entities/product_classification/product_classification_entity.dart';

class UpdateProductClassificationUseCase {
  final ProductClassificationRepo productClassificationRepo;

  UpdateProductClassificationUseCase({required this.productClassificationRepo});

  Future<void> execute(ProductClassification productClassification,{required id}) async {
    final ItemClassificationTree item = ItemClassificationTreeMapper().convert(productClassification);
    await productClassificationRepo.update<ItemClassificationTree>(item, id: id);
  }
}