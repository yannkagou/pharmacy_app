import 'package:flutter/material.dart';
import 'package:pharnacy/pages/pharmacyAuthScreen.dart';
import 'package:pharnacy/pages/userAuthScreen.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ),
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
            height: 50,
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
                    MaterialPageRoute(builder: (context) => UserAuthScreen()),
                  );
                },
                child: Text(
                  "Client",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                )),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 40,
            width: 86,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0x127710),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                onPressed: null,
                child: Text(
                  "Ou",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                )),
          ),
          SizedBox(
            height: 30,
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
                    MaterialPageRoute(
                        builder: (context) => PharmacyAuthScreen()),
                  );
                },
                child: Text(
                  "Pharmacie",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                )),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "En continuant vous indiquez que vous accepetez nos conditions generales et notre politique de vie privée",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
