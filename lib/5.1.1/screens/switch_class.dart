import 'package:app_akademie_exercises/5.1.1/styles/placeholder.dart';
import 'package:app_akademie_exercises/5.1.1/styles/styles.dart';
import 'package:flutter/material.dart';

class SwitchExercisePage extends StatefulWidget {
  const SwitchExercisePage({super.key});

  @override
  State<SwitchExercisePage> createState() => _SwitchExercisePageState();
}

class _SwitchExercisePageState extends State<SwitchExercisePage> {
  bool switchOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Aufgabe 1'),
        ),
        body: Column(
          children: [
            placeholder1,
            Text(
              'Hello World!',
              style: kHeader1,
            ),
            placeholder1,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 24,
                ),
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.green,
                )
              ],
            ),
            placeholder1,
            Switch(
              // This bool value toggles the switch.
              value: switchOn,
              activeColor: Colors.blue,
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                setState(() {
                  switchOn = value;
                });
              },
            )
          ],
        ));
  }
}
