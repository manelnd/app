import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  const ReusableRow({
    required this.title,
    required this.value,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  final String title;
  final String value;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.grey,
          size: 25,
        ),
        const SizedBox(width: 15),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
