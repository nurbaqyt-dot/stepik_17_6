import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:stepik_17_6/entities/user.dart';
import 'package:stepik_17_6/repository_interface/i_user_repository.dart';

class UserRemoteRepository implements IUserRepository {
  late Dio dio;

  UserRemoteRepository({Dio? dio}) {
    this.dio = dio ?? Dio();
  }

  @override
  Future<User?> getUser(int id) async {
    try {
      final response = await dio.get('https://reqres.in/api/users/$id');
      if (response.statusCode == 200) {
        return User(
          id: response.data['data']['id'],
          name:
              '${response.data['data']['first_name']} ${response.data['data']['last_name']}',
        );
      }
      return null;
    } on DioException catch (e) {
      debugPrint('Dio error: ${e.response?.statusCode} ${e.response?.data}');
      return null;
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}