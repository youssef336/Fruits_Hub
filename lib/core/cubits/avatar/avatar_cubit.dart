import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub_app/core/services/shared_preferences_singletone.dart';

import '../../../constant.dart';

part 'avatar_state.dart';

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit() : super(AvatarInitial());

  void changeAvatar(String avatar) {
    Prefs.setString(Kavatar, avatar);

    emit(ChangeAvatar(avatar));
  }
}
