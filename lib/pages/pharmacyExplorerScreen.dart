import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharnacy/pages/pharmacyDetailScreen.dart';
import '../widgets/pharmacyMainDrawer.dart';

class PharmacyExplorerScreen extends StatefulWidget {
  const PharmacyExplorerScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyExplorerScreen> createState() => _PharmacyExplorerScreenState();
}

class _PharmacyExplorerScreenState extends State<PharmacyExplorerScreen> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Card(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Rechercher une pharmacie...'),
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
            ),
          ),
        ),
        endDrawer: PharmacyMainDrawer(),
        body: Column(children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: (name != "")
                ? FirebaseFirestore.instance
                    .collection('pharmacies')
                    .where("nom", isEqualTo: name)
                    .snapshots()
                : FirebaseFirestore.instance
                    .collection("pharmacies")
                    .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                if ((snapshot.data?.docs.length ?? 0) > 0) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot data = snapshot.data!.docs[index];
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 3)),
                        ),
                        child: ListTile(
                          onTap: null, //Fonction ici
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data['image_url']),
                          ),
                          title: Text(
                            data['nom'],
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${data['ville']}    - ",
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
                          trailing: SizedBox(
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PharmacyDetailScreen(
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
                              icon: const Icon(Icons.message),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("Aucune pharmacie enregistrée pour l'instant"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
            },
          ))
        ]));
  }
}
