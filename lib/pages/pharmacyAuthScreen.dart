import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:pharnacy/widgets/pharmacyAuthForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PharmacyAuthScreen extends StatefulWidget {
  const PharmacyAuthScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyAuthScreen> createState() => _PharmacyAuthScreenState();
}

class _PharmacyAuthScreenState extends State<PharmacyAuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String mdp,
    String nom,
    File? image,
    String ville,
    String telephone,
    String quartier,
    String description,
    bool _isLogin,
    BuildContext ctx,
  ) async {
    UserCredential userCredential;
    try {
      setState(() {
        _isLoading = true;
      });
      if (_isLogin) {
        userCredential =
            await _auth.signInWithEmailAndPassword(email: email, password: mdp);
      } else {
        userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: mdp);
      }

      final ref = FirebaseStorage.instance
          .ref()
          .child('pharamacy_image')
          .child('${userCredential.user!.uid}.jpg');
      await ref.putFile(image!);

      final url = await ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection("pharmacies")
          .doc(userCredential.user!.uid)
          .set({
        "nom": nom,
        "email": email,
        "image_url": url,
        "ville": ville,
        "telephone": telephone,
        "quartier": quartier,
        "description": description,
      });
    } on PlatformException catch (err) {
      var message =
          "Une erreur est survenue, veuillez verifier vos identifiants";

      if (err.message != null) {
        message = err.message!;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message.toString()),
          backgroundColor: Colors.redAccent,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(err.toString()),
          backgroundColor: Colors.redAccent,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PharmacyAuthForm(
        _submitAuthForm,
        _isLoading,
      ),
    );
  }
}
