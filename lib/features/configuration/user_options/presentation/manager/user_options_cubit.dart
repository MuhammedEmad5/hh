import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_options_state.dart';

class UserOptionsCubit extends Cubit<UserOptionsState> {
  UserOptionsCubit() : super(UserOptionsInitial());
}
