import 'package:InvoiceF/features/configuration/user_options/data/repositories/user_options_repo.dart';

class InsertListThemeUseCase {

  final UserOptionsRepo userOptionsRepo;

  InsertListThemeUseCase(this.userOptionsRepo);

  Future<void> execute(int id , String key) async {
     userOptionsRepo.insertStartListThemes(id,key);
  }

}