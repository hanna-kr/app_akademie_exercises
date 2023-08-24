import 'dart:io';

import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyGalleryList extends StatefulWidget {
  const MyGalleryList({super.key});

  @override
  State<MyGalleryList> createState() => _MyGalleryListState();
}

class _MyGalleryListState extends State<MyGalleryList> {
  List<String> images = [];

  Future pickImages() async {
    final temporaryImages = await ImagePicker().pickMultiImage();

    setState(() {
      images =
          temporaryImages.map((temporaryImage) => temporaryImage.path).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).primaryColor.withOpacity(0.8))),
            onPressed: () {
              pickImages();
            },
            child: const Text('Choose Images'),
          ),
          kSpacing16,
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Image.file(
                    File(images[index]),
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/image_details',
                        arguments: images[index]);
                  },
                  onLongPress: () {
                    setState(() {
                      images.remove(images[index]);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
