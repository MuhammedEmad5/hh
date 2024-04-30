import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enums/connection_enum.dart';
import 'connection_event.dart';
import 'connection_state.dart';

class ConnectionTypeBloc extends Bloc<ConnectionTypeEvent, ConnectionTypeState> {
  ConnectionTypeBloc() : super(ConnectionTypeState(ConnectionEnum.local)) {
    on<ChangeConnectionTypeEvent>((event, emit) async {
      emit(ConnectionTypeState(event.connectionType));
    });
  }
}