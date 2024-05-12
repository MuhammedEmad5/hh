import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../../domain/entities/branch_entity/branch_model.dart';
import '../../domain/use_cases/create_branch_use_case.dart';
import '../../domain/use_cases/delete_branch_use_case.dart';
import '../../domain/use_cases/read_all_branch_use_case.dart';
import '../../domain/use_cases/read_branch_use_case.dart';
import '../../domain/use_cases/update_branch_use_case.dart';

part 'branch_state.dart';
part 'branch_cubit.freezed.dart';

class BranchCubit extends Cubit<BranchState> {
  final CreateBranchUseCase _createBranchUseCase;
  final ReadBranchUseCase _readBranchUseCase;
  final DeleteBranchUseCase _deleteBranchUseCase;
  final UpdateBranchUseCase _updateBranchUseCase;
  final ReadAllBranchesUseCase _readAllBranchesUseCase;



  BranchCubit(
      this._createBranchUseCase,
      this._readBranchUseCase,
      this._deleteBranchUseCase,
      this._updateBranchUseCase,
      this._readAllBranchesUseCase)
      : super(const BranchState.loading());

  final StreamController<BranchState> _stateController = StreamController<BranchState>();


  void dispose() {
    // Close the stream controller
    _stateController.close();
    close();

  }
  void insertBranch(Branch branch) async {
    try {
      await _createBranchUseCase.execute(branch);
      getAllBranches();
      //emit(const BranchState.success(true));
    } catch (e) {
      emit(BranchState.error(e.toString()));
    }
  }

  void getAllBranches() async {
    try {
      final branches = await _readAllBranchesUseCase.execute();
     branches.isEmpty
         ?  emit(const BranchState.empty())
         : emit(BranchState.success(branches));
    } catch (e) {
      emit(BranchState.error(e.toString()));
    }
  }

  void getBranch({required double id}) async {
    try {
      final branch = await _readBranchUseCase.execute(id: id);
      emit(BranchState.success([branch]));
    } catch (e) {
      emit(BranchState.error(e.toString()));
    }
  }

  void updateBranch({required Branch branch}) async {
    try {
      await _updateBranchUseCase.execute(branch, id: branch.branchNumber);
      getAllBranches();
     // emit(BranchState.success(true));
    } catch (e) {
      emit(BranchState.error(e.toString()));
    }
  }

  void deleteBranch({required double id}) async {
    try {
      await _deleteBranchUseCase.execute(id: id);
      getAllBranches();
      //emit(BranchState.success(true));
    } catch (e) {
      emit(BranchState.error(e.toString()));
    }
  }
}
