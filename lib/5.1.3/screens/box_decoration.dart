import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:flutter/material.dart';

class BoxDecoExercise extends StatelessWidget {
  const BoxDecoExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Box Decoration'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                color: Colors.teal,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(98, 0, 150, 135),
                    blurRadius: 20,
                    offset: Offset(10, 10),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Flexible(
                      child: Center(
                        child: AspectRatio(
                          aspectRatio:
                              1.0, // Maintain original aspect ratio of the image
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1457089328109-e5d9bd499191?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=663&q=80',
                                ),
                                fit: BoxFit
                                    .cover, // Fit the image inside the container
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 8), // Add some space between the image and text
                    Center(
                      child: Text(
                        'Hello World',
                        style: kHeader1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
