// ignore_for_file: prefer_const_constructors

import 'package:electromate/controllers/profileController.dart';
import 'package:electromate/View/profile/roundbutton.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../Widgets/appBar.dart';
import '../../Widgets/reusable_row.dart';
import '../../controllers/session_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseDatabase.instance.reference().child('user');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context, Text('Profile', style: TextStyle(color: Colors.black))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        /*
        child: StreamBuilder(
          stream: ref.child(SessionController().userId.toString()).onValue,
          builder: (context, AsyncSnapshot<Event> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
             Map<dynamic, dynamic>? map =
             snapshot.data?.snapshot.value != null ? Map<dynamic, dynamic>.from(snapshot.data?.snapshot.value) : null;

              if (map == null) {
                return Center(child: Text('No data found'));
              }*/
        //return
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Stack(),
            const SizedBox(height: 40),
            /*
            GestureDetector(
              onTap: () {},
              child: ReusableRow(
                title: 'username',
                value: map['userName'],
                iconData: Icons.person_outline,
              ),
            ),
            ReusableRow(
              title: 'phone',
              value: map['phone'] == '' ? 'xxx-xxx-xxx' : map['phone'],
              iconData: Icons.phone,
            ),
            ReusableRow(
              title: 'email',
              value: map['email'],
              iconData: Icons.person_outline,
            ),
            const SizedBox(height: 40),
            RoundButton(
              title: 'Log out',
              onPress: () {},
              iconData: Icons.person_outline,
            ),
          ],
        ),
      ),
    );
  } /*else {
              return Center(child: Text('No data found'));
            }*/
            */
          ],
        ),
      ),
    );
  }
}
