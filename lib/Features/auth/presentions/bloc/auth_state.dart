part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = Loadingstate;
  const factory AuthState.faliure({required String errMessage}) = Faliurstate;
  const factory AuthState.success({required String userRole}) = SuccessState;
}
