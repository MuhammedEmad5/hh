// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/them_entity.dart' as _i2;
import '../models/met_theme.dart' as _i3;

/// {@template package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart}
/// Available mappings:
/// - `ThemeEntity` → `Met_Theme`.
/// - `Met_Theme` → `ThemeEntity`.
/// {@endtemplate}
class $UserOptionsMapper implements _i1.AutoMapprInterface {
  const $UserOptionsMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.ThemeEntity>() ||
            sourceTypeOf == _typeOf<_i2.ThemeEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.Met_Theme>() ||
            targetTypeOf == _typeOf<_i3.Met_Theme?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Met_Theme>() ||
            sourceTypeOf == _typeOf<_i3.Met_Theme?>()) &&
        (targetTypeOf == _typeOf<_i2.ThemeEntity>() ||
            targetTypeOf == _typeOf<_i2.ThemeEntity?>())) {
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
  /// {@macro package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.ThemeEntity>() ||
            sourceTypeOf == _typeOf<_i2.ThemeEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.Met_Theme>() ||
            targetTypeOf == _typeOf<_i3.Met_Theme?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$ThemeEntity_To__i3$Met_Theme((model as _i2.ThemeEntity?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Met_Theme>() ||
            sourceTypeOf == _typeOf<_i3.Met_Theme?>()) &&
        (targetTypeOf == _typeOf<_i2.ThemeEntity>() ||
            targetTypeOf == _typeOf<_i2.ThemeEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Met_Theme_To__i2$ThemeEntity((model as _i3.Met_Theme?))
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.Met_Theme _map__i2$ThemeEntity_To__i3$Met_Theme(_i2.ThemeEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ThemeEntity → Met_Theme failed because ThemeEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ThemeEntity, Met_Theme> to handle null values during mapping.');
    }
    return _i3.Met_Theme(
      themeNo: model.themeNumber,
      codeName: model.codeName,
    );
  }

  _i2.ThemeEntity _map__i3$Met_Theme_To__i2$ThemeEntity(_i3.Met_Theme? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Met_Theme → ThemeEntity failed because Met_Theme was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Met_Theme, ThemeEntity> to handle null values during mapping.');
    }
    return _i2.ThemeEntity(
      themeNumber: model.themeNo,
      codeName: model.codeName,
    );
  }
}
