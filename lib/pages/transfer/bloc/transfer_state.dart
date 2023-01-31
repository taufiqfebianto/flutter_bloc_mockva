part of 'transfer_bloc.dart';

abstract class TransferState extends Equatable {
  const TransferState();

  @override
  List<Object> get props => [];
}

class TransferInitial extends TransferState {}

class TransferInquirySuccessState extends TransferState {
  final TransferInquiryResponseModel model;
  const TransferInquirySuccessState(this.model);
  @override
  List<Object> get props => [model];
  @override
  String toString() {
    return 'TransferInquirySuccess : ${model.toJson()}';
  }
}

class FailedState extends TransferState {
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