import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pharnacy/widgets/imagepicker.dart';
import 'package:pharnacy/pages/pharmacyTabsScreen.dart';

class PharmacyAuthForm extends StatefulWidget {
  PharmacyAuthForm(this.SubmitFn, this.isLoading);

  final bool isLoading;

  final void Function(
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
  ) SubmitFn;

  @override
  State<PharmacyAuthForm> createState() => _PharmacyAuthFormState();
}

class _PharmacyAuthFormState extends State<PharmacyAuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _pharmacyEmail = '';
  var _pharmacyName = '';
  var _pharmacyPassword = '';
  var _pharmacyVille = '';
  var _pharmacyTelephone = '';
  var _pharmacyQuartier = '';
  var _pharmacyDescription = '';
  File? _pharmacyImageFile;

  void _pickedImage(File image) {
    _pharmacyImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_pharmacyImageFile == null && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Veuillez selectionner une image!'),
        backgroundColor: Colors.redAccent,
      ));
      // return;
    }

    if (isValid && _pharmacyImageFile != null) {
      _formKey.currentState!.save();
      widget.SubmitFn(
          _pharmacyEmail.trim(),
          _pharmacyPassword.trim(),
          _pharmacyName.trim(),
          _pharmacyImageFile,
          _pharmacyVille.trim(),
          _pharmacyTelephone.trim(),
          _pharmacyQuartier.trim(),
          _pharmacyDescription.trim(),
          _isLogin,
          context);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PharmacyTabsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text("Informations personnelles de la Pharmacie"),
      ),
      body: Center(
        child: Card(
          color: Theme.of(context).colorScheme.secondary,
          margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(3),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!_isLogin) UserImagePicker(_pickedImage),
                  SizedBox(
                    height: 10,
                  ),
                  if (!_isLogin)
                    SizedBox(
                      width: 353,
                      height: 40,
                      child: TextFormField(
                        key: ValueKey('nom'),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 2) {
                            return 'Veuillez entrer au moins 2 caractères';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                            hintText: 'Nom de la pharmacie'),
                        onSaved: (value) {
                          _pharmacyName = value!;
                        },
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  if (!_isLogin)
                    SizedBox(
                      width: 353,
                      height: 40,
                      child: TextFormField(
                        key: ValueKey('ville'),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 2) {
                            return 'Veuillez entrer au moins 2 caractères';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                            hintText: 'Ville'),
                        onSaved: (value) {
                          _pharmacyVille = value!;
                        },
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  if (!_isLogin)
                    SizedBox(
                      width: 353,
                      height: 40,
                      child: TextFormField(
                        key: ValueKey('telephone'),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 4) {
                            return 'Veuillez entrer au moins 4 caractères';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                            hintText: 'Numero de telephone de la pharmacie'),
                        onSaved: (value) {
                          _pharmacyTelephone = value!;
                        },
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 353,
                    height: 40,
                    child: TextFormField(
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Veuillez entrer une addresse mail valide';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                          hintText: 'E-mail de la pharmacie'),
                      onSaved: (value) {
                        _pharmacyEmail = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 353,
                    height: 40,
                    child: TextFormField(
                      key: ValueKey('mdp'),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 7) {
                          return 'Le mot de passe doit avoir au moins 7 caractères';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                          hintText: 'Mot de passe'),
                      obscureText: true,
                      onSaved: (value) {
                        _pharmacyPassword = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (!_isLogin)
                    SizedBox(
                      width: 353,
                      height: 200,
                      child: TextFormField(
                        key: ValueKey('desc'),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 7) {
                            return 'Veuillez saisir une description claire';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                            hintText: 'Description'),
                        onSaved: (value) {
                          _pharmacyDescription = value!;
                        },
                      ),
                    ),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                        onPressed: _trySubmit,
                        child: Text(
                          'Continuer',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )),
                  if (!widget.isLoading)
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(
                          _isLogin
                              ? 'Creer un nouveau compte'
                              : 'J\'ai deja un compte',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        )),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
