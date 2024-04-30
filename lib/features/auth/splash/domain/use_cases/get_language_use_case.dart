
import '../../data/repositories/splash_repo_impl.dart';

class GetLanguageUseCase {

  final SplashRepo splashRepo;

  GetLanguageUseCase(this.splashRepo);

  Future<String> execute(String key) async {
    final  language =   await splashRepo.getSavedLanguage(key);



      return  language;




  }





}