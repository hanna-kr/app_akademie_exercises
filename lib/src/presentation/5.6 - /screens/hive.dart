import 'package:app_akademie_exercises/src/presentation/5.6%20-%20/components/circle_avatar.dart';
import 'package:app_akademie_exercises/styles/colors.dart';
import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
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
  TextEditingController controller = TextEditingController();
  Box<String> box = Hive.box<String>('dataBox');
  String keyText = 'Text1';

  void createData() async {
    box.put(keyText, 'Hiii');
  }

  void readData() async {
    setState(() {
      text = box.get(keyText) ?? '';
    });
  }

  void updateData() async {
    box.put(keyText, 'How are you?');
  }

  void deleteData() async {
    box.delete(keyText);
  }

  void createName() async {
    box.put('Name1', controller.text);
    debugPrint('hello');
  }

  void getName() async {
    setState(() {
      controller.text = box.get('Name1') ?? '';
    });
    debugPrint('hello2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appAkademieColor.primaryColor,
        title: const Text('Hive'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kSpacing16,
              Text(
                text,
                style: kHeader3,
              ),
              kSpacing16,
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
              kSpacing32,
              const Divider(
                thickness: 1,
              ),
              kSpacing32,
              const CircleAvatarCustom(),
              kSpacing32,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text('Name'),
                  ),
                  controller: controller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: buttonStyle,
                        onPressed: () {
                          createName();
                        },
                        child: const Icon(Icons.save)),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                        style: buttonStyle,
                        onPressed: () {
                          getName();
                        },
                        child: const Icon(Icons.check)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
