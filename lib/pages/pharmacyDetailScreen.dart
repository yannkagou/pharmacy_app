import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharnacy/chat_interface/chat_params.dart';

class PharmacyDetailScreen extends StatefulWidget {
  String? docId;
  String? img;
  String? nom;
  String? ville;
  String? quartier;
  String? email;
  String? tel;
  String? desc;

  PharmacyDetailScreen(
      {this.docId,
      this.img,
      this.nom,
      this.ville,
      this.quartier,
      this.email,
      this.tel,
      this.desc});

  @override
  State<PharmacyDetailScreen> createState() => _PharmacyDetailScreenState();
}

class _PharmacyDetailScreenState extends State<PharmacyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Information sur la Pharmacie",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.img!),
                  radius: 100,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.nom!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DecoratedBox(
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: Text(
                  widget.desc!,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ville: ' + widget.ville!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Quartier: ' + widget.quartier!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Numero de Téléphone: ' + widget.tel!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Addresse mail: ' + widget.email!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    if (FirebaseAuth.instance.currentUser!.uid == widget.docId)
                      Fluttertoast.showToast(msg: "Error! Try again!");
                    Navigator.pushNamed(
                      context,
                      '/chat',
                      arguments: ChatParams(
                          FirebaseAuth.instance.currentUser!.uid,
                          widget.docId!,
                          widget.nom!),
                    );
                  },
                  // onPressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ChatScreenSmart(
                  //                 arguments: ChatScreenSmartArguments(
                  //                   peerId: widget.docId!,
                  //                   peerAvatar: widget.img!,
                  //                   peerName: widget.nom!,
                  //                 ),

                  //               )));
                  // },
                  child: Text(
                    "Contactez",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
