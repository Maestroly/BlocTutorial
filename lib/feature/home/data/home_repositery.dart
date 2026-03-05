import 'package:my_app_name/feature/home/model/home_model.dart';

abstract class HomeRepositery {
  Future<List<Comments>> getPosts();
}
