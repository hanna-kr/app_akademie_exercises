import 'dart:io';

import 'package:flutter/material.dart';

class MyGalleryTile extends StatelessWidget {
  final String imagePath;

  const MyGalleryTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(imagePath),
      fit: BoxFit.cover,
    );
  }
}
