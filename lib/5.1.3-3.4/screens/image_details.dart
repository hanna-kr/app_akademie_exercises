import 'dart:io';

import 'package:flutter/material.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Image Details'),
      ),
      body: Center(
        child: Image.file(File(image)),
      ),
    );
  }
}
