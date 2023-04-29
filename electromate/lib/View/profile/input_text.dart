/*// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
//import 'package:electromate/chat2/message_screen.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.myController,
    required this.focusNode,
    required this.onFiledSubmittedValue,
    required this.keyBoardType,
    required this.hint,
    this.enable = true,
    required this.onValidator,
    this.autoFocus = true,
    required bool obscureText,
    required Null Function(dynamic value) onFilesSubmittedvalue,
  });

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFiledSubmittedValue;
  final TextInputType keyBoardType;
  final String hint;
  final FormFieldValidator onValidator;
  final bool enable, autoFocus;

  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: messageController,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          hintText: 'enter message',
          enabled: enable,
          contentPadding: const EdgeInsets.all(20),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(height: 0, color: Colors.grey),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
*/