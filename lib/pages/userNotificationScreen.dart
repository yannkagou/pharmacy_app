import 'package:flutter/material.dart';

class UserNotificationScreen extends StatefulWidget {
  const UserNotificationScreen({Key? key}) : super(key: key);

  @override
  State<UserNotificationScreen> createState() => _UserNotificationScreenState();
}

class _UserNotificationScreenState extends State<UserNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Notifications')),
    );
  }
}
