import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PharmacyAccountScreen extends StatefulWidget {
  const PharmacyAccountScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyAccountScreen> createState() => _PharmacyAccountScreenState();
}

class _PharmacyAccountScreenState extends State<PharmacyAccountScreen> {
  String? nom = "";
  String? ville = "";
  String? quartier = "";
  String? email = "";
  String? tel = "";
  String? desc = "";
  String? img = "";

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("pharmacies")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          nom = snapshot.data()!['nom'];
          ville = snapshot.data()!['ville'];
          quartier = snapshot.data()!['quartier'];
          email = snapshot.data()!['email'];
          tel = snapshot.data()!['telephone'];
          desc = snapshot.data()!['description'];
          img = snapshot.data()!['image_url'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          "Mon Compte",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(img!),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Editer",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      IconButton(onPressed: null, icon: const Icon(Icons.edit)),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    nom!,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    email!,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )
            ],
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
            ),
            // color: Theme.of(context).colorScheme.secondary,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 353,
                  height: 46,
                  child: ListTile(
                    title: Text(
                      nom!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                        onPressed: null, icon: const Icon(Icons.edit)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 353,
                  height: 46,
                  child: ListTile(
                    title: Text(
                      ville!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                        onPressed: null, icon: const Icon(Icons.edit)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 353,
                  height: 46,
                  child: ListTile(
                    title: Text(
                      quartier!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                        onPressed: null, icon: const Icon(Icons.edit)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 353,
                  height: 46,
                  child: ListTile(
                    title: Text(
                      email!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                        onPressed: null, icon: const Icon(Icons.edit)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 353,
                  height: 46,
                  child: ListTile(
                    title: Text(
                      tel!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                        onPressed: null, icon: const Icon(Icons.edit)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 353,
                  height: 100,
                  child: ListTile(
                    title: Text(
                      desc!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                        onPressed: null, icon: const Icon(Icons.edit)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: null,
                    child: Text(
                      "Mettre à jour le profil",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
