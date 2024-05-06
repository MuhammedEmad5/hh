// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/client_vendor_entity/client_vendor_entity_model.dart'
    as _i3;
import '../models/client_vendor_model.dart' as _i2;
import 'client_vendor_mapper.dart' as _i4;

/// {@template package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/mapper/client_vendor_mapper.dart}
/// Available mappings:
/// - `ClientVendor` → `ClientVendorEntity`.
/// - `ClientVendorEntity` → `ClientVendor`.
/// {@endtemplate}
class $ClientVendorMapper implements _i1.AutoMapprInterface {
  const $ClientVendorMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/mapper/client_vendor_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.ClientVendor>() ||
            sourceTypeOf == _typeOf<_i2.ClientVendor?>()) &&
        (targetTypeOf == _typeOf<_i3.ClientVendorEntity>() ||
            targetTypeOf == _typeOf<_i3.ClientVendorEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.ClientVendorEntity>() ||
            sourceTypeOf == _typeOf<_i3.ClientVendorEntity?>()) &&
        (targetTypeOf == _typeOf<_i2.ClientVendor>() ||
            targetTypeOf == _typeOf<_i2.ClientVendor?>())) {
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/mapper/client_vendor_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/mapper/client_vendor_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/mapper/client_vendor_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/mapper/client_vendor_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/mapper/client_vendor_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/mapper/client_vendor_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/mapper/client_vendor_mapper.dart}
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
  /// {@macro package:InvoiceF_ClientVendor/features/client_vendor/client_vendor_list/data/mapper/client_vendor_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.ClientVendor>() ||
            sourceTypeOf == _typeOf<_i2.ClientVendor?>()) &&
        (targetTypeOf == _typeOf<_i3.ClientVendorEntity>() ||
            targetTypeOf == _typeOf<_i3.ClientVendorEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$ClientVendor_To__i3$ClientVendorEntity(
          (model as _i2.ClientVendor?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.ClientVendorEntity>() ||
            sourceTypeOf == _typeOf<_i3.ClientVendorEntity?>()) &&
        (targetTypeOf == _typeOf<_i2.ClientVendor>() ||
            targetTypeOf == _typeOf<_i2.ClientVendor?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$ClientVendorEntity_To__i2$ClientVendor(
          (model as _i3.ClientVendorEntity?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.ClientVendorEntity _map__i2$ClientVendor_To__i3$ClientVendorEntity(
      _i2.ClientVendor? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ClientVendor → ClientVendorEntity failed because ClientVendor was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ClientVendor, ClientVendorEntity> to handle null values during mapping.');
    }
    return _i3.ClientVendorEntity(
      clientVendorNo: model.clientVendorNo,
      typeOfClientOrVendor: model.typeOfClientOrVendor,
      VendorId: model.VendorId,
      aName: model.aName,
      eName: model.eName,
      aDescription: model.aDescription,
      eDescription: model.eDescription,
      mainContact1: model.mainContact1,
      mainContact2: model.mainContact2,
      mainContact3: model.mainContact3,
      mainContact4: model.mainContact4,
      VATID: model.VATID,
      address: model.address,
      warnMaxBalance: model.warnMaxBalance,
      warnMinBalance: model.warnMinBalance,
      maxBalanceAllowed: model.maxBalanceAllowed,
      minBalanceAllowed: model.minBalanceAllowed,
      note: model.note,
      apartmentNum: model.apartmentNum,
      POBoxAdditionalNum: model.POBoxAdditionalNum,
      POBox: model.POBox,
      street_Eng: model.street_Eng,
      street_Arb: model.street_Arb,
      district_Arb: model.district_Arb,
      district_Eng: model.district_Eng,
      city_Eng: model.city_Eng,
      city_Arb: model.city_Arb,
      country_Arb: model.country_Arb,
      country_Eng: model.country_Eng,
      secondBusinessID: model.secondBusinessID,
      secondBusinessIDType: model.secondBusinessIDType,
    );
  }

  _i2.ClientVendor _map__i3$ClientVendorEntity_To__i2$ClientVendor(
      _i3.ClientVendorEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ClientVendorEntity → ClientVendor failed because ClientVendorEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ClientVendorEntity, ClientVendor> to handle null values during mapping.');
    }
    return _i2.ClientVendor(
      VendorId: model.VendorId,
      clientVendorNo: model.clientVendorNo,
      userNumber: _i4.ClientVendorMapper.userNumber(model),
      aName: model.aName,
      eName: model.eName,
      aDescription: model.aDescription,
      eDescription: model.eDescription,
      typeOfClientOrVendor: model.typeOfClientOrVendor,
      mainContact1: model.mainContact1,
      mainContact2: model.mainContact2,
      mainContact3: model.mainContact3,
      mainContact4: model.mainContact4,
      VATID: model.VATID,
      note: model.note,
      maxBalanceAllowed: model.maxBalanceAllowed,
      minBalanceAllowed: model.minBalanceAllowed,
      warnMinBalance: model.warnMinBalance,
      warnMaxBalance: model.warnMaxBalance,
      address: model.address,
      apartmentNum: model.apartmentNum,
      street_Arb: model.street_Arb,
      street_Eng: model.street_Eng,
      district_Arb: model.district_Arb,
      district_Eng: model.district_Eng,
      city_Arb: model.city_Arb,
      city_Eng: model.city_Eng,
      country_Arb: model.country_Arb,
      country_Eng: model.country_Eng,
      POBox: model.POBox,
      POBoxAdditionalNum: model.POBoxAdditionalNum,
      secondBusinessIDType: model.secondBusinessIDType,
      secondBusinessID: model.secondBusinessID,
    );
  }
}
