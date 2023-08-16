import 'package:app_akademie_exercises/styles/placeholder.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
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
          title: const Text('Switch exercise'),
        ),
        body: Column(
          children: [
            kPlaceholder48,
            Text(
              'Hello World!',
              style: kHeader1,
            ),
            kPlaceholder48,
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
            kPlaceholder48,
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
