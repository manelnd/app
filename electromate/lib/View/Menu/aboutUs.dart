// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Widgets/appBar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context, Text('About us', style: TextStyle(color: Colors.black))),
      extendBodyBehindAppBar: true,
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'About Us page.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
