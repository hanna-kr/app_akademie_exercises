import 'package:flutter/material.dart';

class MySizedBoxPage extends StatelessWidget {
  const MySizedBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 78, 94),
          title: const Text('Sized Box exercise'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 140,
                height: 140,
                child: const Text(
                  "Box 1",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                alignment: Alignment.center,
                color: Colors.green,
                width: 200,
                height: 100,
                child: const Text(
                  "Box 2",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                alignment: Alignment.center,
                color: Colors.red,
                width: 100,
                height: 200,
                child: const Text(
                  "Box 3",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ]),
          ],
        ));
  }
}
