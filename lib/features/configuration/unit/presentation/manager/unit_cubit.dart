import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/use_cases/unit_use_cases/read_all_units_use_case.dart';

part 'unit_state.dart';
part 'unit_cubit.freezed.dart';

class UnitCubit extends Cubit<UnitState> {
  final ReadAllUnitsUseCase readAllUnitsUseCase;

  UnitCubit(
    this.readAllUnitsUseCase,
  ) : super(const UnitState.loading());

  void getAllUnits() async {
    try {
      final units = await readAllUnitsUseCase.execute();
      // LoggerSingleton.logger.e(units.length);
      units.isEmpty ? emit(UnitState.empty()) : emit(UnitState.success(units));
    } catch (e) {
      emit(UnitState.error(e.toString()));
    }
  }
}
