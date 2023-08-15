import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool first = true;
  double newFontSize = 12;

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
                    fontSize: newFontSize,
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
                  newFontSize = first ? 32 : 12;
                  first = !first;
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
