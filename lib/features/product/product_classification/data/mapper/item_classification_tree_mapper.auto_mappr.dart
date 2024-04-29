// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/product_classification/product_classification_entity.dart'
    as _i2;
import '../model/item_classification_tree_model.dart' as _i3;
import 'item_classification_tree_mapper.dart' as _i4;

/// {@template package:appy_einvoice_flutter/features/product/product_classification/data/mapper/item_classification_tree_mapper.dart}
/// Available mappings:
/// - `ProductClassification` → `ItemClassificationTree`.
/// - `ItemClassificationTree` → `ProductClassification`.
/// {@endtemplate}
class $ItemClassificationTreeMapper implements _i1.AutoMapprInterface {
  const $ItemClassificationTreeMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:appy_einvoice_flutter/features/product/product_classification/data/mapper/item_classification_tree_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.ProductClassification>() ||
            sourceTypeOf == _typeOf<_i2.ProductClassification?>()) &&
        (targetTypeOf == _typeOf<_i3.ItemClassificationTree>() ||
            targetTypeOf == _typeOf<_i3.ItemClassificationTree?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.ItemClassificationTree>() ||
            sourceTypeOf == _typeOf<_i3.ItemClassificationTree?>()) &&
        (targetTypeOf == _typeOf<_i2.ProductClassification>() ||
            targetTypeOf == _typeOf<_i2.ProductClassification?>())) {
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
  /// {@macro package:appy_einvoice_flutter/features/product/product_classification/data/mapper/item_classification_tree_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/product/product_classification/data/mapper/item_classification_tree_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/product/product_classification/data/mapper/item_classification_tree_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/product/product_classification/data/mapper/item_classification_tree_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/product/product_classification/data/mapper/item_classification_tree_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/product/product_classification/data/mapper/item_classification_tree_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/product/product_classification/data/mapper/item_classification_tree_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/product/product_classification/data/mapper/item_classification_tree_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.ProductClassification>() ||
            sourceTypeOf == _typeOf<_i2.ProductClassification?>()) &&
        (targetTypeOf == _typeOf<_i3.ItemClassificationTree>() ||
            targetTypeOf == _typeOf<_i3.ItemClassificationTree?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$ProductClassification_To__i3$ItemClassificationTree(
          (model as _i2.ProductClassification?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.ItemClassificationTree>() ||
            sourceTypeOf == _typeOf<_i3.ItemClassificationTree?>()) &&
        (targetTypeOf == _typeOf<_i2.ProductClassification>() ||
            targetTypeOf == _typeOf<_i2.ProductClassification?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$ItemClassificationTree_To__i2$ProductClassification(
          (model as _i3.ItemClassificationTree?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.ItemClassificationTree
      _map__i2$ProductClassification_To__i3$ItemClassificationTree(
          _i2.ProductClassification? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ProductClassification → ItemClassificationTree failed because ProductClassification was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ProductClassification, ItemClassificationTree> to handle null values during mapping.');
    }
    return _i3.ItemClassificationTree(
      itemClassificationTreeNo: model.productClassification,
      parentNo: model.parent,
      aName: _i4.ItemClassificationTreeMapper.handleArabicName(model),
      eName: _i4.ItemClassificationTreeMapper.handleEnglishName(model),
    );
  }

  _i2.ProductClassification
      _map__i3$ItemClassificationTree_To__i2$ProductClassification(
          _i3.ItemClassificationTree? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ItemClassificationTree → ProductClassification failed because ItemClassificationTree was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ItemClassificationTree, ProductClassification> to handle null values during mapping.');
    }
    return _i2.ProductClassification(
      productClassification: model.itemClassificationTreeNo,
      parent: model.parentNo,
      arabicName: _i4.ItemClassificationTreeMapper.handleArabicName(model),
      englishName: _i4.ItemClassificationTreeMapper.handleEnglishName(model),
    );
  }
}
