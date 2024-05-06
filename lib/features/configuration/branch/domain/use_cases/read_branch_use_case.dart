import '../../../../../core/utils/logger.dart';
import '../../data/mapper/building_mapper.dart';
import '../../data/model/building_model.dart';
import '../../data/repositories/branch_repo_impl.dart';
import '../entities/branch_entity/branch_model.dart';

class ReadBranchUseCase {
  final BranchRepo branchRepo;

  ReadBranchUseCase({required this.branchRepo});

  Future<Branch> execute({required double id}) async {
    final buildingJsonArr = await branchRepo.getOne<Building>(id: id);
    final buildingData = buildingJsonArr.first;
    final buildingObject = Building.fromJson(buildingData);
    final Branch branchObject = BuildingMapper().convert(buildingObject);
    LoggerSingleton.logger.i(branchObject.toJson());

    return branchObject;
  }
}
