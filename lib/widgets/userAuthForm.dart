import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pharnacy/widgets/imagepicker.dart';
import 'package:pharnacy/pages/userTabsScreen.dart';

class UserAuthForm extends StatefulWidget {
  UserAuthForm(this.SubmitFn, this.isLoading);

  final bool isLoading;

  final void Function(
    String email,
    String mdp,
    String nom,
    File? image,
    String prenom,
    String telephone,
    String sexe,
    bool _isLogin,
    BuildContext ctx,
  ) SubmitFn;

  @override
  State<UserAuthForm> createState() => _UserAuthFormState();
}

class _UserAuthFormState extends State<UserAuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _userFirstName = '';
  var _userTelephone = '';
  var _userSexe = '';
  File? _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Veuillez selectionner une image!'),
        backgroundColor: Colors.redAccent,
      ));
      // return;
    }

    if (isValid && _userImageFile != null) {
      _formKey.currentState!.save();
      widget.SubmitFn(
          _userEmail.trim(),
          _userPassword.trim(),
          _userName.trim(),
          _userImageFile,
          _userFirstName.trim(),
          _userTelephone.trim(),
          _userSexe.trim(),
          _isLogin,
          context);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserTabsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text("Informations personnelles"),
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
                            hintText: 'Nom'),
                        onSaved: (value) {
                          _userName = value!;
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
                        key: ValueKey('prenom'),
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
                            hintText: 'Prenom'),
                        onSaved: (value) {
                          _userFirstName = value!;
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
                            hintText: 'Telephone'),
                        onSaved: (value) {
                          _userTelephone = value!;
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
                          hintText: 'E-mail'),
                      onSaved: (value) {
                        _userEmail = value!;
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
                        _userPassword = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (!_isLogin)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "SEXE",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("F",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                            value: "female",
                            groupValue: _userSexe,
                            onChanged: (value) {
                              setState(() {
                                _userSexe = value.toString();
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text("M",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                            value: "male",
                            groupValue: _userSexe,
                            onChanged: (value) {
                              setState(() {
                                _userSexe = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                        onPressed: _trySubmit,
                        child: Text(
                          'Continuer',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
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
