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
        showDialog1(context);
      });
      debugPrint('Error: $error');
    } on DeactivatedCamera catch (error) {
      setState(() {
        showDialog2(context);
        debugPrint('Error: $error');
      });
    } on SomethingWentWrong catch (error) {
      setState(() {
        showDialog3(context);
        debugPrint('Error: $error');
      });
    } catch (error) {
      setState(() {});
      debugPrint('Error: $error');
    } finally {
      debugPrint('Clean up');
    }
  }

  Future<void> showDialog1(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Achtung:'),
          content: const Text('Dein Speicherplatz ist voll!'),
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

  Future<void> showDialog2(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Achtung:'),
          content: const Text('Kamerazugriff ist deaktiviert!'),
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

  Future<void> showDialog3(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Achtung:'),
          content: const Text('Ups, da ist was schief gelaufen!'),
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
