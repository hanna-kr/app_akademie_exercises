import 'package:app_akademie_exercises/5.1.1-1.2/widgets/custom_material_button.dart';
import 'package:flutter/material.dart';

class MyCustomButtonPage extends StatelessWidget {
  const MyCustomButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Material Button'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCustomButton(
              color: Theme.of(context).primaryColor.withOpacity(0.6),
              icon: const Icon(
                Icons.home_filled,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
