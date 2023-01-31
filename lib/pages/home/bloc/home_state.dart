part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetAccountDetailSuccess extends HomeState {
  const GetAccountDetailSuccess(this.model);

  final DetailAccountResponseModel model;
  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'GetAccountDetailSuccess : ${model.toJson()}';
  }
}

class FailedState extends HomeState {
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