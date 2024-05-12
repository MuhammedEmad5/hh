import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import '../../domain/entities/branch_entity/branch_model.dart';
import '../model/building_model.dart';
import 'building_mapper.auto_mappr.dart';


@AutoMappr([
  MapType<Branch, Building>(fields: [
    Field('buildingNo', from: 'branchNumber'),
    Field('userNumber', from: 'customerNumber'),
    Field('aName', from: 'arabicName'),
    Field('aDescription', from: 'arabicDescription'),
    Field('eName', from: 'englishName'),
    Field('eDescription', from: 'englishDescription'),
  ]),
  MapType<Building, Branch>(fields: [
    Field('branchNumber', from: 'buildingNo'),
    Field('customerNumber', from: 'userNumber'),
    Field('arabicName', from: 'aName'),
    Field('arabicDescription', custom: BuildingMapper.handleArabicDescription),
    Field('englishName', custom: BuildingMapper.handleEnglishName),
    Field('englishDescription', custom: BuildingMapper.handleEnglishDescription),
    Field('note', custom: BuildingMapper.handleNote),
    Field('address', custom: BuildingMapper.handleAddress),
  ])
])
class BuildingMapper extends $BuildingMapper {


  static String handleArabicDescription(Building building) {

    if( building.aDescription == null ){
      return "";
    }
    return building.aDescription!;

  }
  static String handleEnglishDescription(Building building) {

    if( building.eDescription == null ){
      return "";
    }
    return building.eDescription!;

  }
  static String handleEnglishName(Building building) {

    if( building.eName == null ){
      return "";
    }
    return building.eName ?? "";

  }

  static String handleNote(Building building) {

    if( building.note == null ){
      return "";
    }
    return building.note ?? "";

  }

  static String handleAddress(Building building) {

    if( building.address == null ){
      return "";
    }
    return building.address ?? "";

  }


}
