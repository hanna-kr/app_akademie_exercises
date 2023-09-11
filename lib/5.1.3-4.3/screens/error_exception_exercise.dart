import 'dart:math';

import 'package:app_akademie_exercises/5.1.3-4.3/classes/exceptions.dart';

import 'package:flutter/material.dart';

class ExceptionErrorExercise2 extends StatefulWidget {
  const ExceptionErrorExercise2({super.key});

  @override
  State<ExceptionErrorExercise2> createState() => _MultiImageExerciseState();
}

class _MultiImageExerciseState extends State<ExceptionErrorExercise2> {
  List exceptions = [
    DeactivatedCamera(cause: 'Camera permission deactivated'),
    ImagePickerException(cause: 'Image Picker faulty!'),
    SomethingWentWrong(cause: 'Something went wrong')
  ];

  getRandomException() {
    int randomIndex = Random().nextInt(exceptions.length);
    var randomChoice = exceptions[randomIndex];
    return randomChoice;
  }

  triggerException() {
    try {
      throw getRandomException();
    } on ImagePickerException catch (error) {
      setState(() {
        showDialog1(context, 'Achtung:', 'Speicherplatz ist voll!');
      });
      debugPrint('Error: ${error.cause}');
    } on DeactivatedCamera catch (error) {
      setState(() {
        showDialog1(context, 'Achtung:', 'Kamerazugriff ist deaktiviert!');
        debugPrint('Error: ${error.cause}');
      });
    } on SomethingWentWrong catch (error) {
      setState(() {
        showDialog1(context, 'Achtung:', 'Ups, da ist was schief gelaufen!');
        debugPrint('Error: ${error.cause}');
      });
    } catch (error) {
      setState(() {});
      debugPrint('Error!!!');
    } finally {
      debugPrint('Clean up!!');
    }
  }

  Future<void> showDialog1(BuildContext context, String title, String content) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  triggerException();
                },
                child: const Text('ERROR')),
          ],
        ),
      ),
    );
  }
}
