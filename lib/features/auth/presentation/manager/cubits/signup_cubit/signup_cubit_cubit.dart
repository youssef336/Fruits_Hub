import 'package:bloc/bloc.dart';
import 'package:fruits_hub_app/features/auth/domains/entities/user_entity.dart';
import 'package:fruits_hub_app/features/auth/domains/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_cubit_state.dart';

class SignupCubitCubit extends Cubit<SignupCubitState> {
  SignupCubitCubit(this.authRepo) : super(SignupCubitInitial());
  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupCubitLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (failure) => emit(SignupCubitError(failure.message)),
      (user) => emit(SignupCubitSuccess(user)),
    );
  }
}
