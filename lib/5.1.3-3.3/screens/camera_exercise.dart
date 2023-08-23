import 'dart:io';

import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraExercise extends StatefulWidget {
  const CameraExercise({super.key});

  @override
  State<CameraExercise> createState() => _CameraExerciseState();
}

class _CameraExerciseState extends State<CameraExercise> {
  List<String> imagePath = [];

  Future<void> pickImage(ImageSource src) async {
    final images = await ImagePicker().pickMultiImage();
    setState(() {
      for (var image in images) {
        imagePath.add(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Camera / Gallery'),
      ),
      body: Column(
        children: [
          kSpacing16,
          Text(
            'Camera and Gallery',
            style: kHeader2,
          ),
          kSpacing16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pickImage(ImageSource.camera);
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor.withOpacity(0.7))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Icon(Icons.photo_camera),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      pickImage(ImageSource.gallery);
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).primaryColor.withOpacity(0.7))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Icon(Icons.photo),
                  )),
            ],
          ),
          kSpacing16,
          Text(
            'Recent pictures:',
            style: kHeader3,
          ),
          kSpacing8,
          if (imagePath.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: imagePath.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          imagePath.remove(imagePath[index]);
                        });
                      },
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.file(
                          File(imagePath[index]),
                          fit: BoxFit.cover,
                          width: 250,
                          height: 250,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
