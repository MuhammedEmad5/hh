import 'package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.auto_mappr.dart';
import 'package:InvoiceF/features/configuration/user_options/data/models/met_theme.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import '../../domain/entities/them_entity.dart';

@AutoMappr([
  MapType<ThemeEntity, Met_Theme>(fields: [
    Field('themeNo', from: 'themeNumber'),
  ]),
  MapType<Met_Theme, ThemeEntity>(fields: [
    Field('themeNumber', from: 'themeNo'),
  ])
])
class UserOptionsMapper extends $UserOptionsMapper {

}