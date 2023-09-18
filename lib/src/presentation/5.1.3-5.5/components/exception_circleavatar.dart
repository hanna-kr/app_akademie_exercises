// ignore_for_file: avoid_print

import 'dart:io';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/classes/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

class ExceptionCircleAvatar extends StatefulWidget {
  const ExceptionCircleAvatar({super.key});

  @override
  State<ExceptionCircleAvatar> createState() => _CircleAvatarState();
}

class _CircleAvatarState extends State<ExceptionCircleAvatar> {
  IconData icon = Icons.person;

  String image = '';

  List exceptions = [
    DeactivatedCamera(cause: 'Camera permission deactivated'),
    ImagePickerException(cause: 'Image Picker faulty!'),
    SomethingWentWrong(cause: 'Unsteady network')
  ];

  Future pickImage() async {
    final temporaryImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      image = temporaryImage?.path ?? '';
    });
  }

  getRandomException() {
    int randomIndex = Random().nextInt(exceptions.length);
    var randomChoice = exceptions[randomIndex];
    return randomChoice;
  }

  triggerException() {
    try {
      throw getRandomException();
      // throw DeactivatedCamera(cause: 'Camera permission deactivated');
      // throw Exception('Camera permission not granted');
      // throw ImagePickerException(cause: 'Image Picker faulty!');
    } on ImagePickerException catch (error) {
      setState(() {
        icon = Icons.error;
        showDialog1(context);
      });
      print('Error: $error');
    } on DeactivatedCamera catch (error) {
      setState(() {
        icon = Icons.error;
        showDialog2(context);
        print(error);
      });
    } on SomethingWentWrong catch (error) {
      setState(() {
        icon = Icons.error;
        showDialog3(context);
        print(error);
      });
    } catch (error) {
      setState(() {});
      print('Error: $error');
    } finally {
      print('Clean up');
    }
  }

  Future<void> showDialog1(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Achtung:'),
          content: const Text('Dein Speicherplatz ist voll!'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showDialog2(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Achtung:'),
          content: const Text('Kamerazugriff ist deaktiviert!'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showDialog3(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Achtung:'),
          content: const Text('Ups, da ist was schief gelaufen!'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        triggerException();
      },
      child: Container(
          clipBehavior: Clip.hardEdge,
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
          child: image == ''
              ? Icon(
                  icon,
                  size: 40,
                  color: Colors.blueGrey,
                )
              : Image.file(
                  File(image),
                  fit: BoxFit.cover,
                )),
    );
  }
}
