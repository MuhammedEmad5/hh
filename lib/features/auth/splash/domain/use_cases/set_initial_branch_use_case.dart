
import '../../data/repositories/splash_repo_impl.dart';

class SetInitialBranchUseCase {
  final SplashRepo splashRepo;

  SetInitialBranchUseCase( this.splashRepo);

  Future<void> execute() async {
    final initialBranch = Branch
      (branchNumber: 1,
        arabicName: "مباني المؤسسة",
      englishName: "Company Buildings"

    );

    final Building building = BuildingMapper().convert(initialBranch);
    await splashRepo.insert(building);
  }
}