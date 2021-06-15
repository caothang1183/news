import 'package:flutter/material.dart';
import 'package:news/constants/routes.dart';
import 'package:news/main.dart';
import 'package:news/redux/actions/route_actions.dart';
import 'package:news/redux/states/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> routerMiddleware() {
  return [
    TypedMiddleware<AppState, PopPageAction>(_popPage),
    TypedMiddleware<AppState, OpenHomePageAction>(_openHomePage),
    TypedMiddleware<AppState, OpenLoginPageAction>(_openLoginPage),
    TypedMiddleware<AppState, OpenRegisterPageAction>(_openRegisterPage),
  ];
}

_popPage(Store<AppState> store, action, NextDispatcher next) {
  navigatorKey.currentState.pop();
  next(action);
}

_openHomePage(Store<AppState> store, action, NextDispatcher next) {
  navigatorKey.currentState.pushNamedAndRemoveUntil(
    AppRoutes.homeRoute,
    (Route<dynamic> route) => false,
  );
  next(action);
}

_openLoginPage(Store<AppState> store, action, NextDispatcher next) {
  navigatorKey.currentState.pushNamed(AppRoutes.loginRoute);
  next(action);
}

_openRegisterPage(Store<AppState> store, action, NextDispatcher next) {
  navigatorKey.currentState.pushNamed(AppRoutes.registerRoute);
  next(action);
}
