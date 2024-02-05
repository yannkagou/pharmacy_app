import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('User Informations')),
    );
  }
}
