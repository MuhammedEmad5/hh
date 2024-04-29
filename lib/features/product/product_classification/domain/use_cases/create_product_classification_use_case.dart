
import '../../data/mapper/item_classification_tree_mapper.dart';
import '../../data/model/item_classification_tree_model.dart';
import '../../data/repositories/product_classification_impl.dart';
import '../entities/product_classification/product_classification_entity.dart';


class CreateProductClassificationUseCase {
  final ProductClassificationRepo productClassificationRepo;

  CreateProductClassificationUseCase({required this.productClassificationRepo});

  Future<void> execute(ProductClassification productClassification) async {
    final ItemClassificationTree item = ItemClassificationTreeMapper().convert(productClassification);
    await productClassificationRepo.insert(item);
  }
}