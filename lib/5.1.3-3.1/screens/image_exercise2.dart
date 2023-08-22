import 'package:app_akademie_exercises/styles/spacing.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:flutter/material.dart';

class HotelProducts {
  String name;
  String imageUrl;
  String description;

  HotelProducts(
      {required this.imageUrl, required this.name, required this.description});
}

class ImageExercise2 extends StatelessWidget {
  ImageExercise2({super.key});

  final List<HotelProducts> hotels = [
    HotelProducts(
        imageUrl:
            'https://images.unsplash.com/photo-1563911302283-d2bc129e7570?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
        name: 'Beach resort BunBun',
        description:
            'A Resort in a unique location with a private pool and amazing sea view. Luxury rooms & suites with superior facilities.'),
    HotelProducts(
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1687960116497-0dc41e1808a2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80',
        name: 'Villa Takati',
        description:
            'Boasting a year-round outdoor pool, Takati Villas offers accommodation with free WiFi and free private parking for guests who drive.'),
    HotelProducts(
        imageUrl:
            'https://images.unsplash.com/photo-1558983925-7cd5dd39079b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
        name: 'Coco Beach Bungalows',
        description:
            'Situated just right on the beach, Coco Beach Bungalows are built in a traditional wooden style. Guests can enjoy spectacular sunsets.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 253, 246),
      appBar: AppBar(
        title: const Text('Images'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          kSpacing8,
          Text(
            'Some of the best beach holiday accommodations',
            style: kHeader1,
            textAlign: TextAlign.center,
          ),
          kSpacing16,
          Expanded(
            child: ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200, // Set the desired height
                          width: double.infinity, // Set the desired width
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              hotels[index].imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                    'https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg');
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                return loadingProgress == null
                                    ? child
                                    : LinearProgressIndicator(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.6),
                                        backgroundColor: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.3),
                                      );
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            hotels[index].name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          subtitle: Text(
                            hotels[index].description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
