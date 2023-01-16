import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transfer_confimration_event.dart';
part 'transfer_confimration_state.dart';

class TransferConfimrationBloc extends Bloc<TransferConfimrationEvent, TransferConfimrationState> {
  TransferConfimrationBloc() : super(TransferConfimrationInitial()) {
    on<TransferConfimrationEvent>((event, emit) {
      
    });
  }
}
