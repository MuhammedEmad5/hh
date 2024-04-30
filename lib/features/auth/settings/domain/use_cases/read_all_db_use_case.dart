import '../../data/repositories/settings_repo_impl.dart';

class ReadAllDbUseCase {
  final SettingsRepo settingsRepo;

  ReadAllDbUseCase({required this.settingsRepo});

  Future<List<String>> execute() async {
    final result = await settingsRepo.getAllDb();
    List<String> dbNames = [];

    for (var store in result) {
      if (store is Map && store.containsKey('name')) {
        dbNames.add(store['name'].toString());
      }
    }

    return dbNames;
  }
}
