import 'package:InvoiceF/core/constants/sf_keys.dart';
import 'package:InvoiceF/features/configuration/device_options/domain/entities/device_option_entity/device_option_entity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/use_cases/get_device_option_in_sf_use_cases.dart';
import '../../domain/use_cases/pick_image_device_option_use_cases.dart';
import '../../domain/use_cases/save_device_option_in_sf_use_cases.dart';

part 'device_option_state.dart';

part 'device_option_cubit.freezed.dart';

class DeviceOptionCubit extends Cubit<DeviceOptionState> {
  final PickImageDeviceOptionUseCase pickImageDeviceOptionUseCase;
  final SaveDeviceOptionInSharedPrefUseCase saveDeviceOptionInSharedPrefUseCase;
  final GetDeviceOptionInSharedPrefUseCase getDeviceOptionInSharedPrefUseCase;

  DeviceOptionCubit(this.pickImageDeviceOptionUseCase,
      this.saveDeviceOptionInSharedPrefUseCase,
      this.getDeviceOptionInSharedPrefUseCase)
      : super(const DeviceOptionState.initial());

  DeviceOptionEntity? deviceOption;

  void pickImage(TextEditingController controller) async {
    try {
      final imagePath = await pickImageDeviceOptionUseCase.execute();
      if (imagePath != null) {
        controller.text = imagePath;
        emit(DeviceOptionState.success(deviceOption!));
      }
    } catch (e) {
      emit(DeviceOptionState.error(e.toString()));
    }
  }

  void saveDeviceOptionObject(DeviceOptionEntity deviceOption) async {
    try {
      await saveDeviceOptionInSharedPrefUseCase.execute(
          deviceOption, SfKeys.deviceOption);
      getDeviceOptionObject();
    } catch (e) {
      emit(DeviceOptionState.error(e.toString()));
    }
  }

  Future<void> getDeviceOptionObject() async {
    try {
      final deviceOption = await getDeviceOptionInSharedPrefUseCase
          .execute(SfKeys.deviceOption);
      this.deviceOption = deviceOption;
      emit(DeviceOptionState.success(deviceOption));
    } catch (e) {
      emit(DeviceOptionState.error(e.toString()));
    }
  }
}
