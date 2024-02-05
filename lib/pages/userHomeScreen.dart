import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharnacy/pages/pharmacyDetailScreen.dart';
import 'package:pharnacy/widgets/userMainDrawer.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Nos Pharmacies"),
        ),
        endDrawer: UserMainDrawer(),
        body: Container(
          child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('pharmacies')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      if ((snapshot.data?.docs.length ?? 0) > 0) {
                        return GridView.builder(
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            primary: false,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 4.0),
                            itemBuilder: (BuildContext context, int index) {
                              final DocumentSnapshot data =
                                  snapshot.data!.docs[index];
                              return Center(
                                  child: Card(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PharmacyDetailScreen(
                                          docId: data.id,
                                          img: data['image_url'],
                                          nom: data['nom'],
                                          ville: data['ville'],
                                          quartier: data['quartier'],
                                          email: data['email'],
                                          tel: data['telephone'],
                                          desc: data['description'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      color: Colors.white,
                                      height: 200,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  data['image_url']),
                                              radius: 30,
                                            ),
                                            Text(data['nom']),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "${data['ville']}  - ",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurface),
                                                ),
                                                Text(
                                                  data['quartier'],
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurface),
                                                ),
                                              ],
                                            ),
                                            Text(data['telephone']),
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                ),
                                                onPressed: null,
                                                child: Text(
                                                  "Contacter",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )),
                                          ])),
                                ),
                              ));
                            });
                      } else {
                        return const Center(
                          child: Text(
                              "Aucune pharmacie enregistrée pour l'instant"),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    }
                  })
            ],
          ),
        ));
  }
}
