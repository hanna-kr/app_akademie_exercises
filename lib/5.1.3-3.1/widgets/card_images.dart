import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:flutter/material.dart';

class CardContents {
  Widget image;
  String title;
  String? subtitle;

  CardContents({required this.image, required this.title, this.subtitle});
}

class ImageCard extends StatefulWidget {
  final List<CardContents> adventures;

  const ImageCard({super.key, required this.adventures});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

bool favIsClicked = false;

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.adventures.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: widget.adventures[index].image,
                  ),
                  ListTile(
                    minLeadingWidth: 8,
                    title: Text(
                      widget.adventures[index].title,
                      style: kHeader2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    subtitle: Text(
                      widget.adventures[index].subtitle ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    trailing: IconButton(
                        alignment: Alignment.centerRight,
                        icon: Icon(
                          Icons.favorite,
                          color: favIsClicked
                              ? const Color.fromARGB(255, 202, 12, 75)
                              : null,
                        ),
                        onPressed: () {
                          setState(() {
                            favIsClicked = !favIsClicked;
                          });
                        }),
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
