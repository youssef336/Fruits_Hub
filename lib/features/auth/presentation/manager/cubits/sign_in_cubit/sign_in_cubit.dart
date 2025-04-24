// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_app/features/auth/domains/entities/user_entity.dart';
import 'package:fruits_hub_app/features/auth/domains/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SignInError(failure.message)),
      (user) => emit(SignInSuccess(user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInError(failure.message)),
      (user) => emit(SignInSuccess(user)),
    );
  }
}
