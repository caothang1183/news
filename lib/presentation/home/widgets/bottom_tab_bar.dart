import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onTap;

  const BottomTabBar({
    Key key,
    @required this.currentIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: ValueKey("todo_bottom_navigation_bar"),
      items: _buildBottomItems(),
      currentIndex: currentIndex,
      selectedItemColor: Colors.blueAccent,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      onTap: onTap,
    );
  }
}

BottomNavigationBarItem _buildBottomItem({IconData icon, String label}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}

List<BottomNavigationBarItem> _buildBottomItems() {
  return [
    _buildBottomItem(icon: Icons.list, label: 'Headline'),
    _buildBottomItem(icon: Icons.favorite, label: 'Topics'),
    _buildBottomItem(icon: Icons.account_box, label: 'Profile'),
  ];
}
