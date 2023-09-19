import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class CircleAvatarCustom extends StatefulWidget {
  const CircleAvatarCustom({super.key});

  @override
  State<CircleAvatarCustom> createState() => _CircleAvatarCustomState();
}

class _CircleAvatarCustomState extends State<CircleAvatarCustom> {
  String image = '';

  Box<String> box = Hive.box<String>('profilePictureBox');

  // @override
  // void initState() {
  //   super.initState();
  //   getImage();
  // }

  Future pickImage() async {
    final temporaryImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (temporaryImage != null) {
      setState(() {
        image = temporaryImage.path;
      });
      saveImage();
    }
  }

  void saveImage() async {
    box.put('image1', image);
  }

  // void getImage() async {
  //   setState(() {
  //     box.delete('image1');
  //   });
  // }

  Future<String> getImage() async {
    return image = box.get('image1') ?? '';
  }

  void deleteImage() {
    box.delete('image1');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickImage();
      },
      onLongPress: () {
        setState(() {
          deleteImage();
        });
      },
      // child: Container(
      //     clipBehavior: Clip.hardEdge,
      //     width: 200,
      //     height: 200,
      //     decoration: BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: Theme.of(context).primaryColor.withOpacity(0.2),
      //     ),
      //     child: image == ''
      //         ? const Icon(
      //             Icons.person,
      //             size: 40,
      //             color: Colors.blueGrey,
      //           )
      //         : Image.file(
      //             File(image),
      //             fit: BoxFit.cover,
      //           )),
      child: FutureBuilder(
        future: getImage(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const CircularProgressIndicator();
          // } else
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data.toString().isNotEmpty) {
            return Container(
              clipBehavior: Clip.hardEdge,
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.2),
              ),
              child: Image.file(
                File(snapshot.data.toString()),
                fit: BoxFit.cover,
              ),
            );
          } else {
            return Container(
              clipBehavior: Clip.hardEdge,
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.blueGrey,
              ),
            );
          }
        },
      ),
    );
  }
}
