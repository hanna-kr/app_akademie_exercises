import 'package:app_akademie_exercises/5.1.3-3.1/widgets/card_images.dart';
import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ImageExercise extends StatelessWidget {
  const ImageExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 253, 246),
      appBar: AppBar(
        title: const Text('Images'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Text(
              'Find your next South African adventure',
              style: kFBHeader.copyWith(color: Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
            kSpacing16,
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              textAlign: TextAlign.center,
            ),
            kSpacing16,
            ImageCard(adventures: [
              CardContents(
                  image: Image.asset('assets/images/capetown.jpg'),
                  title: 'Cape Town',
                  subtitle:
                      'Cape Town has stunning landscapes, delicious cuisines and so many activities for all ages.'),
              CardContents(
                  image: Image.network(
                      'https://images.pexels.com/photos/4577129/pexels-photo-4577129.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  title: 'Kruger National Park',
                  subtitle:
                      'The Kruger National Park is the flagship of South Africas national parks and rated as the ultimate safari experience.'),
              CardContents(
                  image: CachedNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1542878909-b444d587c249?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80'),
                  title: 'Drakensberg',
                  subtitle:
                      'The Drakensberg Mountains form a dramatic natural border between Lesotho and South Africa. '),
              CardContents(
                  image: Image(
                      image: FileImage(
                          File('/Users/hanna/Development/tsitsikamma.jpeg'))),
                  title: 'Tsitsikamma National Park',
                  subtitle:
                      'Tsitsikamma National Park is a multi-dimensional destination with dramatic coastal scenery, reefs, rivers, lush forest and delicate Fynbos.')
            ])
          ],
        ),
      ),
    );
  }
}
