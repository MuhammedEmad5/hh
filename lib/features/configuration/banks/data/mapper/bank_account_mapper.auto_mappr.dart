// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/bank_entity.dart' as _i2;
import '../models/bank_account.dart' as _i3;
import 'bank_account_mapper.dart' as _i4;

/// {@template package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart}
/// Available mappings:
/// - `BankEntity` → `BankAccount`.
/// - `BankAccount` → `BankEntity`.
/// {@endtemplate}
class $BankAccountMapper implements _i1.AutoMapprInterface {
  const $BankAccountMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.BankEntity>() ||
            sourceTypeOf == _typeOf<_i2.BankEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.BankAccount>() ||
            targetTypeOf == _typeOf<_i3.BankAccount?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.BankAccount>() ||
            sourceTypeOf == _typeOf<_i3.BankAccount?>()) &&
        (targetTypeOf == _typeOf<_i2.BankEntity>() ||
            targetTypeOf == _typeOf<_i2.BankEntity?>())) {
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
  /// {@macro package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/banks/data/mapper/bank_account_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.BankEntity>() ||
            sourceTypeOf == _typeOf<_i2.BankEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.BankAccount>() ||
            targetTypeOf == _typeOf<_i3.BankAccount?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$BankEntity_To__i3$BankAccount((model as _i2.BankEntity?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.BankAccount>() ||
            sourceTypeOf == _typeOf<_i3.BankAccount?>()) &&
        (targetTypeOf == _typeOf<_i2.BankEntity>() ||
            targetTypeOf == _typeOf<_i2.BankEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$BankAccount_To__i2$BankEntity(
          (model as _i3.BankAccount?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.BankAccount _map__i2$BankEntity_To__i3$BankAccount(
      _i2.BankEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping BankEntity → BankAccount failed because BankEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<BankEntity, BankAccount> to handle null values during mapping.');
    }
    return _i3.BankAccount(
      bankAccountNo: model.bankAccountNumber,
      userNumber: _i4.BankAccountMapper.userNumber(model),
      aName: model.arabicName,
      eName: _i4.BankAccountMapper.englishName(model),
    );
  }

  _i2.BankEntity _map__i3$BankAccount_To__i2$BankEntity(
      _i3.BankAccount? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping BankAccount → BankEntity failed because BankAccount was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<BankAccount, BankEntity> to handle null values during mapping.');
    }
    return _i2.BankEntity(
      bankAccountNumber: model.bankAccountNo,
      userNumber: model.userNumber,
      arabicName: model.aName,
      englishName: r'eName',
    );
  }
}
