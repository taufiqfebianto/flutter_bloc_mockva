import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/models.dart';
import '../../../../repository/app_repo.dart';
import '../../../../shared/shared.dart';

part 'transfer_confimration_event.dart';
part 'transfer_confimration_state.dart';

class TransferConfimrationBloc
    extends Bloc<TransferConfimrationEvent, TransferConfimrationState> {
  TransferConfimrationBloc() : super(TransferConfimrationInitial()) {
    AppRepo repo = AppRepo();
    on<TransferConfimrationEvent>((event, emit) {});
    on<TransferConfirmationEvent>(
      (event, emit) async {
        try {
          TransferResponseModel response =
              await repo.transferConfirmation(model: event.model);
          emit(TransferConfirmationSuccessState(response));
        } on NetworkException catch (e) {
          emit(FailedState(
              message: e.responseMessage,
              statusCode: e.httpStatus,
              errorMessage: e.data));
        }
      },
    );
  }
}
