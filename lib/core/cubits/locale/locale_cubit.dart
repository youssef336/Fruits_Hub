import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  bool changeLocale() {
    if (state is LocaleChangedtoEnglish) {
      emit(LocaleChangedtoArabic());
      return true;
    } else {
      emit(LocaleChangedtoEnglish());
      return false;
    }
  }
}
