import 'package:flutter/material.dart';

class FutureExercise2 extends StatefulWidget {
  const FutureExercise2({super.key});

  @override
  State<FutureExercise2> createState() => _FutureExercise2State();
}

class _FutureExercise2State extends State<FutureExercise2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Futures'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
