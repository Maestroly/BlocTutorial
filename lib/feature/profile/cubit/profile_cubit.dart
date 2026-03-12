import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_name/core/service/api_service.dart';
import 'package:my_app_name/feature/profile/model/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ApiService apiService = ApiService();

  int counter = 0;

  ProfileCubit() : super(ProfileInitial()) {
    getUsers();
  }

  Future<void> getUsers() async {
    emit(ProfileLoading());

    try {
      final result = await apiService.getUsers();
      emit(ProfileLoaded(result.users ?? []));
    } catch (e) {
      emit(ProfileError());
    }
  }

  void increaseCounter() {
    counter++;
    if (state is ProfileLoaded) {
      emit(ProfileLoaded((state as ProfileLoaded).users, counter: counter));
    }
  }

  void decreaseCounter() {
    counter--;
    if (state is ProfileLoaded) {
      emit(ProfileLoaded((state as ProfileLoaded).users, counter: counter));
    }
  }
}
