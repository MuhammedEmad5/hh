import '../../data/mapper/building_mapper.dart';
import '../../data/model/building_model.dart';
import '../../data/repositories/branch_repo_impl.dart';
import '../entities/branch_entity/branch_model.dart';

class ReadAllBranchesUseCase {
  final BranchRepo branchRepo;

  ReadAllBranchesUseCase({required this.branchRepo});

  Future<List<Branch>> execute() async {

    final List<dynamic> buildingJsonArr =
        await branchRepo.getAll<Building>();
    final buildingObjects =
        buildingJsonArr.map((building) => Building.fromJson(building)).toList();
    List<Branch> branches = [];
    for (Building building in buildingObjects) {
      branches.add(BuildingMapper().convert(building));
    }

    return branches;
  }
}
