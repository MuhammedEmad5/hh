import 'package:InvoiceF/features/configuration/user_options/data/mapper/user_options_mapper.dart';
import 'package:InvoiceF/features/configuration/user_options/data/models/met_theme.dart';
import 'package:InvoiceF/features/configuration/user_options/data/repositories/user_options_repo.dart';
import 'package:InvoiceF/features/configuration/user_options/domain/entities/them_entity.dart';

class ReadAllThemesUseCase {
  final UserOptionsRepo userOptionsRepo;

  ReadAllThemesUseCase(this.userOptionsRepo);

  Future<List<ThemeEntity>> execute() async {
    final List<dynamic> metaThemeJsonArr =
        await userOptionsRepo.getAll<Met_Theme>();
    final metaThemesObjects = metaThemeJsonArr
        .map((metaTheme) => Met_Theme.fromJson(metaTheme))
        .toList();
    List<ThemeEntity> themesList = [];
    for (Met_Theme metaTheme in metaThemesObjects) {
      themesList.add(UserOptionsMapper().convert(metaTheme));
    }

    return themesList;
  }
}
