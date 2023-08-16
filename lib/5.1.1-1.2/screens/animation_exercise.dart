import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool expanded = true;
  double fontSize = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Animation exercise'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 210,
              child: AnimatedDefaultTextStyle(
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 2000),
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello, App Akademie!',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              ),
              onPressed: () {
                setState(() {
                  fontSize = expanded ? 32 : 12;
                  expanded = !expanded; //kehrt die Anweisung um
                });
              },
              child: const Text('Click here!!'),
            ),
          ],
        ),
      ),
    );
  }
}
