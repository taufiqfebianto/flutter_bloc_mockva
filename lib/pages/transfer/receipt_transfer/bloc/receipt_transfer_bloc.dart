import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'receipt_transfer_event.dart';
part 'receipt_transfer_state.dart';

class ReceiptTransferBloc extends Bloc<ReceiptTransferEvent, ReceiptTransferState> {
  ReceiptTransferBloc() : super(ReceiptTransferInitial()) {
    on<ReceiptTransferEvent>((event, emit) {
      
    });
  }
}
