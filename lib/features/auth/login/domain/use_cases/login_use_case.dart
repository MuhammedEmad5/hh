import '../../data/repositories/login_repo_impl.dart';

class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  Future<void> execute(String email, String pass) async {
   final result = await loginRepo.login(email, pass);
   if (result is List){
     result.isEmpty
         ? throw Exception()
         :null;

   }
  }
}
