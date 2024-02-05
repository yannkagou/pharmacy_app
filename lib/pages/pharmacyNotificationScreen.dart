import 'package:flutter/material.dart';

class PharmacyNotificationScreen extends StatefulWidget {
  const PharmacyNotificationScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyNotificationScreen> createState() =>
      _PharmacyNotificationScreenState();
}

class _PharmacyNotificationScreenState
    extends State<PharmacyNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Notifications')),
    );
  }
}
