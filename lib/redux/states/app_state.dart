import 'package:connectivity/connectivity.dart';
import 'package:news/constants/emuns.dart';

class AppState {
  final TabBarModel activeTab;
  final ConnectivityResult networkStatus;
  AppState({
    this.activeTab = TabBarModel.all,
    this.networkStatus,
  });

  AppState copyWith({
    TabBarModel activeTab,
    ConnectivityResult networkStatus,
  }) {
    return AppState(
      activeTab: activeTab ?? this.activeTab,
      networkStatus: networkStatus ?? this.networkStatus,
    );
  }
}
