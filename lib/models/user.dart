import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String token;

  @HiveField(1)
  String username;

  @HiveField(2)
  String email;

  User({required this.token, required this.username, required this.email});
}