import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_app_name/feature/home/model/home_model.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = "https://dummyjson.com/comments";

  Future<List<Comments>> getPosts() async {
    try {
      final response = await dio.get(baseUrl);
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
}
