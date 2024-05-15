import 'package:InvoiceF/features/configuration/user_options/data/repositories/user_options_repo.dart';

class ReadListThemeUseCase {
  final UserOptionsRepo userOptionsRepo;

  ReadListThemeUseCase(this.userOptionsRepo);

  Future<int?> execute(String key) async {
    return await userOptionsRepo.getStartListThemes(key);
  }
}
