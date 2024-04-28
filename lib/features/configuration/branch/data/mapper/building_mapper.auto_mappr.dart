// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/branch_entity/branch_model.dart' as _i2;
import '../model/building_model.dart' as _i3;
import 'building_mapper.dart' as _i4;

/// {@template package:InvoiceF_Configuration/features/configuration/branch/data/mapper/building_mapper.dart}
/// Available mappings:
/// - `Branch` → `Building`.
/// - `Building` → `Branch`.
/// {@endtemplate}
class $BuildingMapper implements _i1.AutoMapprInterface {
  const $BuildingMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:InvoiceF_Configuration/features/configuration/branch/data/mapper/building_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.Branch>() ||
            sourceTypeOf == _typeOf<_i2.Branch?>()) &&
        (targetTypeOf == _typeOf<_i3.Building>() ||
            targetTypeOf == _typeOf<_i3.Building?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Building>() ||
            sourceTypeOf == _typeOf<_i3.Building?>()) &&
        (targetTypeOf == _typeOf<_i2.Branch>() ||
            targetTypeOf == _typeOf<_i2.Branch?>())) {
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/branch/data/mapper/building_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/branch/data/mapper/building_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/branch/data/mapper/building_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/branch/data/mapper/building_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/branch/data/mapper/building_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/branch/data/mapper/building_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/branch/data/mapper/building_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/branch/data/mapper/building_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.Branch>() ||
            sourceTypeOf == _typeOf<_i2.Branch?>()) &&
        (targetTypeOf == _typeOf<_i3.Building>() ||
            targetTypeOf == _typeOf<_i3.Building?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$Branch_To__i3$Building((model as _i2.Branch?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Building>() ||
            sourceTypeOf == _typeOf<_i3.Building?>()) &&
        (targetTypeOf == _typeOf<_i2.Branch>() ||
            targetTypeOf == _typeOf<_i2.Branch?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Building_To__i2$Branch((model as _i3.Building?))
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.Building _map__i2$Branch_To__i3$Building(_i2.Branch? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Branch → Building failed because Branch was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Branch, Building> to handle null values during mapping.');
    }
    return _i3.Building(
      buildingNo: model.branchNumber,
      userNumber: model.customerNumber,
      aName: model.arabicName,
      eName: model.englishName,
      aDescription: model.arabicDescription,
      eDescription: model.englishDescription,
      note: model.note,
      address: model.address,
    );
  }

  _i2.Branch _map__i3$Building_To__i2$Branch(_i3.Building? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Building → Branch failed because Building was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Building, Branch> to handle null values during mapping.');
    }
    return _i2.Branch(
      branchNumber: model.buildingNo,
      customerNumber: model.userNumber,
      arabicName: model.aName,
      arabicDescription: _i4.BuildingMapper.handleArabicDescription(model),
      englishName: _i4.BuildingMapper.handleEnglishName(model),
      englishDescription: _i4.BuildingMapper.handleEnglishDescription(model),
      note: _i4.BuildingMapper.handleNote(model),
      address: _i4.BuildingMapper.handleAddress(model),
    );
  }
}
