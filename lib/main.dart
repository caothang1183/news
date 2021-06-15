import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news/constants/colors.dart';
import 'package:news/constants/routes.dart';
import 'package:news/constants/strings.dart';
import 'package:news/redux/middlewares/log_middleware.dart';
import 'package:news/redux/middlewares/route_middleware.dart';
import 'package:news/redux/reducers/app_reducer.dart';
import 'package:news/redux/states/app_state.dart';
import 'package:news/router/app_routing.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(App());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [
      ...logMiddleware(),
      ...routerMiddleware(),
    ],
  );

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
      child: StoreProvider(
        store: _store,
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
        ),
      ),
    );
  }
}
