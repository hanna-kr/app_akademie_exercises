import 'package:app_akademie_exercises/src/presentation/5.6%20-%20/data/user_data_repository.dart';
import 'package:app_akademie_exercises/src/presentation/5.6%20-%20/model/user_http_exercise.dart';

class UserDataService {
  UserDataRepository userDataRepo = UserDataRepository();

  Future<List<User2>> fetchUserData() async {
    return userDataRepo.fetchUserDataFromServer();
  }
}
