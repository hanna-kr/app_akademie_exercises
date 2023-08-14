import 'package:app_akademie_exercises/5.1.1/styles/placeholder.dart';
import 'package:app_akademie_exercises/5.1.1/styles/styles.dart';
import 'package:flutter/material.dart';

class AnimalProfilePage extends StatelessWidget {
  const AnimalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Steckbrief Lama'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: MediaQuery.of(context).size.width / 260,
              child: Image.network(
                'https://images.unsplash.com/photo-1613318286980-4b3dd8475772?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                fit: BoxFit.cover,
              ),
            ),
            placeholder1,
            Text(
              'Name:',
              style: kHeader2,
            ),
            placeholder2,
            Text('Toothy das Lama'),
            placeholder3,
            Text(
              'Gewicht:',
              style: kHeader2,
            ),
            placeholder2,
            Text('180 kg'),
            placeholder3,
            Text(
              'Größe:',
              style: kHeader2,
            ),
            placeholder2,
            Text('130 cm'),
            placeholder3,
            Text(
              'Lieblingsessen:',
              style: kHeader2,
            ),
            placeholder2,
            placeholder2,
            Text('Salzstangen'),
          ],
        ),
      ),
    );
  }
}
