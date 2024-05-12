import 'package:InvoiceF/core/model/json_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_entity.g.dart';

@JsonSerializable()
class BankEntity {
  int bankAccountNumber;
  String userNumber;
  String arabicName;
  String? englishName;

  BankEntity({
    required this.bankAccountNumber,
    required this.userNumber,
    required this.arabicName,
    this.englishName,
  });

  @override
  factory BankEntity.fromJson(Map<String, dynamic> json) =>
      _$BankEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BankEntityToJson(this);
}
