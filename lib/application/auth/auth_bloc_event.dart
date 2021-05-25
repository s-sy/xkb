part of 'auth_bloc.dart';

@freezed
abstract class AuthBlocEvent with _$AuthBlocEvent {
  const factory AuthBlocEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthBlocEvent.signedOut() = SignedOut;
  const factory AuthBlocEvent.getRefresh() = GetRefresh;
  const factory AuthBlocEvent.relogin() = Relogin;
}
