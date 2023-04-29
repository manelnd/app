import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'session_manager.dart';
import '../View/profile/input_text.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileController with ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('user');
  //firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  final picker = ImagePicker();

  XFile? _image;
  XFile? get image => _image;

  bool _loading = false;
  bool get loading => _loading;

  Future pickGaleryImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
      uploadImage(context);
    }
  }

  Future pickCameraImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  void pickImage(context) {}

  void uploadImage(BuildContext context) async {}

  Future<void> showUserNameDialogAlert(BuildContext context, String name) {
    nameController.text = name;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Upload username'),
          content: SingleChildScrollView(
            child: ListView(
              children: [
                TextField(
                  controller: nameController,
                  focusNode: nameFocusNode,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  decoration: InputDecoration(hintText: 'enter name'),
                ),
              ],
            ),
          ),
          actions: [
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
              onPressed: () {
                ref
                    .child(SessionController().userId.toString())
                    .update({'userName': nameController.text.toString()});
                Navigator.pop(context);
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
        );
      },
    );
  }

  Future<void> showUserPhoneDialogAlert(
      BuildContext context, String phoneNumber) {
    TextEditingController phoneController =
        TextEditingController(text: phoneNumber);
    FocusNode phoneFocusNode = FocusNode();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Center(child: Text('Upload username')),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: phoneController,
                      focusNode: phoneFocusNode,
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'enter phone',
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
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
                    onPressed: () {
                      ref.child(SessionController().userId.toString()).update({
                        'phone': phoneController.text.toString(),
                      }).then((value) {
                        phoneController.clear();
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.grey),
                    )),
              ]);
        });
  }
}
