import 'package:app_akademie_exercises/src/presentation/5.6%20-%20/model/user_http_exercise.dart';
import 'package:app_akademie_exercises/src/presentation/5.6%20-%20/service/user_data_service.dart';
import 'package:app_akademie_exercises/styles/textstyles.dart';
import 'package:flutter/material.dart';

class HttpClientExercise extends StatefulWidget {
  const HttpClientExercise({super.key});

  @override
  State<HttpClientExercise> createState() => _HttpClientExerciseState();
}

class _HttpClientExerciseState extends State<HttpClientExercise> {
  UserDataService userdata = UserDataService();

  Future<void> dialogBuilder(BuildContext context, User2 user) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(user.name),
          content: Text(
              'Address: ${user.city}, ${user.streetName}, ${user.zipCode}'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('http client'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contacts',
                style: kHeader1,
              ),
            ),
            FutureBuilder(
                future: userdata.fetchUserData(),
                builder: (context, snapshot) {
                  debugPrint('test');
                  List<User2> userList = snapshot.data ?? [];
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView(
                          children: userList
                              .map((val) => Card(
                                    child: ListTile(
                                      leading: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.person,
                                          size: 36,
                                        ),
                                      ),
                                      title: Text(val.name),
                                      subtitle: Text(val.email),
                                      trailing: IconButton(
                                          icon: const Icon(Icons.info),
                                          onPressed: () =>
                                              dialogBuilder(context, val)),
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
