import 'package:connectivity/connectivity.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news/constants/emuns.dart';
import 'package:news/redux/states/app_state.dart';
import 'package:redux/redux.dart';

Store storeSelector(context) => StoreProvider.of<AppState>(context);

AppState appStateSelector(context) => storeSelector(context).state;

TabBarModel bottomAppBarSelector(AppState state) => state.activeTab;

ConnectivityResult networkStatusSelector(AppState state) => state.networkStatus;
