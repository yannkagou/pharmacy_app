import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pharnacy/pages/userHomeScreen.dart';
import 'package:pharnacy/pages/userExplorerScreen.dart';
import 'package:pharnacy/pages/userSettingScreen.dart';
import 'package:pharnacy/widgets/userMainDrawer.dart';

class UserTabsScreen extends StatefulWidget {
  const UserTabsScreen({Key? key}) : super(key: key);

  @override
  State<UserTabsScreen> createState() => _UserTabsScreenState();
}

class _UserTabsScreenState extends State<UserTabsScreen> {
  final List<Widget> _pages = [
    UserHomeScreen(),
    UserExplorerScreen(),
    UserSettingScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: UserMainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white70,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.search),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.settings),
            label: 'Parametres',
          ),
        ],
      ),
    );
  }
}
