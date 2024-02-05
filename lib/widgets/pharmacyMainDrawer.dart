import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharnacy/pages/pharmacyAccountScreen.dart';
import 'package:pharnacy/pages/pharmacyNotificationScreen.dart';
import 'package:pharnacy/pages/aboutScreen.dart';
import 'package:pharnacy/pages/helpScreen.dart';

class PharmacyMainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 60,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Reglages',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.key,
              size: 26,
            ),
            title: Text(
              'Compte',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PharmacyAccountScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              size: 26,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PharmacyNotificationScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              size: 26,
            ),
            title: Text(
              'Se deconnecter',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline_rounded,
              size: 26,
            ),
            title: Text(
              'A propos',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline_rounded,
              size: 26,
            ),
            title: Text(
              'Aide',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
