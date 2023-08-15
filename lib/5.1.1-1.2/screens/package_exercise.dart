import 'package:flutter/material.dart';

class PackageExercise extends StatelessWidget {
  const PackageExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blobs package exercise'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
