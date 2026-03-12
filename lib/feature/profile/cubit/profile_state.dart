part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<Users> users;
  final int counter;

  ProfileLoaded(this.users, {this.counter = 0});
}

class ProfileError extends ProfileState {}
