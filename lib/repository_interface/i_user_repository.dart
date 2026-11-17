import 'package:stepik_17_6/entities/user.dart';

abstract class IUserRepository {
  Future<User?> getUser(int id);
}