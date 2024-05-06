import '../../data/mapper/item_mapper.dart';
import '../../data/models/item_model.dart';
import '../../data/repositories/product_repo_impl.dart';
import '../entities/item_entity_model.dart';

class ReadAllProductsUseCase {
  final ProductRepo productRepo;

  ReadAllProductsUseCase({required this.productRepo});

  Future<List<ItemEntity>> execute() async {
    final List<dynamic> productJsonArr = await productRepo.getAll<Item>();
    final productObjects =
        productJsonArr.map((product) => Item.fromJson(product)).toList();
    List<ItemEntity> products = [];
    for (Item product in productObjects) {
      products.add(ItemMapper().convert(product));
    }

    return products;
  }
}
