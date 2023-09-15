import 'package:flutter/material.dart';

class MyColumnRowPage extends StatelessWidget {
  const MyColumnRowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
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
