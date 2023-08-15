import 'package:app_akademie_exercises/5.1.1-1.2/styles/placeholder.dart';
import 'package:app_akademie_exercises/5.1.1-1.2/styles/styles.dart';
import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class BlobPackageExercise extends StatelessWidget {
  const BlobPackageExercise({super.key});

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
              duration: const Duration(milliseconds: 2000),
              loop: true,
              styles: BlobStyles(
                  color: const Color.fromARGB(105, 155, 39, 176),
                  fillType: BlobFillType.stroke),
              child: Center(
                child: Blob.animatedRandom(
                  size: 400,
                  duration: const Duration(milliseconds: 1500),
                  loop: true,
                  styles: BlobStyles(
                      color: const Color.fromARGB(105, 155, 39, 176),
                      fillType: BlobFillType.stroke),
                  child: Center(
                    child: Blob.animatedRandom(
                      size: 300,
                      duration: const Duration(milliseconds: 1000),
                      styles: BlobStyles(
                          gradient: LinearGradient(colors: [
                        Colors.purple.withOpacity(0.4),
                        Colors.cyan.withOpacity(0.4),
                      ]).createShader(const Rect.fromLTRB(0, 0, 300, 300))),
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
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
