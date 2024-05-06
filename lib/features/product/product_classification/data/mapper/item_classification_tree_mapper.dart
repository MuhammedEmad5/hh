import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import '../../domain/entities/product_classification/product_classification_entity.dart';
import '../model/item_classification_tree_model.dart';
import 'item_classification_tree_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<ProductClassification, ItemClassificationTree>(fields: [
    Field('itemClassificationTreeNo', from: 'productClassification'),
    Field('parentNo', from: 'parent'),
    Field('aName', custom: ItemClassificationTreeMapper.handleArabicName),
    Field('eName', custom: ItemClassificationTreeMapper.handleEnglishName),
  ]),
  MapType<ItemClassificationTree, ProductClassification>(fields: [
    Field('productClassification', from: 'itemClassificationTreeNo'),
    Field('parent', from: 'parentNo'),
    Field('arabicName', custom: ItemClassificationTreeMapper.handleArabicName),
    Field('englishName',
        custom: ItemClassificationTreeMapper.handleEnglishName),
  ])
])
class ItemClassificationTreeMapper extends $ItemClassificationTreeMapper {
  static int mapId(ItemClassificationTree item) =>
      item.itemClassificationTreeNo.toInt();

  static String? handleEnglishName(dynamic item) {
    final eName = item is ProductClassification ? item.englishName : item.eName;
    if (eName == null) {
      return "";
    }
    if (eName.isEmpty) {
      return null;
    }
    return eName;
  }

  static String? handleArabicName(dynamic item) {
    final eName = item is ProductClassification ? item.arabicName : item.aName;
    if (eName == null) {
      return "";
    }
    if (eName.isEmpty) {
      return null;
    }
    return eName;
  }

  static num handleParent(ItemClassificationTree item) {
    if (item.parentNo == null) {
      return 0;
    }
    return item.parentNo ?? 0;
  }
}
