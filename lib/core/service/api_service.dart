import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_app_name/feature/home/model/home_model.dart';
import 'package:my_app_name/feature/profile/model/user_model.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = "https://dummyjson.com";

  Future<List<Comments>> getPosts() async {
    try {
      final response = await dio.get("$baseUrl/comments");
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> responseData = response.data;
        final List commentsJson = responseData['comments'];
        return commentsJson.map((json) => Comments.fromJson(json)).toList();
      } else {
        throw DioException(requestOptions: response.requestOptions, response: response);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUsers() async {
    try {
      print("API request gönderildi");
      final response = await dio.get("$baseUrl/users");
      print("Status code: ${response.statusCode}");
      print("Response data: ${response.data}");
      if (response.statusCode == HttpStatus.ok) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception("API error");
      }
    } catch (e) {
      print("API error: $e");
      rethrow;
    }
  }
}
