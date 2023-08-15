import 'package:app_akademie_exercises/5.1.1-1.2/styles/placeholder.dart';
import 'package:app_akademie_exercises/5.1.1-1.2/styles/styles.dart';
import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class PackageExercise extends StatelessWidget {
  const PackageExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blobs package exercise'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            Blob.animatedRandom(
              size: 400,
              duration: const Duration(milliseconds: 1000),
              styles: BlobStyles(color: const Color.fromARGB(21, 255, 193, 7)),
              loop: true,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quote:',
                    style: kHeader1,
                  ),
                  kPlaceholder8,
                  const Text(
                    '"blobbies are sexy"',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
