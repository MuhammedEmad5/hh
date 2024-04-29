
import '../../data/mapper/item_classification_tree_mapper.dart';
import '../../data/model/item_classification_tree_model.dart';
import '../../data/repositories/product_classification_impl.dart';
import '../entities/product_classification/product_classification_entity.dart';

class ReadProductClassificationUseCase {
  final ProductClassificationRepo productClassificationRepo;
  ReadProductClassificationUseCase({required this.productClassificationRepo});
  Future<ProductClassification> execute({required double id}) async {
    final itemsClassificationJsonArr = await productClassificationRepo.getOne<ItemClassificationTree>(id: id);
    final itemClassificationData = itemsClassificationJsonArr.first;
    final itemClassificationObject = ItemClassificationTree.fromJson(itemClassificationData);
    final ProductClassification productClassificationObject = ItemClassificationTreeMapper().convert(itemClassificationObject);
    return productClassificationObject;
  }
}
