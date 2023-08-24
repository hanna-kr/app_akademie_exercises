import 'package:flutter/material.dart';

class MyCircleAvatar extends StatefulWidget {
  const MyCircleAvatar({super.key});

  @override
  State<MyCircleAvatar> createState() => _CircleAvatarState();
}

class _CircleAvatarState extends State<MyCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor.withOpacity(0.2),
      ),
      child: Center(
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                size: 40,
              ))),
    );
  }
}
