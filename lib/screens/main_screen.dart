import 'package:ecommerce/screens/favorite_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/more_screen.dart';
import 'package:ecommerce/screens/notification_screen.dart';
import 'package:ecommerce/utils/themes/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<Widget> screenList = [
    HomeScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body, bottomNavigationBar: bottomNav);
  }

  Widget get _body {
    return screenList[_currentIndex];
  }

  Widget get bottomNav {
    final items = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: "Notification",
      ),
      BottomNavigationBarItem(icon: Icon(Icons.more), label: "More"),
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
