import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;

  User({required this.firstName, required this.lastName});
}
