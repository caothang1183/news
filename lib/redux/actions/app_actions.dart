import 'package:connectivity/connectivity.dart';
import 'package:news/constants/emuns.dart';

class SelectBottomTabBarAction {
  final TabBarModel activeTab;

  SelectBottomTabBarAction({this.activeTab});

  @override
  String toString() {
    return "SelectBottomTabBarAction{activeTab : ${this.activeTab}}";
  }
}

class NetworkChangeListenerAction {
  final ConnectivityResult networkStatus;

  NetworkChangeListenerAction({this.networkStatus});

  @override
  String toString() {
    return "NetworkChangeListenerAction{networkStatus : ${this.networkStatus}}";
  }
}
