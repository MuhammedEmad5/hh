import 'package:InvoiceF_Configuration/features/configuration/company_bill_type_options/data/mapper/company_bill_type_mapper.auto_mappr.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import '../../domain/entities/company_bill_type_entity/company_bill_type_entity_model.dart';
import '../models/company_bill_type_model.dart';

@AutoMappr([
  MapType<CompanyBillTypeEntity, CompanyBillType>(fields: [
    Field('billTypeNo', from: 'billTypeNo'),
    Field('report_OnPostTypeNo', from: 'report_OnPostTypeNo'),
    Field('VATTypeNo', from: 'VATTypeNo'),
    Field('VATGroupNo', from: 'VATGroupNo'),
    Field('reportUnderHeader', from: 'reportUnderHeader'),
    Field('reportUnderHeader_En', from: 'reportUnderHeader_En'),
    Field('reportUnderDataStatement', from: 'reportUnderDataStatement'),
  ]),
  MapType<CompanyBillType, CompanyBillTypeEntity>(fields: [
    Field('billTypeNo', from: 'billTypeNo'),
    Field('report_OnPostTypeNo', from: 'report_OnPostTypeNo'),
    Field('VATTypeNo', from: 'VATTypeNo'),
    Field('VATGroupNo', from: 'VATGroupNo'),
    Field('reportUnderHeader', from: 'reportUnderHeader'),
    Field('reportUnderHeader_En', from: 'reportUnderHeader_En'),
    Field('reportUnderDataStatement', from: 'reportUnderDataStatement'),
  ])
])
class CompanyBillTypeMapper extends $CompanyBillTypeMapper {}
