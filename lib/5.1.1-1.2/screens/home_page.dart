import 'package:app_akademie_exercises/5.1.1-1.2/styles/styles.dart';
import 'package:app_akademie_exercises/chapter_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('AppAkademie Übungen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SafeArea(
          child: ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (BuildContext context, int index) {
              final chapter = chapters[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      chapter.title,
                      style: kHeader1,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: chapter.exercises.length,
                    itemBuilder: (BuildContext context, int exerciseIndex) {
                      final exercise = chapter.exercises[exerciseIndex];
                      return Card(
                        child: ListTile(
                          tileColor: const Color.fromARGB(255, 255, 252, 240),
                          title: Text(
                            exercise.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, exercise.route);
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
