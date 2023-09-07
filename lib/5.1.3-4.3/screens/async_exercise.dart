import 'dart:async';

import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:flutter/material.dart';

class AsyncExercise extends StatefulWidget {
  const AsyncExercise({super.key});

  @override
  State<AsyncExercise> createState() => _AsyncExerciseState();
}

class _AsyncExerciseState extends State<AsyncExercise> {
  Color box1 = Colors.grey;
  Color box2 = Colors.grey;
  String text1 = '';
  String text2 = '';
  String text3 = 'Click for Countdown';
  Timer countdownTimer = Timer(const Duration(), () {});
  bool showGif = false;

  void buttonFunction() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        box1 = Colors.purple;
        text1 = 'Hello';
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        box2 = Colors.teal;
        text2 = 'World';
      });
    });
  }

  void startCountdown() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }

    int countdown = 10;
    setState(() {
      text3 = 'Countdown: $countdown';
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          text3 = 'Countdown: $countdown';
          countdown--;
        });
      } else {
        setState(() {
          text3 = 'Click me again...';
          showGif = true;
        });
        timer.cancel();
      }
    });
  }

  void resetGif() {
    setState(() {
      showGif = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  buttonFunction();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).primaryColor.withOpacity(0.7),
                  ),
                ),
                child: const Text('Click me'),
              ),
              kSpacing32,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: box1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                text1,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: box2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                text2,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      kSpacing32,
                      GestureDetector(
                        onTap: () {
                          startCountdown();
                          resetGif();
                        },
                        child: Text(
                          text3,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      kSpacing16,
                      if (showGif)
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            'assets/images/1np8.gif',
                            width: 300,
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
