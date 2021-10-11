import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static Widget create(BuildContext context) => SplashScreen();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           CircularProgressIndicator(),
           SizedBox(height: 24),
           Text(
               'Cargando...',
             style: TextStyle(fontSize: 24),
           ),
         ],
       ),
     ),
   );
  }
}