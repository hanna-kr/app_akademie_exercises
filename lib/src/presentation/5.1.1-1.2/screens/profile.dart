import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
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
            kSpacing48,
            Text(
              'Name:',
              style: kHeader2,
            ),
            kSpacing8,
            const Text('Toothy das Lama'),
            kSpacing16,
            Text(
              'Gewicht:',
              style: kHeader2,
            ),
            kSpacing8,
            const Text('180 kg'),
            kSpacing16,
            Text(
              'Größe:',
              style: kHeader2,
            ),
            kSpacing8,
            const Text('130 cm'),
            kSpacing16,
            Text(
              'Lieblingsessen:',
              style: kHeader2,
            ),
            kSpacing8,
            const Text('Salzstangen'),
          ],
        ),
      ),
    );
  }
}
