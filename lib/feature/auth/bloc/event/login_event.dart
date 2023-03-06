part of '../handle_api/login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class PostLogin extends LoginEvent {
  final String? userName;
  final String? password;

  PostLogin({this.userName, this.password});
  @override
  List<Object?> get props => [userName, password];
}
