// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/invoice_buy_entity/invoice_buy_entity_model.dart'
    as _i3;
import '../models/invoice_buy_model.dart' as _i2;
import 'invoice_buy_mapper.dart' as _i4;

/// {@template package:appy_einvoice_flutter/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart}
/// Available mappings:
/// - `InvoiceBuy` → `InvoiceBuyEntity`.
/// - `InvoiceBuyEntity` → `InvoiceBuy`.
/// {@endtemplate}
class $InvoiceBuyMapper implements _i1.AutoMapprInterface {
  const $InvoiceBuyMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:appy_einvoice_flutter/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.InvoiceBuy>() ||
            sourceTypeOf == _typeOf<_i2.InvoiceBuy?>()) &&
        (targetTypeOf == _typeOf<_i3.InvoiceBuyEntity>() ||
            targetTypeOf == _typeOf<_i3.InvoiceBuyEntity?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.InvoiceBuyEntity>() ||
            sourceTypeOf == _typeOf<_i3.InvoiceBuyEntity?>()) &&
        (targetTypeOf == _typeOf<_i2.InvoiceBuy>() ||
            targetTypeOf == _typeOf<_i2.InvoiceBuy?>())) {
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
  /// {@macro package:appy_einvoice_flutter/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart}
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
  /// {@macro package:appy_einvoice_flutter/features/purchase/purchase_invoice/data/mapper/invoice_buy_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.InvoiceBuy>() ||
            sourceTypeOf == _typeOf<_i2.InvoiceBuy?>()) &&
        (targetTypeOf == _typeOf<_i3.InvoiceBuyEntity>() ||
            targetTypeOf == _typeOf<_i3.InvoiceBuyEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$InvoiceBuy_To__i3$InvoiceBuyEntity(
          (model as _i2.InvoiceBuy?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.InvoiceBuyEntity>() ||
            sourceTypeOf == _typeOf<_i3.InvoiceBuyEntity?>()) &&
        (targetTypeOf == _typeOf<_i2.InvoiceBuy>() ||
            targetTypeOf == _typeOf<_i2.InvoiceBuy?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$InvoiceBuyEntity_To__i2$InvoiceBuy(
          (model as _i3.InvoiceBuyEntity?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.InvoiceBuyEntity _map__i2$InvoiceBuy_To__i3$InvoiceBuyEntity(
      _i2.InvoiceBuy? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping InvoiceBuy → InvoiceBuyEntity failed because InvoiceBuy was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<InvoiceBuy, InvoiceBuyEntity> to handle null values during mapping.');
    }
    return _i3.InvoiceBuyEntity(
      clientVendorNo: model.clientVendorNo,
      invoiceNo: model.invoiceNo,
      userNumber: model.userNumber,
      aName: model.aName,
      eName: model.eName,
      subNetTotal: model.subNetTotal,
      subNetTotalPlusTax: model.subNetTotalPlusTax,
      subTotalDiscount: model.subTotalDiscount,
      dateG: model.dateG,
      invoiceVATID: model.invoiceVATID,
      telephone: model.telephone,
      buildingNo: model.buildingNo,
      amountLeft: model.amountLeft,
      amountPayed: model.amountPayed,
      paperBillNum: model.paperBillNum,
      VATTypeNO: model.VATTypeNo,
      isPosted: model.isPosted,
      note: model.note,
      taxRate1_Total: model.taxRate1_Total,
      amountCalculatedPayed: model.amountCalculatedPayed,
    );
  }

  _i2.InvoiceBuy _map__i3$InvoiceBuyEntity_To__i2$InvoiceBuy(
      _i3.InvoiceBuyEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping InvoiceBuyEntity → InvoiceBuy failed because InvoiceBuyEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<InvoiceBuyEntity, InvoiceBuy> to handle null values during mapping.');
    }
    return _i2.InvoiceBuy(
      buildingNo: model.buildingNo,
      invoiceNo: model.invoiceNo,
      userNumber: model.userNumber,
      aName: model.aName,
      eName: model.eName,
      dateG: model.dateG,
      isPosted: model.isPosted,
      note: model.note,
      telephone: model.telephone,
      subTotalDiscount: model.subTotalDiscount,
      subNetTotal: model.subNetTotal,
      subNetTotalPlusTax: model.subNetTotalPlusTax,
      amountLeft: model.amountLeft,
      amountCalculatedPayed: model.amountCalculatedPayed,
      taxRate1_Total: model.taxRate1_Total,
      invoiceVATID: model.invoiceVATID,
      clientVendorNo: model.clientVendorNo,
      paperBillNum: model.paperBillNum,
      amountPayed: model.amountPayed,
      gaztInvoiceNumber: _i4.InvoiceBuyMapper.handlegaztInvoiceNumber(model),
    );
  }
}
