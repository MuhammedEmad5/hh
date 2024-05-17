import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_file_plus/open_file_plus.dart';


part 'device_option_state.dart';
part 'device_option_cubit.freezed.dart';

class DeviceOptionCubit extends Cubit<DeviceOptionState> {
  DeviceOptionCubit() : super(const DeviceOptionState.initial());

  var openResult = 'Unknown';

  Future<void> openFile() async {
    try{
      const filePath = '/storage/emulated/0/update.apk';
      final result = await OpenFile.open(filePath);
      openResult = "type=${result.type}  message=${result.message}";
      print(openResult);
      emit(DeviceOptionState.success(openResult));
      print(openResult);
    }catch(error){
      print(error.toString());
      emit(DeviceOptionState.error(error.toString()));
    }
  }
}
