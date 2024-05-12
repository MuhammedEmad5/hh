// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/company_general_entity/company_entity.dart'
    as _i2;
import '../models/company_model.dart' as _i3;
import 'company_mapper.dart' as _i4;

/// {@template package:InvoiceF/features/configuration/company/data/mapper/company_mapper.dart}
/// Available mappings:
/// - `CompanyEntity` → `Company`.
/// - `Company` → `CompanyEntity`.
/// {@endtemplate}
class $CompanyMapper implements _i1.AutoMapprInterface {
  const $CompanyMapper();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:InvoiceF/features/configuration/company/data/mapper/company_mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.CompanyEntity>() ||
            sourceTypeOf == _typeOf<_i2.CompanyEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.Company>() ||
            targetTypeOf == _typeOf<_i3.Company?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.Company>() ||
            sourceTypeOf == _typeOf<_i3.Company?>()) &&
        (targetTypeOf == _typeOf<_i2.CompanyEntity>() ||
            targetTypeOf == _typeOf<_i2.CompanyEntity?>())) {
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
  /// {@macro package:InvoiceF/features/configuration/company/data/mapper/company_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/company/data/mapper/company_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/company/data/mapper/company_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/company/data/mapper/company_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/company/data/mapper/company_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/company/data/mapper/company_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/company/data/mapper/company_mapper.dart}
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
  /// {@macro package:InvoiceF/features/configuration/company/data/mapper/company_mapper.dart}
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
    if ((sourceTypeOf == _typeOf<_i2.CompanyEntity>() ||
            sourceTypeOf == _typeOf<_i2.CompanyEntity?>()) &&
        (targetTypeOf == _typeOf<_i3.Company>() ||
            targetTypeOf == _typeOf<_i3.Company?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$CompanyEntity_To__i3$Company(
          (model as _i2.CompanyEntity?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.Company>() ||
            sourceTypeOf == _typeOf<_i3.Company?>()) &&
        (targetTypeOf == _typeOf<_i2.CompanyEntity>() ||
            targetTypeOf == _typeOf<_i2.CompanyEntity?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$Company_To__i2$CompanyEntity((model as _i3.Company?))
          as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.Company _map__i2$CompanyEntity_To__i3$Company(_i2.CompanyEntity? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping CompanyEntity → Company failed because CompanyEntity was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<CompanyEntity, Company> to handle null values during mapping.');
    }
    return _i3.Company(
      companyNo: model.companyNo,
      aName: model.arabicName,
      eName: model.englishName,
      officialAName: _i4.CompanyMapper.arabicName(model),
      officialEName: _i4.CompanyMapper.englishName(model),
      dateOfEstablishment: model.dateOfEstablishment,
      purpose: _i4.CompanyMapper.target(model),
      businessRegistrationNo: _i4.CompanyMapper.businessRegistrationNo(model),
      note: _i4.CompanyMapper.note(model),
      isShowHeaderInfoInReports: model.showHeaderInfoInReports,
      telephone1: _i4.CompanyMapper.telephone1(model),
      telephone2: _i4.CompanyMapper.telephone2(model),
      companyIconLocation: model.companyIconLocation80mm,
      isUseDifferentLogoForA4: model.isUseDifferentLogoForA4,
      companyIconLocationA4: model.companyIconLocationA4,
      isIncludeBranchName: model.includeBranchName,
      apartmentNum: _i4.CompanyMapper.buildingNo(model),
      street_Arb: _i4.CompanyMapper.streetArabic(model),
      street_Eng: _i4.CompanyMapper.streetEnglish(model),
      district_Arb: _i4.CompanyMapper.districtArabic(model),
      district_Eng: _i4.CompanyMapper.districtEnglish(model),
      city_Arb: _i4.CompanyMapper.cityArabic(model),
      city_Eng: _i4.CompanyMapper.cityEnglish(model),
      country_Arb: _i4.CompanyMapper.countryArabic(model),
      country_Eng: _i4.CompanyMapper.countryEnglish(model),
      POBox: _i4.CompanyMapper.postalCode(model),
      POBoxAdditionalNum: _i4.CompanyMapper.additionalNo(model),
      secondBusinessIDType: model.secondBusinessIDType,
      secondBusinessID: model.secondBusinessID,
      address: _i4.CompanyMapper.address(model),
    );
  }

  _i2.CompanyEntity _map__i3$Company_To__i2$CompanyEntity(_i3.Company? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Company → CompanyEntity failed because Company was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Company, CompanyEntity> to handle null values during mapping.');
    }
    return _i2.CompanyEntity(
      businessRegistrationNo: model.businessRegistrationNo,
      companyNo: model.companyNo,
      arabicName: model.aName,
      englishName: model.eName,
      dateOfEstablishment: model.dateOfEstablishment,
      telephone1: model.telephone1,
      address: model.address,
      telephone2: model.telephone2,
      officialArabicName: model.officialAName,
      officialEnglishName: model.officialEName,
      showHeaderInfoInReports: model.isShowHeaderInfoInReports,
      includeBranchName: model.isIncludeBranchName,
      target: model.purpose,
      note: model.note,
      buildingNo: model.apartmentNum,
      additionalNo: model.POBoxAdditionalNum,
      postalCode: model.POBox,
      streetNameArabic: model.street_Arb,
      streetNameEnglish: model.street_Eng,
      districtArabic: model.district_Arb,
      districtEnglish: model.district_Eng,
      cityArabic: model.city_Arb,
      cityEnglish: model.city_Eng,
      countryArabic: model.country_Arb,
      countryEnglish: model.country_Eng,
      secondBusinessID: model.secondBusinessID,
      secondBusinessIDType: model.secondBusinessIDType,
      companyIconLocation80mm: model.companyIconLocation,
      isUseDifferentLogoForA4: model.isUseDifferentLogoForA4,
      companyIconLocationA4: model.companyIconLocationA4,
    );
  }
}
