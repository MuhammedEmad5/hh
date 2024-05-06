import '../../data/repositories/splash_repo_impl.dart';

class SetFirstTimeOpenAppUseCase {

  final SplashRepo splashRepo;

  SetFirstTimeOpenAppUseCase(this.splashRepo);

  Future<void> execute(String key) async {
      await splashRepo.setFirstTimeOpenTheApp(key,false);
  }





}