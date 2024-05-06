
import '../../data/repositories/login_repo_impl.dart';

class SaveLanguageUseCase {

  final LoginRepo loginRepo;

  SaveLanguageUseCase(this.loginRepo);

  Future<void> execute(String key,String languageEnum) async {
    await loginRepo.saveLanguage(key,languageEnum);
  }





}