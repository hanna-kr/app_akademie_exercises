import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyCircleAvatar extends StatefulWidget {
  const MyCircleAvatar({super.key});

  @override
  State<MyCircleAvatar> createState() => _CircleAvatarState();
}

class _CircleAvatarState extends State<MyCircleAvatar> {
  String image = '';

  Future pickImage() async {
    final temporaryImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      image = temporaryImage?.path ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickImage();
      },
      child: Container(
          clipBehavior: Clip.hardEdge,
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
          child: image == ''
              ? const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.blueGrey,
                )
              : Image.file(
                  File(image),
                  fit: BoxFit.cover,
                )),
    );
  }
}
