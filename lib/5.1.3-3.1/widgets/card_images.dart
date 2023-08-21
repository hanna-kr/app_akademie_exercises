import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:flutter/material.dart';

class CardContents {
  Widget image;
  String title;
  String? subtitle;

  CardContents({required this.image, required this.title, this.subtitle});
}

class ImageCard extends StatelessWidget {
  final List<CardContents> adventures;

  const ImageCard({super.key, required this.adventures});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: adventures.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: adventures[index].image,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      adventures[index].title,
                      style: kHeader2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    subtitle: Text(
                      adventures[index].subtitle ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    trailing: IconButton(
                        alignment: Alignment.centerRight,
                        icon: const Icon(Icons.favorite),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
