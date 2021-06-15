import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectivityResult;

  @override
  void initState() {
    initConnectivity();
    super.initState();
  }

  Future<void> initConnectivity() async {
    try {
      _connectivityResult = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

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
                vm.networkStatus == ConnectivityResult.none
                    ? Icon(Icons.wifi_off_outlined)
                    : Container(),
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
            body: StreamBuilder<ConnectivityResult>(
                stream: Connectivity().onConnectivityChanged,
                initialData: _connectivityResult,
                builder: (context, snapshot) {
                  if (snapshot.hasData && vm.networkStatus != snapshot.data) {
                    vm.networkListener(snapshot.data);
                  }
                  return fragments.elementAt(vm.currentIndex);
                }),
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
  final ConnectivityResult networkStatus;
  final Function onBottomTap;
  final Function openLoginPage;
  final Function networkListener;

  _ViewModel({
    this.currentIndex,
    this.networkStatus,
    this.onBottomTap,
    this.openLoginPage,
    this.networkListener,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      currentIndex: bottomAppBarSelector(store.state).index,
      networkStatus: networkStatusSelector(store.state),
      onBottomTap: (index) => store.dispatch(
        SelectBottomTabBarAction(
          activeTab: TabBarModel.values[index],
        ),
      ),
      openLoginPage: () {
        store.dispatch(OpenLoginPageAction());
      },
      networkListener: (networkStatus) {
        store.dispatch(
          NetworkChangeListenerAction(networkStatus: networkStatus),
        );
      },
    );
  }
}
