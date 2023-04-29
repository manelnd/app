// ignore_for_file: prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, Widget title) {
  return AppBar(
    title: title,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Builder(builder: (context) {
      return IconButton(
          icon: const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Icon(Icons.menu),
          ),
          color: Colors.black,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          });
    }),
  );
}
