import 'package:app_akademie_exercises/styles/colors.dart';
import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBaseExercise extends StatefulWidget {
  const DataBaseExercise({super.key});

  @override
  State<DataBaseExercise> createState() => _DataBaseExerciseState();
}

class _DataBaseExerciseState extends State<DataBaseExercise> {
  String text = '';
  TextEditingController name = TextEditingController();

  void storeData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Text1', 'Hi there!');
  }

  void retrieveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      text = pref.getString('Text1') ?? '';
    });
  }

  void updateData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Text1', 'How are you?');
  }

  void deleteData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('Text1');
  }

  void storeName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Name1', name.text);
  }

  void retrieveName() async {
    SharedPreferences retrieve = await SharedPreferences.getInstance();
    setState(() {
      name.text = retrieve.getString('Name1') ?? 'empty';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datenbank'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Aufgabe 2', style: kHeader2),
              kSpacing16,
              Container(
                height: 50,
                width: 200,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueGrey)),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: kHeader3,
                  ),
                ),
              ),
              kSpacing16,
              ElevatedButton(
                onPressed: storeData,
                style: buttonStyle,
                child: const Text('Store Data'),
              ),
              ElevatedButton(
                onPressed: retrieveData,
                style: buttonStyle,
                child: const Text('Retrieve Data'),
              ),
              ElevatedButton(
                onPressed: updateData,
                style: buttonStyle,
                child: const Text('Update Data'),
              ),
              ElevatedButton(
                onPressed: deleteData,
                style: buttonStyle,
                child: const Text('Delete Data'),
              ),
              kSpacing32,
              Text('Aufgabe 3', style: kHeader2),
              kSpacing16,
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'Vorname',
                  hintText: 'Hier kannst du deinen Vornamen ändern',
                ),
              ),
              kSpacing16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: storeName,
                    style: buttonStyle,
                    child: const Text('speichern'),
                  ),
                  ElevatedButton(
                    onPressed: retrieveName,
                    style: buttonStyle,
                    child: const Text('abrufen'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
