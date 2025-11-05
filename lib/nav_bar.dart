import 'package:flutter/material.dart';
import 'package:tuneify_app/pages/home.dart';
import 'package:tuneify_app/pages/notifications.dart';
import 'package:tuneify_app/pages/profile.dart';
import 'package:tuneify_app/pages/search.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  List<Widget> widgets = [
    HomePage(),
    SearchPage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171716),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only( bottom: 15.0),
          child: Text(
            "Tuneify",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Color(0xFF171716),
        toolbarHeight: 35,
      ),
      body: IndexedStack(index: _selectedIndex, children: widgets),
      bottomNavigationBar: Container(
        color: Color(0xFF171716),
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navItem(Icons.home, 0),
            _navItem(Icons.search, 1),
            _navItem(Icons.notifications, 2),
            _navItem(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      icon: Icon(
        icon,
        size: 27,
        color: _selectedIndex == index ? Color(0xFFFFFF00) : Colors.white,
      ),
    );
  }
}
