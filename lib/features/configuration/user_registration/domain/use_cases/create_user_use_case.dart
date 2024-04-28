
import '../../data/mapper/person_mapper.dart';
import '../../data/model/person_model.dart';
import '../../data/repositories/user_registration_impl.dart';
import '../entities/user_entity.dart';

class CreateUserUseCase {
  final UserRegistrationRepo userRegistrationRepo;

  CreateUserUseCase( this.userRegistrationRepo);

  Future<void> execute(User user) async {
    final Person person = PersonMapper().convert(user);
    await userRegistrationRepo.insert(person);
  }
}