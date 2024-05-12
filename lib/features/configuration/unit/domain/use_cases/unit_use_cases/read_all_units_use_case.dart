
import '../../../data/models/Met_Unit_model.dart';
import '../../../data/repositories/unit_repo.dart';

class ReadAllUnitsUseCase {
  final UnitRepo unitRepo;

  ReadAllUnitsUseCase({required this.unitRepo});

  Future<List<Met_Unit>> execute() async {
    final List<dynamic> unitJsonArr = await unitRepo.getAll<Met_Unit>();
    final unitObjects =
        unitJsonArr.map((unit) => Met_Unit.fromJson(unit)).toList();
    return unitObjects;
  }
}
