import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherApp({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Weather App"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Aktuelles Wetter in ${weatherData.city} : ${weatherData.temperature}",
              style: const TextStyle(
                  color: Color.fromARGB(255, 11, 123, 151), fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Wetter: ${weatherData.weatherCondition}",
              style: const TextStyle(
                  color: Color.fromARGB(255, 11, 123, 151), fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.sunny,
              size: 40,
              color: Colors.amber,
            )
          ],
        ),
      )),
    );
  }
}

class WeatherData {
  String city;
  double temperature;
  String weatherCondition;

  WeatherData(this.city, this.temperature, this.weatherCondition);
}
