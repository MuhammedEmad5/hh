import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_cases/create_user_use_case.dart';
import '../../domain/use_cases/read_all_users_use_case.dart';
import '../../domain/use_cases/update_user_use_case.dart';

part 'user_registration_state.dart';
part 'user_registration_cubit.freezed.dart';

class UserRegistrationCubit extends Cubit<UserRegistrationState> {
  final ReadAllUsersUseCase _readAllUsersUseCase;
  final CreateUserUseCase _createUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;

  UserRegistrationCubit(
      this._readAllUsersUseCase,
      this._createUserUseCase,
      this._updateUserUseCase
      )
      : super(const UserRegistrationState.initial());

  void insertUser(User user) async {
    emit(const UserRegistrationState.loading());

    try {
      await _createUserUseCase.execute(user);
      getAllUsers();
    } catch (e) {
      emit(UserRegistrationState.error(e.toString()));
    }
  }

  void updateUser( User user) async {
    emit(const UserRegistrationState.loading());
    try {
      await _updateUserUseCase.execute(user, id: user.personNumber);
      getAllUsers();
      // emit(BranchState.success(true));
    } catch (e) {
      emit(UserRegistrationState.error(e.toString()));
    }
  }

  void getAllUsers() async {
    emit(const UserRegistrationState.loading());
    try {
      final List<User> users = await _readAllUsersUseCase.execute();
      users.isEmpty
          ? emit(const UserRegistrationState.empty())
          : emit(UserRegistrationState.success(users));
    } catch (e) {
      emit(UserRegistrationState.error(e.toString()));
    }
  }
}
