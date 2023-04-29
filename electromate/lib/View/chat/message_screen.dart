// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Widgets/appBar.dart';

class MessageScreen extends StatefulWidget {
  final String image, name, email, receiverId;
  const MessageScreen({
    super.key,
    required this.name,
    required this.email,
    required this.image,
    required this.receiverId,
  });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child('chat');
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context, Text('Chat', style: TextStyle(color: Colors.black))),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return Text(
                        index.toString(),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: TextFormField(
                          controller: messageController,
                          cursorColor: Colors.blue,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(height: 0, fontSize: 19),
                          decoration: InputDecoration(
                            hintText: 'enter message',
                            contentPadding: const EdgeInsets.all(20),
                            suffixIcon: InkWell(
                              onTap: () {
                                sendMessage();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child:
                                      Icon(Icons.send, color: Colors.blueGrey),
                                ),
                              ),
                            ),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(height: 0, color: Colors.grey),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  sendMessage() {
    /*if (messageController.text.isEmpty) {
      Utils.toostMessage('Enter message');
    } else {*/
    final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    ref.child(timeStamp).set({
      'isSeen': false,
      'message': messageController.text.toString(),
      //  'sender': SessionController().userId.toString(),
      'receiver': widget.receiverId,
      'type': 'text',
      'time': timeStamp.toString()
    }).then((value) {
      messageController.clear();
    });
  }
}
//}
