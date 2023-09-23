// ignore_for_file: camel_case_types

part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class changeObscurityState extends LoginState {}

class loadingLoginState extends LoginState {}

class successLoginState extends LoginState {}

class failedLoginState extends LoginState {
  final String error;
  failedLoginState(this.error);
}

class loadingRegisterState extends LoginState {}

class successRegisterState extends LoginState {}

class failedRegisterState extends LoginState {
  final String error;
  failedRegisterState(this.error);
}

class failedCreateUserState extends LoginState {
  final String error;
  failedCreateUserState(this.error);
}


