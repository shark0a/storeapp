import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storeapp/Features/auth/data/models/login_request.dart';
import 'package:storeapp/Features/auth/data/repo/auth_repo.dart';
import 'package:storeapp/core/services/pref_keys.dart';
import 'package:storeapp/core/services/shared_pref.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const _Initial()) {
    on<LoginEvent>(_login);
  }
  final AuthRepos _repo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _repo.login(
      LoginRequest(
          email: emailController.text.trim(),
          password: passwordController.text),
    );
    result.when(
      success: (Ldata) async {
        final userToken = Ldata.data?.login?.accessToken ?? '';
        await SharedPref().setString(SharedKeys.accessToken, userToken);
        final user = await _repo.userRoel(userToken);
        await SharedPref().setInteger(SharedKeys.userId, user.useId ?? 0);
        emit(AuthState.success(userRole: user.userRole ?? ''));
      },
      faliure: (errorHandler) {
        emit(AuthState.faliure(errMessage: errorHandler));
      },
    );
  }
}
