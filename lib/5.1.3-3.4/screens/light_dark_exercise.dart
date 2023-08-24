import 'package:flutter/material.dart';

class LightDarkExercise extends StatefulWidget {
  final Function callBackFunction;
  const LightDarkExercise({super.key, required this.callBackFunction});

  @override
  State<LightDarkExercise> createState() => _LightDarkExerciseState();
}

class _LightDarkExerciseState extends State<LightDarkExercise> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LightMode / DarkMode'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                value: isDarkMode,
                onChanged: (bool value) {
                  setState(() {
                    isDarkMode = value;
                  });
                  widget.callBackFunction(isDarkMode);
                },
              ),
              Text(
                isDarkMode ? 'Dark Mode' : 'Light Mode',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
