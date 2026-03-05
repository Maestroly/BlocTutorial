import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_name/core/service/api_service.dart';
import 'package:my_app_name/feature/home/model/home_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService = ApiService();

  HomeBloc() : super(HomeInitial()) {
    on<GetPostsEvent>(_onGetPostsEvent);
    add(GetPostsEvent());
  }

  Future<void> _onGetPostsEvent(GetPostsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final posts = await apiService.getPosts();
    emit(HomeLoadedState(posts));
  }
}
