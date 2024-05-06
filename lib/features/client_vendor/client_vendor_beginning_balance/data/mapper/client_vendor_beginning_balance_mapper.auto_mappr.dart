// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/beginning_balance_entity.dart' as _i2;
import '../models/client_vendor_beginning_balance_model.dart' as _i3;
import 'client_vendor_beginning_balance_mapper.dart' as _i4;

/// {@template package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart}
/// Available mappings:
/// - `BeginningBalanceEntity` → `ClientVendorBeginningBalance`.
/// - `ClientVendorBeginningBalance` → `BeginningBalanceEntity`.
/// {@endtemplate}
class $ClientVendorBeginningBalanceMapper implements _i1.AutoMapprInterface {
  const $ClientVendorBeginningBalanceMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.BeginningBalanceEntity>() ||
            sourceTypeOf == _typeOf<_i2.BeginningBalanceEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.ClientVendorBeginningBalance>() ||
            targetTypeOf == _typeOf<_i3.ClientVendorBeginningBalance?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.ClientVendorBeginningBalance>() ||
            sourceTypeOf == _typeOf<_i3.ClientVendorBeginningBalance?>()) &&
        (targetTypeOf == _typeOf<_i2.BeginningBalanceEntity>() ||
            targetTypeOf == _typeOf<_i2.BeginningBalanceEntity?>())) {
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_beginning_balance/data/mapper/client_vendor_beginning_balance_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.BeginningBalanceEntity>() ||
            sourceTypeOf == _typeOf<_i2.BeginningBalanceEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.ClientVendorBeginningBalance>() ||
            targetTypeOf == _typeOf<_i3.ClientVendorBeginningBalance?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$BeginningBalanceEntity_To__i3$ClientVendorBeginningBalance(
          (model as _i2.BeginningBalanceEntity?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.ClientVendorBeginningBalance>() ||
            sourceTypeOf == _typeOf<_i3.ClientVendorBeginningBalance?>()) &&
        (targetTypeOf == _typeOf<_i2.BeginningBalanceEntity>() ||
            targetTypeOf == _typeOf<_i2.BeginningBalanceEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$ClientVendorBeginningBalance_To__i2$BeginningBalanceEntity(
          (model as _i3.ClientVendorBeginningBalance?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.ClientVendorBeginningBalance
      _map__i2$BeginningBalanceEntity_To__i3$ClientVendorBeginningBalance(
          _i2.BeginningBalanceEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping BeginningBalanceEntity → ClientVendorBeginningBalance failed because BeginningBalanceEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<BeginningBalanceEntity, ClientVendorBeginningBalance> to handle null values during mapping.');
    }
    return _i3.ClientVendorBeginningBalance(
      buildingNo: model.branchNumber,
      transactionNo: model.transactionNumber,
      clientVendorNo: model.clientVendorNumber,
      aName: model.arabicName,
      eName: _i4.ClientVendorBeginningBalanceMapper.englishName(model),
      dateG: model.date,
      debit: model.debit,
      credit: model.credit,
      balance: model.balance,
      note: _i4.ClientVendorBeginningBalanceMapper.note(model),
      invoiceVATID: _i4.ClientVendorBeginningBalanceMapper.invoiceVatId(model),
      paperBillNum:
          _i4.ClientVendorBeginningBalanceMapper.originalPaperBillNumber(model),
    );
  }

  _i2.BeginningBalanceEntity
      _map__i3$ClientVendorBeginningBalance_To__i2$BeginningBalanceEntity(
          _i3.ClientVendorBeginningBalance? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ClientVendorBeginningBalance → BeginningBalanceEntity failed because ClientVendorBeginningBalance was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ClientVendorBeginningBalance, BeginningBalanceEntity> to handle null values during mapping.');
    }
    return _i2.BeginningBalanceEntity(
      branchNumber: model.buildingNo,
      clientVendorNumber: model.clientVendorNo,
      transactionNumber: model.transactionNo,
      arabicName: model.aName,
      englishName: model.eName,
      debit: model.debit,
      credit: model.credit,
      balance: model.balance,
      date: model.dateG,
      originalPaperBillNumber: model.paperBillNum,
      invoiceVatId: model.invoiceVATID,
      note: model.note,
    );
  }
}
