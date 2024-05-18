import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/use_cases/pick_image_device_option_use_cases.dart';


part 'device_option_state.dart';
part 'device_option_cubit.freezed.dart';

class DeviceOptionCubit extends Cubit<DeviceOptionState> {
  final PickImageDeviceOptionUseCase pickImageDeviceOptionUseCase;

  DeviceOptionCubit(this.pickImageDeviceOptionUseCase) : super(const DeviceOptionState.initial());

  void pickImage() async {
    try {
      await pickImageDeviceOptionUseCase.execute();
      emit(DeviceOptionState.success(pickImageDeviceOptionUseCase.openResult));
    } catch (e) {
      emit(DeviceOptionState.error(e.toString()));
    }
  }


}
