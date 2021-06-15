import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/constants/colors.dart';
import 'package:news/constants/routes.dart';
import 'package:news/constants/strings.dart';
import 'package:news/router/app_routing.dart';

void main() {
  runApp(App());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final appTheme = ThemeData(
      fontFamily: Strings.defaultFontFamily,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.darkGrey,
            displayColor: AppColors.darkGrey,
            fontFamily: Strings.defaultFontFamily,
          ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.darkGrey,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: AppColors.darkGrey,
        ),
      ),
      primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
            bodyColor: AppColors.darkGrey,
          ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Theme(
        data: appTheme,
        child: MaterialApp(
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: Strings.appName,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: generateRoute,
          initialRoute: AppRoutes.homeRoute,
        ));
  }
}
