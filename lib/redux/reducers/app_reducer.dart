import 'package:news/redux/actions/app_actions.dart';
import 'package:news/redux/states/app_state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    activeTab: appCombineReducer(state, action).activeTab,
    networkStatus: appCombineReducer(state, action).networkStatus,
  );
}

final appCombineReducer = combineReducers<AppState>([
  TypedReducer<AppState, SelectBottomTabBarAction>(_activeBottomTabBarReducer),
  TypedReducer<AppState, NetworkChangeListenerAction>(
      _networkChangeListenerReducer),
]);

AppState _activeBottomTabBarReducer(
  AppState state,
  SelectBottomTabBarAction action,
) {
  return state.copyWith(activeTab: action.activeTab);
}

AppState _networkChangeListenerReducer(
  AppState state,
  NetworkChangeListenerAction action,
) {
  return state.copyWith(networkStatus: action.networkStatus);
}
