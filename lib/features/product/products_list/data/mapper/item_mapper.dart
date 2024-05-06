import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import '../../domain/entities/item_entity_model.dart';
import '../models/item_model.dart';
import 'item_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<ItemEntity, Item>(fields: [
    Field('aName', from: 'aName'),
    Field('eName', from: 'eName'),
    Field('itemNo', from: 'itemNo'),
    Field('barCode', from: 'barCode'),
    Field('userNumber', from: 'userNumber'),
  ]),
  MapType<Item, ItemEntity>(fields: [
    Field('aName', from: 'aName'),
    Field('eName', from: 'eName'),
    Field('itemNo', from: 'itemNo'),
    Field('barCode', from: 'barCode'),
    Field('userNumber', from: 'userNumber'),

  ])
])
class ItemMapper extends $ItemMapper {

}
