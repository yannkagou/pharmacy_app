import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImage;

  void _pickImage() async {
    final pickedImageFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 200);
    setState(() {
      if (pickedImageFile != null) {
        setState(() {
          _pickedImage = File(pickedImageFile.path);
        });
      }
    });
    widget.imagePickFn(File(pickedImageFile!.path));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        TextButton.icon(
            onPressed: _pickImage,
            icon: Icon(Icons.image),
            label: Text(
              'Ajouter une photo',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            )),
      ],
    );
  }
}
