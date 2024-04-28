import '../../data/mapper/person_mapper.dart';
import '../../data/model/person_model.dart';
import '../../data/repositories/user_registration_impl.dart';
import '../entities/user_entity.dart';

class UpdateUserUseCase {
  final  UserRegistrationRepo userRegistrationRepo;

  UpdateUserUseCase( this.userRegistrationRepo);

  Future<void> execute(User user,{required id}) async {
    final Person person = PersonMapper().convert(user);
    await userRegistrationRepo.update<Person>(person, id: id);
  }
}