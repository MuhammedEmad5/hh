import '../../data/repositories/user_options_repo.dart';

class ReadPageThemeUseCase {
  final UserOptionsRepo userOptionsRepo;

  ReadPageThemeUseCase(this.userOptionsRepo);

  Future<int?> execute(String key) async {
    return await userOptionsRepo.getStartPageThemes(key);
  }
}