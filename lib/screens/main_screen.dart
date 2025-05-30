import 'package:ecommerce/screens/favorit_screen.dart';
import 'package:ecommerce/screens/home_screen.dart';
import 'package:ecommerce/screens/notification_screen.dart';
import 'package:ecommerce/screens/profile_screen.dart';
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
    FavoritScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body, bottomNavigationBar: _bottomNavigationBar);
  }

  Widget get _body {
    // return screenList.elementAt(_currentIndex);
    return screenList[_currentIndex];
  }

  Widget get _bottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey[400],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_sharp),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notification',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
