import 'package:bloc/bloc.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState("ar")) {
    on<ChangeLanguageEvent>((event, emit) async {
      emit(LanguageState(event.languageCode));
    });
  }
}
