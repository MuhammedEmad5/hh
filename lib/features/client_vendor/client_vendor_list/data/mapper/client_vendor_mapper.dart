import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';

import '../../domain/entities/client_vendor_entity/client_vendor_entity_model.dart';
import '../models/client_vendor_model.dart';
import 'client_vendor_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<ClientVendor, ClientVendorEntity>(fields: [
    Field('clientVendorNo', from: 'clientVendorNo'),
    Field('aName', from: 'aName'),
    Field('eName', from: 'eName'),
    Field('mainContact1', from: 'mainContact1'),
    Field('VATID', from: 'VATID'),
    Field('aDescription', from: 'aDescription'),
    Field('eDescription', from: 'eDescription'),
    Field('mainContact2', from: 'mainContact2'),
    Field('mainContact3', from: 'mainContact3'),
    Field('mainContact4', from: 'mainContact4'),
    Field('IDCard', from: 'IDCard'),
    Field('address', from: 'address'),
    Field('warnMaxBalance', from: 'warnMaxBalance'),
    Field('warnMinBalance', from: 'warnMinBalance'),
    Field('maxBalanceAllowed', from: 'maxBalanceAllowed'),
    Field('minBalanceAllowed', from: 'minBalanceAllowed'),
    Field('note', from: 'note'),
    Field('apartmentNum', from: 'apartmentNum'),
    Field('POBoxAdditionalNum', from: 'POBoxAdditionalNum'),
    Field('POBox', from: 'POBox'),
    Field('street_Eng', from: 'street_Eng'),
    Field('street_Arb', from: 'street_Arb'),
    Field('district_Arb', from: 'district_Arb'),
    Field('district_Eng', from: 'district_Eng'),
    Field('city_Eng', from: 'city_Eng'),
    Field('city_Arb', from: 'city_Arb'),
    Field('country_Eng', from: 'country_Eng'),
    Field('country_Arb', from: 'country_Arb'),
    Field('secondBusinessID', from: 'secondBusinessID'),
    Field('secondBusinessIDType', from: 'secondBusinessIDType'),
  ]),
  MapType<ClientVendorEntity, ClientVendor>(fields: [
    Field('clientVendorNo', from: 'clientVendorNo'),
    Field('userNumber', custom: ClientVendorMapper.userNumber),
    Field('aName', from: 'aName'),
    Field('eName', from: 'eName'),
    Field('mainContact1', from: 'mainContact1'),
    Field('VATID', from: 'VATID'),
    Field('aDescription', from: 'aDescription'),
    Field('eDescription', from: 'eDescription'),
    Field('mainContact2', from: 'mainContact2'),
    Field('mainContact3', from: 'mainContact3'),
    Field('mainContact4', from: 'mainContact4'),
    Field('IDCard', from: 'IDCard'),
    Field('address', from: 'address'),
    Field('warnMaxBalance', from: 'warnMaxBalance'),
    Field('warnMinBalance', from: 'warnMinBalance'),
    Field('maxBalanceAllowed', from: 'maxBalanceAllowed'),
    Field('minBalanceAllowed', from: 'minBalanceAllowed'),
    Field('note', from: 'note'),
    Field('apartmentNum', from: 'apartmentNum'),
    Field('POBoxAdditionalNum', from: 'POBoxAdditionalNum'),
    Field('POBox', from: 'POBox'),
    Field('street_Eng', from: 'street_Eng'),
    Field('street_Arb', from: 'street_Arb'),
    Field('district_Arb', from: 'district_Arb'),
    Field('district_Eng', from: 'district_Eng'),
    Field('city_Eng', from: 'city_Eng'),
    Field('city_Arb', from: 'city_Arb'),
    Field('country_Eng', from: 'country_Eng'),
    Field('country_Arb', from: 'country_Arb'),
    Field('secondBusinessID', from: 'secondBusinessID'),
    Field('secondBusinessIDType', from: 'secondBusinessIDType'),
  ])
])
class ClientVendorMapper extends $ClientVendorMapper {
  static String userNumber(ClientVendorEntity clientVendorEntity) =>
      clientVendorEntity.clientVendorNo.toString();
}
