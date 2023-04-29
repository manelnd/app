// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../Widgets/appBar.dart';
import '../../controllers/session_manager.dart';
import 'message_screen.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context, Text('users', style: TextStyle(color: Colors.black))),
      body: SafeArea(
        child: FirebaseAnimatedList(
            query: ref,
            itemBuilder: (context, snapshot, animation, index) {
              if (SessionController().userId.toString() ==
                  snapshot.child('uid').value.toString()) {
                return Container();
              } else {
                return Card(
                  child: ListTile(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: MessageScreen(
                          name: snapshot.child('userName').value.toString(),
                          image: snapshot.child('profile').value.toString(),
                          email: snapshot.child('email').value.toString(),
                          receiverId: snapshot.child('uid').value.toString(),
                        ),
                        withNavBar: false,
                      );
                    },
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: snapshot.child('profile').value.toString() == ''
                          ? Icon(Icons.person_outline)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(snapshot
                                      .child('profile')
                                      .value
                                      .toString())),
                            ),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
