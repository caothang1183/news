import 'package:news/constants/emuns.dart';

class AppState {
  final TabBarModel activeTab;

  AppState({
    this.activeTab = TabBarModel.all,
  });

  AppState copyWith({
    TabBarModel activeTab,
  }) {
    return AppState(
      activeTab: activeTab ?? this.activeTab,
    );
  }
}
