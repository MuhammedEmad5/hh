import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import '../../domain/entities/company_unit_entity/company_unit_entity_model.dart';
import '../models/company_unit_model.dart';
import 'company_unit_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<CompanyUnitEntity, CompanyUnit>(fields: [
    Field('aName', from: 'aName'),
    Field('eName', from: 'eName'),
    Field('unitNo', from: 'unitNo'),
  ]),
  MapType<CompanyUnit, CompanyUnitEntity>(fields: [
    Field('aName', from: 'aName'),
    Field('eName', from: 'eName'),
    Field('unitNo', from: 'unitNo'),
  ])
])
class CompanyUnitMapper extends $CompanyUnitMapper {}
