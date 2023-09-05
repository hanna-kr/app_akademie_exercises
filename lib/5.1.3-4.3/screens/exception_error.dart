import 'package:app_akademie_exercises/5.1.3-4.3/components/exception_circleavatar.dart';
import 'package:app_akademie_exercises/5.1.3-4.3/components/gallery_list.dart';
import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:flutter/material.dart';

class ExceptionErrorExercise extends StatefulWidget {
  const ExceptionErrorExercise({super.key});

  @override
  State<ExceptionErrorExercise> createState() => _MultiImageExerciseState();
}

class _MultiImageExerciseState extends State<ExceptionErrorExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Multi Image Layout'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          children: [
            const ExceptionCircleAvatar(),
            kSpacing16,
            Text(
              'Username',
              style: kHeader3,
            ),
            kSpacing8,
            const Text('Location'),
            kSpacing32,
            Text(
              'Gallery',
              style: kHeader3,
            ),
            kSpacing8,
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            const MyGalleryList(),
          ],
        ),
      ),
    );
  }
}
