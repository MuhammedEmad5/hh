
import '../../data/mapper/item_classification_tree_mapper.dart';
import '../../data/model/item_classification_tree_model.dart';
import '../../data/repositories/product_classification_impl.dart';
import '../entities/product_classification/product_classification_entity.dart';

class ReadAllProductsClassificationUseCase {
  final ProductClassificationRepo productClassificationRepo;

  ReadAllProductsClassificationUseCase({required this.productClassificationRepo});

  Future<List<ProductClassification>> execute() async {

    final List<dynamic> buildingJsonArr =
    await productClassificationRepo.getAll<ItemClassificationTree>();
    final itemsObjects =
    buildingJsonArr.map((item) => ItemClassificationTree.fromJson(item)).toList();
    List<ProductClassification> products = [];
    for (ItemClassificationTree item in itemsObjects) {
      products.add(ItemClassificationTreeMapper().convert(item));
    }
    return products;
  }
}
