import 'package:flutter/material.dart';
import 'package:pharnacy/pages/selectScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            height: 50,
          ),
          Image.asset(
            "assets/smartcom.jpg",
            fit: BoxFit.cover,
            width: 150,
            height: 160,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Bienvenu sur Pharmacy landmark",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10.0),
            width: 262,
            height: 120,
            child: Text(
              "Votre application vous permettra de trouvez facilement pharmacie à proximité et proposez des services pour une meilleure satisfaction qualité/prix.",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 47,
            width: 271,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectScreen()),
                  );
                },
                child: Text(
                  "Commencer!",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )),
          )
        ],
      ),
    );
  }
}
