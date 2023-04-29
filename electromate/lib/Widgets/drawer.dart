// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:electromate/View/Menu/Setting.dart';
import 'package:electromate/View/Menu/aboutUs.dart';
import 'package:electromate/View/Menu/cart.dart';
import 'package:electromate/View/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Drawer buildDrawer(BuildContext context) {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  return Drawer(
    child: ListView(padding: EdgeInsets.zero, children: [
      const UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage('lib/images/user.png'),
        ),
        accountEmail: Text('name@example.com'),
        accountName: Text(
          'name',
          style: TextStyle(fontSize: 24.0),
        ),
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text(
          'profile',
          style: TextStyle(fontSize: 24.0),
        ),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const ProfileScreen(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.payment),
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 24.0),
        ),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const CartPage(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.apartment),
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 24.0),
        ),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => SettingsPage(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.question_mark),
        title: const Text(
          'About us',
          style: TextStyle(fontSize: 24.0),
        ),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const AboutUsPage(),
            ),
          );
        },
      ),
      const Divider(
        height: 10,
        thickness: 1,
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text(
          'Logout',
          style: TextStyle(fontSize: 24.0),
        ),
        //navigate to different page
        onTap: signUserOut,
      ),
    ]),
  );
}
