import 'package:app_akademie_exercises/app.dart';
import 'package:app_akademie_exercises/src/presentation/5.6%20-%20/model/user.dart';
import 'package:app_akademie_exercises/styles/spacing.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<String>('dataBox');
  await Hive.openBox<String>('profilePictureBox');

  if (kDebugMode || kReleaseMode) {
    ErrorWidget.builder = (details) => Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                size: 80,
                color: Colors.red.shade700,
              ),
              kSpacing16,
              const Text(
                'Achtung, es ist ein Fehler aufgetreten!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          )),
        );
  }

  runApp(const MyApp());
}
