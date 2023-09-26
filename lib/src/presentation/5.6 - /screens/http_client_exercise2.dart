import 'dart:convert';

import 'package:app_akademie_exercises/src/presentation/5.6%20-%20/model/posts_http_exercise.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpExercisePage2 extends StatefulWidget {
  const HttpExercisePage2({super.key});

  @override
  State<HttpExercisePage2> createState() => _HttpExercisePage2State();
}

class _HttpExercisePage2State extends State<HttpExercisePage2> {
  bool isExpanded = false;

  Future<List<Post>> fetchPosts() async {
    Uri url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    http.Response response = await http.get(url);
    debugPrint(response.body);
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse.runtimeType == List) {
      return (jsonResponse as List).map((val) => Post.fromJson(val)).toList();
    } else {
      return [Post.fromJson(jsonResponse)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Zusatzaufgabe'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: fetchPosts(),
                builder: (context, snapshot) {
                  debugPrint('test');
                  List<Post> postList = snapshot.data ?? [];
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView(
                          children: postList
                              .map((val) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: ListTile(
                                        title: Text(
                                          val.title,
                                          style: kFancyHeader1,
                                          textAlign: TextAlign.center,
                                        ),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Text(
                                            val.text,
                                            style: kRegularText1,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList()),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ));
  }
}
