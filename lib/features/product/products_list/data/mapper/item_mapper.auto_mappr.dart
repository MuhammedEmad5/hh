// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/item_entity_model.dart' as _i2;
import '../models/item_model.dart' as _i3;

/// {@template package:InvoiceF_ClientVendor/features/product/products_list/data/mapper/item_mapper.dart}
/// Available mappings:
/// - `ItemEntity` → `Item`.
/// - `Item` → `ItemEntity`.
/// {@endtemplate}
class $ItemMapper implements _i1.AutoMapprInterface {
  const $ItemMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:InvoiceF_ClientVendor/features/product/products_list/data/mapper/item_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.ItemEntity>() ||
            sourceTypeOf == _typeOf<_i2.ItemEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.Item>() ||
            targetTypeOf == _typeOf<_i3.Item?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Item>() ||
            sourceTypeOf == _typeOf<_i3.Item?>()) &&
        (targetTypeOf == _typeOf<_i2.ItemEntity>() ||
            targetTypeOf == _typeOf<_i2.ItemEntity?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:InvoiceF_ClientVendor/features/product/products_list/data/mapper/item_mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:InvoiceF_ClientVendor/features/product/products_list/data/mapper/item_mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:InvoiceF_ClientVendor/features/product/products_list/data/mapper/item_mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:InvoiceF_ClientVendor/features/product/products_list/data/mapper/item_mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
      Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>((item) => _convert(item, canReturnNull: true));
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:InvoiceF_ClientVendor/features/product/products_list/data/mapper/item_mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:InvoiceF_ClientVendor/features/product/products_list/data/mapper/item_mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:InvoiceF_ClientVendor/features/product/products_list/data/mapper/item_mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:InvoiceF_ClientVendor/features/product/products_list/data/mapper/item_mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.ItemEntity>() ||
            sourceTypeOf == _typeOf<_i2.ItemEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.Item>() ||
            targetTypeOf == _typeOf<_i3.Item?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$ItemEntity_To__i3$Item((model as _i2.ItemEntity?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Item>() ||
            sourceTypeOf == _typeOf<_i3.Item?>()) &&
        (targetTypeOf == _typeOf<_i2.ItemEntity>() ||
            targetTypeOf == _typeOf<_i2.ItemEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Item_To__i2$ItemEntity((model as _i3.Item?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.Item _map__i2$ItemEntity_To__i3$Item(_i2.ItemEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ItemEntity → Item failed because ItemEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ItemEntity, Item> to handle null values during mapping.');
    }
    return _i3.Item(
      itemNo: model.itemNo,
      aName: model.aName,
      eName: model.eName,
      barCode: model.barCode,
      unitNo_defaultSell: model.unitNo_defaultSell,
      itemClassificationTreeNo: model.itemClassificationTreeNo,
      taxPurchasePercent: model.taxPurchasePercent,
      tax_isUseSeparateFieldsForTax: model.tax_isUseSeparateFieldsForTax,
      buyPrice: model.buyPrice,
      taxPurchaseAmount: model.taxPurchaseAmount,
      taxPercent: model.taxPercent,
      sellPrice2: model.sellPrice2,
      sellPrice3: model.sellPrice3,
      sellPrice4: model.sellPrice4,
      discount: model.discount,
      discount_Percentage: model.discount_Percentage,
      userNumber: model.userNumber,
      sellPrice: model.sellPrice,
    );
  }

  _i2.ItemEntity _map__i3$Item_To__i2$ItemEntity(_i3.Item? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Item → ItemEntity failed because Item was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Item, ItemEntity> to handle null values during mapping.');
    }
    return _i2.ItemEntity(
      itemNo: model.itemNo,
      aName: model.aName,
      eName: model.eName,
      barCode: model.barCode,
      userNumber: model.userNumber,
      unitNo_defaultSell: model.unitNo_defaultSell,
      itemClassificationTreeNo: model.itemClassificationTreeNo,
      taxPurchasePercent: model.taxPurchasePercent,
      tax_isUseSeparateFieldsForTax: model.tax_isUseSeparateFieldsForTax,
      buyPrice: model.buyPrice,
      taxPurchaseAmount: model.taxPurchaseAmount,
      taxPercent: model.taxPercent,
      sellPrice: model.sellPrice,
      sellPrice2: model.sellPrice2,
      sellPrice3: model.sellPrice3,
      sellPrice4: model.sellPrice4,
      discount: model.discount,
      discount_Percentage: model.discount_Percentage,
    );
  }
}
