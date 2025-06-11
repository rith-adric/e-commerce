import 'package:ecommerce/screens/favorite_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/more_screen.dart';
import 'package:ecommerce/screens/notification_screen.dart';
import 'package:ecommerce/utils/themes/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String username;

  const MainScreen({super.key, required this.username});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late List<Widget> screenList;

  @override
  void initState() {
    super.initState();
    screenList = [
      HomeScreen(username: widget.username),
      FavoriteScreen(),
      NotificationScreen(),
      MoreScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[_currentIndex],
      bottomNavigationBar: bottomNav,
    );
  }

  Widget get bottomNav {
    final items = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      const BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: "Favorite",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: "Notification",
      ),
      const BottomNavigationBarItem(icon: Icon(Icons.more), label: "More"),
    ];
    return BottomNavigationBar(
      items: items,
      backgroundColor: CallColors.defaultColor,
      selectedItemColor: CallColors.primary,
      unselectedItemColor: CallColors.textSecondary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
