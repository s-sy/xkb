import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ui/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthBlocState.initial());

  // https://bloclibrary.dev/#/migration
  // Starting with v5.0.0 of bloc library the initialState was removed in favor of passing it to the super contructor.
  /* @override
  AuthBlocState get initialState => const AuthBlocState.initial(); */

  @override
  Stream<AuthBlocState> mapEventToState(
    AuthBlocEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (e) async* {
        final userOption = await _authFacade.getSignedInUser();
        yield userOption.fold(
          () => const AuthBlocState.unauthenticated(),
          (_) => AuthBlocState.authenticated(),
        );
      },
      signedOut: (e) async* {
        await _authFacade.signOut();
        yield const AuthBlocState.unauthenticated();
      },
      getRefresh: (e) async* {
        yield const AuthBlocState.unauthenticated();
        // yield const AuthBlocState.loginOut();
        // final userOption = await _authFacade.getSignedInUser();
        // yield userOption.fold(
        //   () => const AuthBlocState.loginOut(),
        //   (_) => AuthBlocState.authenticated(),
        // );
      },
      relogin: (value) async* {
        yield const AuthBlocState.initial();
      },
    );
  }
}
