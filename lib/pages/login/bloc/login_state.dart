part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class SignInSuccess extends LoginState {
  const SignInSuccess();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'SignInSuccess : ';
  }
}
