import '../../data/repositories/user_options_repo.dart';

class InsertPageThemeUseCase {

  final UserOptionsRepo userOptionsRepo;

  InsertPageThemeUseCase(this.userOptionsRepo);

  Future<void> execute(int id , String key) async {
    userOptionsRepo.insertStartPageThemes(id,key);
  }

}