import 'package:InvoiceF/core/constants/sf_keys.dart';
import 'package:InvoiceF/core/data/datasources/local_data_source/shared_prefrence/sf_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/use_cases/insert_list_theme_to_sf_use_case.dart';
import '../../domain/use_cases/insert_page_theme_to_sf_use_case.dart';
import '../../domain/use_cases/read_all_themes_use_case.dart';
import '../../domain/use_cases/read_list_theme_from_sf_use_case.dart';
import '../../domain/use_cases/read_page_theme_from_sf_use_case.dart';

part 'user_options_state.dart';
part 'user_options_cubit.freezed.dart';

class UserOptionsCubit extends Cubit<UserOptionsState> {

  final ReadAllThemesUseCase _readAllThemesUseCase;
  final ReadListThemeUseCase  _readListThemeUseCase;
  final ReadPageThemeUseCase _readPageThemeUseCase;
  final InsertListThemeUseCase _insertListThemeUseCase;
  final InsertPageThemeUseCase _insertPageThemeUseCase;



  UserOptionsCubit(
      this._readAllThemesUseCase,
      this._readListThemeUseCase,
      this._readPageThemeUseCase,
      this._insertListThemeUseCase,
      this._insertPageThemeUseCase
      ) : super(const UserOptionsState.initial());

  void getAllThemes() async {
    emit(const UserOptionsState.loading());
    try {
      final themesList =
      await _readAllThemesUseCase.execute();

      themesList.isEmpty
          ? emit(const UserOptionsState.empty())
          : emit(UserOptionsState.success(themesList));
    } catch (e) {
      emit(UserOptionsState.error(e.toString()));
    }
  }

  void saveThemes({required int pageTheme,required int listTheme })async{
    await _insertPageThemeUseCase.execute(pageTheme, SfKeys.startPageTheme);
    await _insertListThemeUseCase.execute(listTheme, SfKeys.startListTheme);
  }

  Future<int?> getPageTheme() async{

    return await _readPageThemeUseCase.execute(SfKeys.startPageTheme);

  }
  Future<int?> getListTheme() async{

    return await _readListThemeUseCase.execute(SfKeys.startListTheme);

  }




}
