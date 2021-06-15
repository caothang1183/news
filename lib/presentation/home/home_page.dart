import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:news/constants/emuns.dart';
import 'package:news/constants/strings.dart';
import 'package:news/presentation/home/fragments/headline_fragment.dart';
import 'package:news/presentation/home/fragments/profile_fragment.dart';
import 'package:news/presentation/home/fragments/topics_fragment.dart';
import 'package:news/presentation/home/widgets/bottom_tab_bar.dart';
import 'package:news/redux/actions/app_actions.dart';
import 'package:news/redux/actions/route_actions.dart';
import 'package:news/redux/selectors/app_state_selector.dart';
import 'package:news/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    final List<String> titles = [
      Strings.headlineTitle,
      Strings.topicsTitle,
      Strings.profileTitle,
    ];

    final List<Widget> fragments = [
      HeadlineFragment(),
      TopicsFragment(),
      ProfileFragment(),
    ];

    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        onInit: (store) {},
        builder: (context, vm) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(titles[vm.currentIndex]),
              actions: [
                TextButton(
                  onPressed: vm.openLoginPage,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            body: fragments.elementAt(vm.currentIndex),
            bottomNavigationBar: BottomTabBar(
              currentIndex: vm.currentIndex,
              onTap: vm.onBottomTap,
            ),
          );
        });
  }
}

class _ViewModel {
  final int currentIndex;
  final Function onBottomTap;
  final Function openLoginPage;

  _ViewModel({
    this.currentIndex,
    this.onBottomTap,
    this.openLoginPage,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      currentIndex: bottomAppBarSelector(store.state).index,
      onBottomTap: (index) => store.dispatch(
        SelectBottomTabBarAction(
          activeTab: TabBarModel.values[index],
        ),
      ),
      openLoginPage: () {
        store.dispatch(OpenLoginPageAction());
      },
    );
  }
}
