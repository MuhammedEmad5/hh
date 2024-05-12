import '../../data/mapper/building_mapper.dart';
import '../../data/model/building_model.dart';
import '../../data/repositories/branch_repo_impl.dart';
import '../entities/branch_entity/branch_model.dart';

class UpdateBranchUseCase {
  final BranchRepo branchRepo;

  UpdateBranchUseCase({required this.branchRepo});

  Future<void> execute(Branch branch,{required id}) async {
    final Building building = BuildingMapper().convert(branch);
    await branchRepo.update<Building>(building, id: id);
  }
}