
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUser extends Equatable{
  final String uid;
  final String? email;

  AuthUser(this.uid, this.email);

  @override
  List<Object?> get props => [uid];

}

abstract class AuthRepositoryBase{
  Stream<AuthUser?> get onAuthStateChanged;

  Future<AuthUser?> signInAnonymously();

  Future<AuthUser?> signInWithGoogle();

  Future<AuthUser?> signInWithFacebook();

  Future<void> signOut();
}