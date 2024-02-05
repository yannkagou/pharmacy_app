import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  String? nom = "";
  String? prenom = "";
  String? email = "";
  String? tel = "";
  String? img = "";

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          nom = snapshot.data()!['nom'];
          prenom = snapshot.data()!['prenom'];
          email = snapshot.data()!['email'];
          tel = snapshot.data()!['telephone'];
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            // color: Theme.of(context).colorScheme.secondary,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
            ),
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
                  height: 10,
                ),
                SizedBox(
                  width: 353,
                  height: 46,
                  child: ListTile(
                    title: Text(
                      prenom!,
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
