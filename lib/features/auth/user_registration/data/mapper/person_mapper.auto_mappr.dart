// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/user_entity.dart' as _i2;
import '../model/person_model.dart' as _i3;
import 'person_mapper.dart' as _i4;

/// {@template package:appy_einvoice_flutter/features/configuration/user_registration/data/mapper/person_mapper.dart}
/// Available mappings:
/// - `User` → `Person`.
/// - `Person` → `User`.
/// {@endtemplate}
class $PersonMapper implements _i1.AutoMapprInterface {
  const $PersonMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:appy_einvoice_flutter/features/configuration/user_registration/data/mapper/person_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.User>() ||
            sourceTypeOf == _typeOf<_i2.User?>()) &&
        (targetTypeOf == _typeOf<_i3.Person>() ||
            targetTypeOf == _typeOf<_i3.Person?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Person>() ||
            sourceTypeOf == _typeOf<_i3.Person?>()) &&
        (targetTypeOf == _typeOf<_i2.User>() ||
            targetTypeOf == _typeOf<_i2.User?>())) {
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
  /// {@macro package:appy_einvoice_flutter/features/configuration/user_registration/data/mapper/person_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/configuration/user_registration/data/mapper/person_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/configuration/user_registration/data/mapper/person_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/configuration/user_registration/data/mapper/person_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/configuration/user_registration/data/mapper/person_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/configuration/user_registration/data/mapper/person_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/configuration/user_registration/data/mapper/person_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/configuration/user_registration/data/mapper/person_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.User>() ||
            sourceTypeOf == _typeOf<_i2.User?>()) &&
        (targetTypeOf == _typeOf<_i3.Person>() ||
            targetTypeOf == _typeOf<_i3.Person?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$User_To__i3$Person((model as _i2.User?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Person>() ||
            sourceTypeOf == _typeOf<_i3.Person?>()) &&
        (targetTypeOf == _typeOf<_i2.User>() ||
            targetTypeOf == _typeOf<_i2.User?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Person_To__i2$User((model as _i3.Person?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.Person _map__i2$User_To__i3$Person(_i2.User? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping User → Person failed because User was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<User, Person> to handle null values during mapping.');
    }
    return _i3.Person(
      VendorId: _i4.PersonMapper.vendorId(),
      personNo: model.personNumber,
      userNumber: _i4.PersonMapper.userNumber(model),
      aName: model.arabicName,
      eName: _i4.PersonMapper.englishName(model),
      logger: model.email,
      password1: _i4.PersonMapper.password1User(model),
      password2: _i4.PersonMapper.password2User(model),
      isUser: _i4.PersonMapper.isUserInt(model),
      buildingNo: model.buildingNo,
      mainContact1: _i4.PersonMapper.mainContact1(model),
    );
  }

  _i2.User _map__i3$Person_To__i2$User(_i3.Person? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Person → User failed because Person was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Person, User> to handle null values during mapping.');
    }
    return _i2.User(
      personNumber: model.personNo,
      email: model.logger,
      arabicName: model.aName,
      englishName: model.eName,
      password1: model.password1,
      password2: model.password2,
      mainContact1: model.mainContact1,
      isUser: _i4.PersonMapper.isUserBool(model),
      buildingNo: model.buildingNo,
    );
  }
}
