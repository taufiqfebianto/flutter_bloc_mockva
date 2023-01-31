part of 'receipt_transfer_bloc.dart';

abstract class ReceiptTransferState extends Equatable {
  const ReceiptTransferState();
  
  @override
  List<Object> get props => [];
}

class ReceiptTransferInitial extends ReceiptTransferState {}

class FailedState extends ReceiptTransferState {
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