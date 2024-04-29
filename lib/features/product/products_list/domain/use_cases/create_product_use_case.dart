import '../../data/mapper/item_mapper.dart';
import '../../data/models/item_model.dart';
import '../../data/repositories/product_repo_impl.dart';
import '../entities/item_entity_model.dart';

class CreateProductUseCase {
  final ProductRepo productRepo;

  CreateProductUseCase({required this.productRepo});

  Future<void> execute(ItemEntity itemEntity) async {
    final Item item = ItemMapper().convert(itemEntity);
    await productRepo.insert(item);
  }
}
