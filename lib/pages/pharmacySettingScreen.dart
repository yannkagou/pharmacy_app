import 'package:flutter/material.dart';
import '../widgets/pharmacyMainDrawer.dart';

class PharmacySettingScreen extends StatefulWidget {
  const PharmacySettingScreen({Key? key}) : super(key: key);

  @override
  State<PharmacySettingScreen> createState() => _PharmacySettingScreenState();
}

class _PharmacySettingScreenState extends State<PharmacySettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Vos Parametres"),
      ),
      endDrawer: PharmacyMainDrawer(),
      body: Center(child: Text('Parametres')),
    );
  }
}
