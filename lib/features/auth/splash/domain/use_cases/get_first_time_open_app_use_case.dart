import '../../data/repositories/splash_repo_impl.dart';

class GetFirstTimeOpenAppUseCase {

  final SplashRepo splashRepo;

  GetFirstTimeOpenAppUseCase(this.splashRepo);

  Future<bool> execute(String key) async {
    final bool isFirstTime =   await splashRepo.getFirstTimeOpenTheApp(key);
    return isFirstTime;
  }





}