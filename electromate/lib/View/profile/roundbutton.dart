import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/session_manager.dart';

class RoundButton extends StatefulWidget {
  const RoundButton({
    required this.title,
    required this.onPress,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  final String title;
  final Null Function() onPress;
  final IconData iconData;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  bool _loading = false;
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        _loading
            ? CircularProgressIndicator()
            : GestureDetector(
                onTap: () async {
                  final imagePicker = ImagePicker();
                  final pickedImage =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      _image = File(pickedImage.path);
                    });
                  }
                },
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(
                          widget.iconData,
                          size: 75,
                          color: Colors.grey,
                        )
                      : null,
                ),
              ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () async {
                try {
                  setState(() {
                    _loading = true;
                  });
                  // Upload image to Firebase Storage
                  final ref = FirebaseStorage.instance
                      .ref()
                      .child('user_profile_images')
                      .child('${SessionController().userId}.jpg');
                  await ref.putFile(File(_image!.path));
                  // Get image url and update user profile
                  final imageUrl = await ref.getDownloadURL();
                  await FirebaseDatabase.instance
                      .ref('user/${SessionController().userId}')
                      .update({'imageUrl': imageUrl});
                  setState(() {
                    _loading = false;
                  });
                  Navigator.pop(context);
                } catch (error) {
                  setState(() {
                    _loading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Error uploading image. Try again later.'),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              child: Text(
                'OK',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
