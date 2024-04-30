import 'package:freezed_annotation/freezed_annotation.dart';

part 'row_times_model.g.dart';

@JsonSerializable()

class RowTimestamp {
  String type;
  List<int> data;

  RowTimestamp({
    required this.type,
    required this.data,
  });

  @override
  factory RowTimestamp.fromJson(Map<String, dynamic> json) =>
      _$RowTimestampFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RowTimestampToJson(this);

}