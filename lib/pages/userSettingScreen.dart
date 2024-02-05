import 'package:flutter/material.dart';
import 'package:pharnacy/widgets/userMainDrawer.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingScreen> createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Vos Parametres"),
      ),
      endDrawer: UserMainDrawer(),
      body: Center(child: Text('Parametres')),
    );
  }
}
