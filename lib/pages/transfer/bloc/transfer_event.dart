part of 'transfer_bloc.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class TransferInquiryEvent extends TransferEvent {
  final TransferInquiryRequestModel model;
  const TransferInquiryEvent(this.model);
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'TransferInquiryEvent : ';
  }
}
