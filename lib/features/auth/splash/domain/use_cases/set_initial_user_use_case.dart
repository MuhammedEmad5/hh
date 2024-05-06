import '../../../user_registration/data/mapper/person_mapper.dart';
import '../../../user_registration/data/model/person_model.dart';
import '../../../user_registration/domain/entities/user_entity.dart';
import '../../data/repositories/splash_repo_impl.dart';


class SetInitialUserUseCase {
  final SplashRepo splashRepo;

  SetInitialUserUseCase( this.splashRepo);

  Future<void> execute() async {
    final initialUser = User(
        personNumber: 1,
        email: "admin",
        arabicName: "المدير",
        englishName: "Administrator",
        isUser: false,
    );

    final Person person = PersonMapper().convert(initialUser);
    await splashRepo.insert(person);
  }
}