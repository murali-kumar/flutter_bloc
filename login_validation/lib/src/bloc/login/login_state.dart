part of 'login_bloc.dart';

abstract class LoginState {}

class LoginIntialState extends LoginState {}

class LoginLoadinState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}
