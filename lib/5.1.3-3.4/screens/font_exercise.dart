import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:flutter/material.dart';

class FontExercisePage extends StatefulWidget {
  const FontExercisePage({super.key});

  @override
  State<FontExercisePage> createState() => _FontExercisePageState();
}

class _FontExercisePageState extends State<FontExercisePage> {
  bool isExpanded = false;
  bool isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Font Exercise'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  width: 200,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(106, 255, 193, 7)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Hello world - this is a font exercise!',
                      style: kFancyHeader1,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Container(
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(42, 255, 193, 7)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla facilisi nullam vehicula ipsum a arcu. Placerat in egestas erat imperdiet sed euismod nisi.',
                        style: kRegularText1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: isExpanded ? 12 : 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          kSpacing16,
          Center(
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(106, 255, 193, 7)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Hello world!',
                            style: kFancyHeader2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded2 = !isExpanded2;
                          });
                        },
                        child: Container(
                          width: 200,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(42, 255, 193, 7)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla facilisi nullam vehicula ipsum a arcu. Placerat in egestas erat imperdiet sed euismod nisi.',
                              style: kRegularText2,
                              overflow: TextOverflow.clip,
                              maxLines: isExpanded2 ? 12 : 4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
