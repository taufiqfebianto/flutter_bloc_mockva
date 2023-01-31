part of 'transfer_confimration_bloc.dart';

abstract class TransferConfimrationState extends Equatable {
  const TransferConfimrationState();

  @override
  List<Object> get props => [];
}

class TransferConfimrationInitial extends TransferConfimrationState {}

class TransferConfirmationSuccessState extends TransferConfimrationState {
  final TransferResponseModel model;
  const TransferConfirmationSuccessState(this.model);
  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'TransferConfirmationSuccessState : ${model.toJson()}';
  }
}

class FailedState extends TransferConfimrationState {
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