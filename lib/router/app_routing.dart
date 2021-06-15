import 'package:flutter/material.dart';
import 'package:news/constants/routes.dart';
import 'package:news/presentation/account/login_page.dart';
import 'package:news/presentation/account/register_page.dart';
import 'package:news/presentation/home/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case AppRoutes.loginRoute:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case AppRoutes.registerRoute:
      return MaterialPageRoute(builder: (_) => RegisterPage());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
