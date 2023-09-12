import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:flutter/material.dart';

class FutureExercise2 extends StatefulWidget {
  const FutureExercise2({super.key});

  @override
  State<FutureExercise2> createState() => _FutureExercise2State();
}

class _FutureExercise2State extends State<FutureExercise2> {
  String text = '';

  Future<void> randomFuture() {
    return Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        text = 'Hello, Future';
      });
    });
  }

  void randomFunction() async {
    await randomFuture();
    debugPrint('The result is: $text');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Futures II'),
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
                  randomFunction();
                },
                child: const Text('Click me')),
            kSpacing32,
            Text(text),
          ],
        ),
      ),
    );
  }
}
