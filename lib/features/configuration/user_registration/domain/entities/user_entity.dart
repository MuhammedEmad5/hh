
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.g.dart';


@JsonSerializable()
class User {
  int personNumber;
  String email;
  String arabicName;
  String? englishName;
  String? password1;
  String? password2;

   String? mainContact1;
   dynamic isUser;
  num? buildingNo;


  User(
      {required this.personNumber,
      required this.email,
      required this.arabicName,
       this.englishName,
       this.password1,
       this.password2,
        this.mainContact1,
         required this.isUser,
        this.buildingNo

      });



  @override
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);


}



