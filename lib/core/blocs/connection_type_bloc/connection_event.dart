import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enums/connection_enum.dart';

abstract class ConnectionTypeEvent {}

class ChangeConnectionTypeEvent extends ConnectionTypeEvent {
  final ConnectionEnum connectionType;

  ChangeConnectionTypeEvent(this.connectionType);
}