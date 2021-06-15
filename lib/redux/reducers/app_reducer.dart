import 'package:news/redux/actions/app_actions.dart';
import 'package:news/redux/states/app_state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    activeTab: appCombineReducer(state, action).activeTab,
  );
}

final appCombineReducer = combineReducers<AppState>([
  TypedReducer<AppState, SelectBottomTabBarAction>(_activeBottomTabBarReducer),
]);

AppState _activeBottomTabBarReducer(
  AppState state,
  SelectBottomTabBarAction action,
) {
  return state.copyWith(activeTab: action.activeTab);
}
