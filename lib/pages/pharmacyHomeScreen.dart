import 'package:flutter/material.dart';
import '../widgets/pharmacyMainDrawer.dart';

class PharmacyHomeScreen extends StatefulWidget {
  const PharmacyHomeScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyHomeScreen> createState() => _PharmacyHomeScreenState();
}

class _PharmacyHomeScreenState extends State<PharmacyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: PharmacyMainDrawer(),
      body: Center(
          child: Text(
              'Page d\'accueil des pharmacie, ce sont les discussions de chatt')),
    );
  }
}
