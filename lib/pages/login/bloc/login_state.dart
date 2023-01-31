part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class SignInSuccessState extends LoginState {
  const SignInSuccessState(this.model);
  final LoginResponseModel model;

  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'SignInSuccessState : ${model.toJson()}';
  }
}

class FailedState extends LoginState {
  const FailedState({this.message, this.statusCode, this.errorMessage});
  final String? message;
  final int? statusCode;
  final String? errorMessage;

  @override
  List<Object> get props => [message!, statusCode!, errorMessage!];

  @override
  String toString() =>
      'FailedState { message : $message, statusCode: $statusCode, errorMessage: $errorMessage }';
}
