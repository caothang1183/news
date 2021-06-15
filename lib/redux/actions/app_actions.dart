import 'package:news/constants/emuns.dart';

class SelectBottomTabBarAction {
  final TabBarModel activeTab;

  SelectBottomTabBarAction({this.activeTab});

  @override
  String toString() {
    return "SelectBottomTabBarAction{activeTab : ${this.activeTab}}";
  }
}
