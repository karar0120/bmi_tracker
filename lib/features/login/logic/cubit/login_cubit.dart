import 'package:bmi_tracker/features/login/data/repos/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInAnonymously() async {
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      print('User signed in anonymously: ${userCredential.user!.uid}');
    } catch (e) {
      print('Error signing in anonymously: $e');
    }
  }
}
