import 'package:app_akademie_exercises/styles/colors.dart';
import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:app_akademie_exercises/styles/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveExercisePage extends StatefulWidget {
  const HiveExercisePage({super.key});

  @override
  State<HiveExercisePage> createState() => _HiveExercisePageState();
}

class _HiveExercisePageState extends State<HiveExercisePage> {
  String text = '';
  Box<String> box = Hive.box<String>('dataBox');

  void createData() async {
    box.put('Text1', 'Hi there');
  }

  void readData() async {
    setState(() {
      text = box.get('Text1') ?? '';
    });
  }

  void updateData() async {
    box.put('Text1', 'How are you?');
  }

  void deleteData() async {
    box.delete('Text1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appAkademieColor.primaryColor,
        title: const Text('Hive'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            kSpacing32,
            ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  createData();
                },
                child: const Text('Create')),
            ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  readData();
                },
                child: const Text('Retrieve')),
            ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  updateData();
                },
                child: const Text('Update')),
            ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  deleteData();
                },
                child: const Text('Delete')),
          ],
        ),
      ),
    );
  }
}
