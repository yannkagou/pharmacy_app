import 'package:flutter/material.dart';
import 'package:pharnacy/pages/pharmacyHomeScreen.dart';
import 'package:pharnacy/pages/pharmacyExplorerScreen.dart';
import 'package:pharnacy/pages/pharmacySettingScreen.dart';
import 'package:pharnacy/widgets/pharmacyMainDrawer.dart';

class PharmacyTabsScreen extends StatefulWidget {
  const PharmacyTabsScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyTabsScreen> createState() => _PharmacyTabsScreenState();
}

class _PharmacyTabsScreenState extends State<PharmacyTabsScreen> {
  final List<Widget> _pages = [
    PharmacyHomeScreen(),
    PharmacyExplorerScreen(),
    PharmacySettingScreen(),
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
      drawer: PharmacyMainDrawer(),
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
