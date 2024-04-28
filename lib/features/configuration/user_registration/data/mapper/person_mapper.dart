import 'package:InvoiceF_Configuration/features/configuration/user_registration/data/mapper/person_mapper.auto_mappr.dart';
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import '../../domain/entities/user_entity.dart';
import '../model/person_model.dart';

@AutoMappr([
  MapType<User, Person>(fields: [
    Field('VendorId', custom: PersonMapper.vendorId),
    Field('personNo', from: 'personNumber'),
    Field('userNumber', custom: PersonMapper.userNumber),
    Field('aName', from: "arabicName"),
    Field('eName', custom: PersonMapper.englishName),
    Field('mainContact1', custom: PersonMapper.mainContact1),
    Field('logger', from: 'email'),
    Field('password1', custom: PersonMapper.password1User),
    Field('password2', custom: PersonMapper.password2User),
    Field('isUser', custom: PersonMapper.isUserInt

    ),
  ]),
  MapType<Person, User>(fields: [
    Field('personNumber', from: 'personNo'),
    Field('email', from: 'logger'),
    Field('arabicName', from: 'aName'),
    Field('englishName', from: 'eName'),
    Field('isUser', custom: PersonMapper.isUserBool),
  ])
])
class PersonMapper extends $PersonMapper {
  static int vendorId() {
    return 0;
  }

  static String userNumber(User user) {
    return user.personNumber.toString();
  }
  static bool isUserBool(Person person) {
    if (person.isUser == 0) {
      return false;
    }
    if (person.isUser == 1) {
      return true;
    }


    return person.isUser;
  }



  static String? englishName(User user) {
    if (user.englishName == "") {
      return null;
    }
    return user.englishName;
  }

  static String? mainContact1(User user) {
    if (user.mainContact1 == null || user.mainContact1 == "") {
      return null;
    }
    return user.mainContact1;
  }

  static int isUserInt(User user) {
    return user.isUser ? 1 : 0;
  }

  static String password2User(User user) {
    return "Iz";
  }

  static String password1User(User user) {
    return "MT";
  }
}
