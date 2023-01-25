part of 'transfer_confimration_bloc.dart';

abstract class TransferConfimrationEvent extends Equatable {
  const TransferConfimrationEvent();

  @override
  List<Object> get props => [];
}

class TransferConfirmationEvent extends TransferConfimrationEvent {
  final TransferRequestModel model;
  const TransferConfirmationEvent(this.model);

  @override
  List<Object> get props => [model];

  @override
  String toString() {
    return 'TransferConfirmationEvent : ${model.toJson()}';
  }
}
