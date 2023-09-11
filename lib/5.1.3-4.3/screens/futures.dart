import 'dart:math';

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
                child: const Text('Click me')),
            kSpacing32,
            if (showText)
              Text(
                text,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
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
              )
          ],
        )));
  }
}
