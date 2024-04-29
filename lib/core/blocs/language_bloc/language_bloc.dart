import 'package:bloc/bloc.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState("en")) {
    on<ChangeLanguageEvent>((event, emit) async {
      emit(LanguageState(event.languageCode));
    });
  }
}
