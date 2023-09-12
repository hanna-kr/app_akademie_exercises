import 'dart:math';

import 'package:app_akademie_exercises/5.1.3-4.3/classes/exceptions.dart';
import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:flutter/material.dart';

class FutureExercise extends StatefulWidget {
  const FutureExercise({super.key});

  @override
  State<FutureExercise> createState() => _FutureExerciseState();
}

class _FutureExerciseState extends State<FutureExercise> {
  bool showText = false;
  bool showCount = false;
  String text = '';
  String text2 = '';
  List<int> numbers = List.generate(100, (index) => index + 1);
  List<Exception> exceptions = [
    DeactivatedCamera(cause: 'Camera permission deactivated'),
    ImagePickerException(cause: 'Image Picker faulty!'),
    SomethingWentWrong(cause: 'Something went wrong')
  ];

  void buttonFunction() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        text = 'Hello, Future!';
        text2 = 'Random Number: ${getRandomNumber()}';
        showText = true;
        showCount = true;
      });
    });
  }

  // void buttonFunction() {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     throw Exception('Netzwerk Fehler');
  //     return text;
  //   }).then(
  //       (value) => setState(() {
  //             text = 'Hello, Future!';
  //             text2 = 'Random Number: ${getRandomNumber()}';
  //             showText = true;
  //             showCount = true;
  //           }), onError: (error) {
  //     debugPrint(error.toString());
  //     setState(() {
  //       text = 'Fehler aufgetreten!';
  //       showText = true;
  //     });
  //   });
  // }

  void buttonErrorFunction() {
    Future.delayed(const Duration(seconds: 5), () {
      throw getRandomException();
      //return text;
    }).then((value) {
      setState(() {
        text = 'Hello, Future!';

        showText = true;
      });
    }).catchError((error, stackTrace) {
      setState(() {
        if (error is ImagePickerException) {
          text = 'Image Error: ${error.cause}';
        } else if (error is DeactivatedCamera) {
          text = 'Camera Error: ${error.cause}';
        } else if (error is SomethingWentWrong) {
          text = 'Error: ${error.cause}';
        } else {
          text = 'Unknown Error Occurred';
        }
        showText = true;
      });
      debugPrint(stackTrace);
    }).timeout(const Duration(seconds: 3), onTimeout: () {
      setState(() {
        text = 'Timeout';
        showText = true;
      });
    });
  }

  String getRandomNumber() {
    int randomIndex = Random().nextInt(numbers.length);
    var randomNumber = numbers[randomIndex];
    return randomNumber.toString();
  }

  void resetFunction() {
    setState(() {
      showText = false;
      showCount = false;
    });
  }

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
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).primaryColor.withOpacity(0.7))),
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
          title: const Text('Futures'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor.withOpacity(0.7))),
                onPressed: () {
                  buttonFunction();
                  resetFunction();
                },
                child: const Text('Aufgabe 1+2')),
            kSpacing32,
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor.withOpacity(0.7))),
                onPressed: () {
                  buttonErrorFunction();
                  resetFunction();
                },
                child: const Text('Aufgabe 3+4')),
            kSpacing32,
            if (showText)
              Text(
                text,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            kSpacing16,
            if (showCount)
              Column(
                children: [
                  const Text(
                    'Lucky Number:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    getRandomNumber(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            kSpacing32,
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor.withOpacity(0.7))),
                onPressed: () {
                  triggerException();
                },
                child: const Text('Error mit try catch'))
          ],
        )));
  }
}
