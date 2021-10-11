import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upeu_flutter_app/src/app.dart';
import 'package:upeu_flutter_app/src/bloc/auth_cubit.dart';
import 'package:upeu_flutter_app/src/repository/implementations/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final authCubit = AuthCubit(AuthRepository());

  runApp(
    BlocProvider(
      create: (_) => authCubit..init(),
      child: MyApp.create(),
    ),
  );
}
