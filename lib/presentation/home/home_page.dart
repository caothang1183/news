import 'package:flutter/material.dart';
import 'package:news/constants/strings.dart';
import 'package:news/presentation/home/fragments/headline_fragment.dart';
import 'package:news/presentation/home/fragments/profile_fragment.dart';
import 'package:news/presentation/home/fragments/topics_fragment.dart';
import 'package:news/presentation/home/widgets/bottom_tab_bar.dart';

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

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(titles[0]),
        actions: [
          TextButton(
            onPressed: () {},
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
      body: fragments.elementAt(0),
      bottomNavigationBar: BottomTabBar(
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
