import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  bool changeLocaleToEnglish() {
    emit(LocaleChangedtoEnglish());
    return true;
  }

  bool changeLocaleToArabic() {
    emit(LocaleChangedtoArabic());
    return true;
  }
}
