import 'dart:io';
import 'package:app_akademie_exercises/styles/colors.dart';
import 'package:app_akademie_exercises/styles/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

File? imgFile;
String? imgPath;

class SaveImageLocallyPage extends StatefulWidget {
  const SaveImageLocallyPage({super.key});

  @override
  State<SaveImageLocallyPage> createState() => _SaveImageLocallyPageState();
}

class _SaveImageLocallyPageState extends State<SaveImageLocallyPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Image Locally"),
        backgroundColor: appAkademieColor.primaryColor,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            if (imgPath != null)
              Expanded(
                child: Image.file(File(imgPath!)),
              ),
            ElevatedButton(
              onPressed: () {
                getImg();
              },
              style: buttonStyle,
              child: const Text("Get Image"),
            ),

            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  deleteData();
                },
                style: buttonStyle,
                child: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }

  // get image from gallery
  void getImg() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      saveData(pickedImage.path.toString()); // path cache
      setState(() {
        imgFile = File(pickedImage.path);
      });
    }
  }

  void saveData(String val) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('path', val);
    getData();
  }

  void getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      imgPath = sharedPref.getString('path');
    });
  }

  void deleteData() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('path');
    getData();
  }
}
