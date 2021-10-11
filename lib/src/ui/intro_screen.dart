import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upeu_flutter_app/src/bloc/auth_cubit.dart';

class IntroScreen extends StatelessWidget {
  static Widget create(BuildContext context) => IntroScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
      ),
      body: Column(
        children: [_LoginPage()],
      ),
    );
  }
}


class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Center(
            child:
                Image.asset('assets/health-hope.jpg', width: 200, height: 200),
          ),
          Center(
            child: Text(
              'Inicia sesión o crea una cuenta',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, height: 2),
            ),
          ),
          Padding(

            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                _LoginButton(
                  text: 'Iniciar sesión anonimamente',
                  imagePath: 'assets/icon-anonymous.png',
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  onTap: () => context.read<AuthCubit>().signInAnonymously(),
                ),
                SizedBox(height: 8),
                _LoginButton(
                  text: 'Iniciar sesión con Google',
                  imagePath: 'assets/icon-google.png',
                  color: Colors.white,
                  textColor: Colors.black54,
                  onTap: () => context.read<AuthCubit>().signInWithGoogle(),
                ),
                SizedBox(height: 8),
                _LoginButton(
                  text: 'Iniciar sesión con Facebook',
                  imagePath: 'assets/icon-facebook.png',
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onTap: () => context.read<AuthCubit>().signInWithFacebook(),
                ),
                SizedBox(height: 8),
                _LoginButton(
                  text: 'Iniciar sesión con email',
                  imagePath: 'assets/icon-mail.png',
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  onTap: () {
                    //Todo
                  },
                ),
              ],
            ),
          ),

          //RaisedButton(onPressed: (){}, child: Text('Inicia sesión como Anónimo'),),S
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  const _LoginButton(
      {Key? key,
      required this.text,
      required this.imagePath,
      this.color = Colors.blue,
      this.textColor = Colors.white,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 8,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Image.asset(imagePath, width: 24, height: 24),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
