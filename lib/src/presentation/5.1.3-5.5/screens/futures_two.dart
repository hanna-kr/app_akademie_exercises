import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:flutter/material.dart';

class FutureExercise2 extends StatefulWidget {
  const FutureExercise2({super.key});

  @override
  State<FutureExercise2> createState() => _FutureExercise2State();
}

class _FutureExercise2State extends State<FutureExercise2> {
  String text = '';
  List<String> titles = [];
  List<Widget> images = [];

  Future<void> randomFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      text = 'Hello, Future';
    });
  }

  Future<void> getTitle() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      titles = [
        'Harry Potter - Stein der Weisen',
        'Harry Potter - Kammer des Schreckens',
        'Harry Potter - Gefangene von Askaban',
      ];
    });
  }

  Future<void> getImages() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      images = [
        Image.asset('assets/images/harry1.jpeg'),
        Image.asset('assets/images/harry2.jpeg'),
        Image.asset('assets/images/harry3.jpeg'),
      ];
    });
  }

  Future<void> getData() async {
    await getTitle();
    await getImages();
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
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor.withOpacity(0.7),
                ),
              ),
              onPressed: () {
                randomFuture();
              },
              child: const Text('Aufgabe 1'),
            ),
            kSpacing32,
            Text(text),
            kSpacing32,
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor.withOpacity(0.7),
                ),
              ),
              onPressed: () {
                getData();
              },
              child: const Text('Aufgabe 2'),
            ),
            kSpacing32,
            Column(
              children: titles.map((title) => Text(title)).toList(),
            ),
            kSpacing32,
            Column(
              children: images
                  .map((image) => SizedBox(
                        height: 100,
                        width: 100,
                        child: image,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
