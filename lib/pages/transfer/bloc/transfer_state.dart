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
