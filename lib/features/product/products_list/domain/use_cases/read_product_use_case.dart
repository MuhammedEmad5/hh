import '../../../../../core/utils/logger.dart';
import '../../data/mapper/item_mapper.dart';
import '../../data/models/item_model.dart';
import '../../data/repositories/product_repo_impl.dart';
import '../entities/item_entity_model.dart';

class ReadProductUseCase {
  final ProductRepo productRepo;

  ReadProductUseCase({required this.productRepo});

  Future<ItemEntity> execute({required double id}) async {
    final itemJsonArr = await productRepo.getOne<Item>(id: id);
    final itemData = itemJsonArr.first;
    final itemObject = Item.fromJson(itemData);
    final ItemEntity itemEntity = ItemMapper().convert(itemObject);
    LoggerSingleton.logger.i(itemEntity.toJson());

    return itemEntity;
  }
}
