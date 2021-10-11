import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upeu_flutter_app/src/ui/home_screen.dart';
import 'package:upeu_flutter_app/src/ui/intro_screen.dart';
import 'package:upeu_flutter_app/src/ui/splash_screen.dart';

class Routes {
  static const splash = '/splash';
  static const intro = '/';
  static const home = '/home';

  static Route routes(RouteSettings routeSettings){
    switch(routeSettings.name){
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(IntroScreen.create);
      case home:
        return _buildRoute(HomeScreen.create);
      default:
        throw Exception('No existe la ruta');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}