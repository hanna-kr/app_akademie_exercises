import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:flutter/material.dart';

class TrafficLight extends StatefulWidget {
  const TrafficLight({super.key});

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {
  Color trafficLight1 = Colors.red;
  Color trafficLight2 = Colors.grey;
  Color trafficLight3 = Colors.grey;
  bool showGif = false;

  void onButtonPressed2() {
    setState(() {
      trafficLight1 = Colors.red;
      trafficLight2 = Colors.grey;
      trafficLight3 = Colors.grey;
    });

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        trafficLight1 = Colors.grey;
        trafficLight2 = Colors.amber;
        trafficLight3 = Colors.grey;
      });
    });

    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        trafficLight1 = Colors.grey;
        trafficLight2 = Colors.grey;
        trafficLight3 = Colors.green;
        showGif = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Light Exercise'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(221, 37, 37, 37)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: trafficLight1),
                    width: 60,
                    height: 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: trafficLight2),
                    width: 60,
                    height: 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: trafficLight3),
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
            ),
            kSpacing32,
            ElevatedButton(
              onPressed: () {
                setState(() {
                  onButtonPressed2();
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).primaryColor.withOpacity(0.7))),
              child: const Text('Click n drive'),
            ),
            kSpacing16,
            if (showGif)
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  'assets/images/14Lo.gif',
                  width: 300,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
