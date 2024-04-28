
import '../../data/model/building_model.dart';
import '../../data/repositories/branch_repo_impl.dart';

class DeleteBranchUseCase {
  final BranchRepo branchRepo;

  DeleteBranchUseCase({required this.branchRepo});


  Future<void> execute({required double id}) async {
    await branchRepo.delete<Building>(id: id);
  }


}