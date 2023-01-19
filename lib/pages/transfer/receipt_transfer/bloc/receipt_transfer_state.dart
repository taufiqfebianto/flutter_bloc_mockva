part of 'receipt_transfer_bloc.dart';

abstract class ReceiptTransferState extends Equatable {
  const ReceiptTransferState();
  
  @override
  List<Object> get props => [];
}

class ReceiptTransferInitial extends ReceiptTransferState {}
