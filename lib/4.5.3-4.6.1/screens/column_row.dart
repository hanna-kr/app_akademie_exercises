import 'package:flutter/material.dart';

class MyColumnRowPage extends StatelessWidget {
  const MyColumnRowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 78, 94),
          title: const Text('Column and Row exercise'),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('AB')]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('CD')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('E')],
            ),
          ],
        ));
  }
}
