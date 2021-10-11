import 'dart:async';
import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upeu_flutter_app/src/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryBase _authRepository;
  late StreamSubscription _authSubscription;

  AuthCubit(this._authRepository) : super(AuthInitialState());

  Future<void> init() async {
    _authSubscription =
        _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }

  void _authStateChanged(AuthUser? user) =>
      user == null ? emit(AuthSignedOut()) : emit(AuthSignedIn(user));

  Future<void> signInAnonymously() => _signIn(_authRepository.signInAnonymously());

  Future<void> signInWithGoogle() => _signIn(_authRepository.signInWithGoogle());

  Future<void> signInWithFacebook() => _signIn(_authRepository.signInWithFacebook());

  Future<void> _signIn(Future<AuthUser?> auxUser) async {
    try {
      emit(AuthSigningIn());
      final user = await auxUser;
      if (user == null) {
        emit(AuthError("Error desconocido, intentelo de nuevo más tarde"));
      } else {
        emit(AuthSignedIn(user));
      }
    } catch (e) {
      emit(AuthError('Error: ${e.toString()}'));
    }
  }

  Future<void> signOut() async {
   await _authRepository.signOut();
   emit(AuthSignedOut());
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthSignedOut extends AuthState {}

class AuthSigningIn extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthSignedIn extends AuthState {
  final AuthUser user;

  AuthSignedIn(this.user);

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
