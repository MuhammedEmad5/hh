
import '../../data/mapper/person_mapper.dart';
import '../../data/model/person_model.dart';
import '../../data/repositories/user_registration_impl.dart';
import '../entities/user_entity.dart';

class ReadAllUsersUseCase {
  final UserRegistrationRepo userRegistrationRepo;

  ReadAllUsersUseCase(this.userRegistrationRepo);

  Future<List<User>> execute() async {
    final List<dynamic> personJsonArr = await userRegistrationRepo.getAll<Person>();
    final personObjects =
    personJsonArr.map((person) => Person.fromJson(person)).toList();
    List<User> userList = [];
    for (Person person in personObjects) {
      userList.add(PersonMapper().convert(person));
    }
    return userList;
  }
}