import 'package:bmi_tracker/core/helper/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final AppPreferences _appPreferences;
  LoginCubit(this._appPreferences) : super(const LoginState.initial());
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInAnonymously() async {
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      _appPreferences.setAccessToken(accessToken: userCredential.user!.uid);
    } catch (e) {
      print('Error signing in anonymously: $e');
    }
  }
}
