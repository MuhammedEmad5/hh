import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/logger.dart';
import '../../domain/entities/client_vendor_entity/client_vendor_entity_model.dart';
import '../../domain/use_cases/client_vendor_use_cases/create_client_vendor_use_case.dart';
import '../../domain/use_cases/client_vendor_use_cases/delete_client_vendor_use_case.dart';
import '../../domain/use_cases/client_vendor_use_cases/read_all_client_vendor_use_case.dart';
import '../../domain/use_cases/client_vendor_use_cases/read_client_vendor_use_case.dart';
import '../../domain/use_cases/client_vendor_use_cases/update_client_vendor_use_case.dart';

part 'client_vendor_state.dart';
part 'client_vendor_cubit.freezed.dart';

class ClientVendorCubit extends Cubit<ClientVendorState> {
  final ReadAllClientVendorsUseCase readAllClientVendorsUseCase;
  final CreateClientVendorUseCase createClientVendorUseCase;
  final ReadClientVendorUseCase readClientVendorUseCase;
  final UpdateClientVendorUseCase updateClientVendorUseCase;
  final DeleteClientVendorUseCase deleteClientVendorUseCase;

  ClientVendorCubit(
      this.readAllClientVendorsUseCase,
      this.createClientVendorUseCase,
      this.readClientVendorUseCase,
      this.updateClientVendorUseCase,
      this.deleteClientVendorUseCase)
      : super(const ClientVendorState.loading());

  void insertClientVendor(ClientVendorEntity clientVendorEntity) async {
    try {
      await createClientVendorUseCase.execute(clientVendorEntity);
      // emit(const ClientVendorState.success(true));
      getClientsVendors();
    } catch (e) {
      emit(ClientVendorState.error(e.toString()));
    }
  }

  void getClientsVendors() async {
    try {
      emit(ClientVendorState.loading());
      final clientVendors = await readAllClientVendorsUseCase.execute();
      LoggerSingleton.logger.e(clientVendors.length);
      clientVendors.isEmpty
          ? emit(ClientVendorState.empty())
          : emit(ClientVendorState.success(clientVendors));
    } catch (e) {
      emit(ClientVendorState.error(e.toString()));
    }
  }

  void getClientVendor({required double id}) async {
    try {
      final clientVendorEntity = await readClientVendorUseCase.execute(id: id);
      emit(ClientVendorState.success([clientVendorEntity]));
    } catch (e) {
      emit(ClientVendorState.error(e.toString()));
    }
  }

  void updateClientVendor(
      {required ClientVendorEntity clientVendorEntity}) async {
    try {
      await updateClientVendorUseCase.execute(clientVendorEntity,
          id: clientVendorEntity.clientVendorNo);
      // emit(const ClientVendorState.success(true));
    } catch (e) {
      emit(ClientVendorState.error(e.toString()));
    }
  }

  void deleteClientVendor({required num id}) async {
    try {
      await deleteClientVendorUseCase.execute(id: id);
      // emit(const ClientVendorState.success(true));
    } catch (e) {
      emit(ClientVendorState.error(e.toString()));
    }
  }
}
