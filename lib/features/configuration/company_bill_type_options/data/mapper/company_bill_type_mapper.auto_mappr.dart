// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/company_bill_type_entity/company_bill_type_entity_model.dart'
    as _i2;
import '../models/company_bill_type_model.dart' as _i3;

/// {@template package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.dart}
/// Available mappings:
/// - `CompanyBillTypeEntity` → `CompanyBillType`.
/// - `CompanyBillType` → `CompanyBillTypeEntity`.
/// {@endtemplate}
class $CompanyBillTypeMapper implements _i1.AutoMapprInterface {
  const $CompanyBillTypeMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.CompanyBillTypeEntity>() ||
            sourceTypeOf == _typeOf<_i2.CompanyBillTypeEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.CompanyBillType>() ||
            targetTypeOf == _typeOf<_i3.CompanyBillType?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.CompanyBillType>() ||
            sourceTypeOf == _typeOf<_i3.CompanyBillType?>()) &&
        (targetTypeOf == _typeOf<_i2.CompanyBillTypeEntity>() ||
            targetTypeOf == _typeOf<_i2.CompanyBillTypeEntity?>())) {
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.dart}
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
  /// {@macro package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.CompanyBillTypeEntity>() ||
            sourceTypeOf == _typeOf<_i2.CompanyBillTypeEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.CompanyBillType>() ||
            targetTypeOf == _typeOf<_i3.CompanyBillType?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$CompanyBillTypeEntity_To__i3$CompanyBillType(
          (model as _i2.CompanyBillTypeEntity?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.CompanyBillType>() ||
            sourceTypeOf == _typeOf<_i3.CompanyBillType?>()) &&
        (targetTypeOf == _typeOf<_i2.CompanyBillTypeEntity>() ||
            targetTypeOf == _typeOf<_i2.CompanyBillTypeEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$CompanyBillType_To__i2$CompanyBillTypeEntity(
          (model as _i3.CompanyBillType?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.CompanyBillType _map__i2$CompanyBillTypeEntity_To__i3$CompanyBillType(
      _i2.CompanyBillTypeEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CompanyBillTypeEntity → CompanyBillType failed because CompanyBillTypeEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CompanyBillTypeEntity, CompanyBillType> to handle null values during mapping.');
    }
    return _i3.CompanyBillType(
      billTypeNo: model.billTypeNo,
      VATTypeNo: model.VATTypeNo,
      VATGroupNo: model.VATGroupNo,
      reportUnderHeader: model.reportUnderHeader,
      reportUnderHeader_En: model.reportUnderHeader_En,
      reportUnderDataStatement: model.reportUnderDataStatement,
      report_OnPostTypeNo: model.report_OnPostTypeNo,
    );
  }

  _i2.CompanyBillTypeEntity
      _map__i3$CompanyBillType_To__i2$CompanyBillTypeEntity(
          _i3.CompanyBillType? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CompanyBillType → CompanyBillTypeEntity failed because CompanyBillType was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CompanyBillType, CompanyBillTypeEntity> to handle null values during mapping.');
    }
    return _i2.CompanyBillTypeEntity(
      billTypeNo: model.billTypeNo,
      report_OnPostTypeNo: model.report_OnPostTypeNo,
      VATTypeNo: model.VATTypeNo,
      VATGroupNo: model.VATGroupNo,
      reportUnderHeader: model.reportUnderHeader,
      reportUnderHeader_En: model.reportUnderHeader_En,
      reportUnderDataStatement: model.reportUnderDataStatement,
    );
  }
}
