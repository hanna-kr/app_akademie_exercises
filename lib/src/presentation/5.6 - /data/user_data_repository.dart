import 'dart:convert';

import 'package:app_akademie_exercises/src/data/remote_service.dart';
import 'package:app_akademie_exercises/src/presentation/5.6%20-%20/model/user_http_exercise.dart';
import 'package:flutter/material.dart';

class UserDataRepository {
  RemoteDataSource dataSource = RemoteDataSource();
  String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User2>> fetchUserDataFromServer() async {
    try {
      dynamic response = await dataSource.getData(url);

      List<User2> users = (json.decode(response) as List)
          .map((val) => User2.fromJson(val))
          .toList();
      return users;
    } catch (err) {
      debugPrint(err.toString());
      return [];
    }
  }
}
