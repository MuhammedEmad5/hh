import 'package:freezed_annotation/freezed_annotation.dart';
part 'them_entity.g.dart';

@JsonSerializable()
class ThemeEntity {
  int themeNumber;
  String codeName;

  ThemeEntity({
    required this.themeNumber,
    required this.codeName,
  });

  @override
  factory ThemeEntity.fromJson(Map<String, dynamic> json) =>
      _$ThemeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeEntityToJson(this);


}